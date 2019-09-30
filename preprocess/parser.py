try:
    # Python 3.x
    from builtins import open as file_open
except ImportError:
    # Python 2.x
    from codecs import open as file_open

from pddl_types import *


class ParseError(Exception):
    def __init__(self, value):
        self.value = value
    def __str__(self):
        return self.value


# Basic functions for parsing PDDL (Lisp) files.
def parse_nested_list(input_file):
    tokens = tokenize(input_file)
    next_token = next(tokens)
    if next_token != "(":
        raise ParseError("Expected '(', got %s." % next_token)
    result = list(parse_list_aux(tokens))
    for tok in tokens:  # Check that generator is exhausted.
        raise ParseError("Unexpected token: %s." % tok)
    return result


def tokenize(input):
    for line in input:
        line = line.split(";", 1)[0]  # Strip comments.
        try:
            line.encode("ascii")
        except UnicodeEncodeError:
            raise ParseError("Non-ASCII character outside comment: %s" %
                             line[0:-1])
        line = line.replace("(", " ( ").replace(")", " ) ").replace("?", " ?")
        for token in line.split():
            yield token.lower()


def parse_list_aux(tokenstream):
    # Leading "(" has already been swallowed.
    while True:
        try:
            token = next(tokenstream)
        except StopIteration:
            raise ParseError("Missing ')'")
        if token == ")":
            return
        elif token == "(":
            yield list(parse_list_aux(tokenstream))
        else:
            yield token


def parse_condition(tokens):
    assert len(tokens) > 0
    assert isinstance(tokens[0], unicode)
    first_element = tokens[0].lower().strip()

    if first_element in "and":
        return Conjunction([parse_condition(elem) for elem in tokens[1:]])
    elif first_element in "or":
        return Disjunction([parse_condition(elem) for elem in tokens[1:]])
    elif first_element in "not":
        assert len(tokens[1:]) == 1
        return Negation(parse_condition(tokens[1]))
    else:
        assert all(isinstance(t, unicode) for t in tokens)
        return AtomicCondition(tokens)


def parse_effect(tokens):
    assert len(tokens) > 0
    assert isinstance(tokens[0], unicode)
    first_element = tokens[0].lower().strip()

    if first_element in "and":
        return ConjunctiveEffect([parse_effect(elem) for elem in tokens[1:]])
    elif first_element in "not":
        assert len(tokens[1:]) == 1
        predicate = tokens[1]
        assert all(isinstance(s, unicode) for s in predicate)
        return NegatedAtomicEffect(predicate)
    elif first_element in "when":
        assert len(tokens[1:]) == 2
        condition = parse_condition(tokens[1])
        effect = parse_effect(tokens[2])
        return ConditionalEffect(condition, effect)
    else:
        assert all(isinstance(t, unicode) for t in tokens)
        return AtomicEffect(tokens)

def parse_action(tokens):
    assert len > 1
    action = Action(tokens[0])
    expected_element = None
    for action_element in tokens[1:]:
        if expected_element is None:
            if action_element in [":parameters", ":precondition", ":effect"]:
                expected_element = action_element
            else:
                raise ParseError("Unknown element in action: '%s'" % action_element)
        else:

            if expected_element == ":parameters":
                action.parameters = action_element

            elif expected_element == ":precondition":
                action.precondition = parse_condition(action_element)

            elif expected_element == ":effect":
                action.effect = parse_effect(action_element)

            else:
                raise ParseError("Unknown element in action: '%s'" % action_element)
            expected_element = None
    return action

def parse_domain(tokens):
    assert len(tokens) > 1
    assert tokens[0] == "define"
    domain = Domain()
    for domain_element in tokens[1:]:
        assert len(domain_element) > 1

        if domain_element[0] == "domain":
            domain.name = domain_element[1]

        elif domain_element[0] == ":requirements":
            domain.requirements = domain_element[1:]

        elif domain_element[0] == ":predicates":
            domain.predicates = domain_element[1:]

        elif domain_element[0] == ":action":
            domain.actions.append(parse_action(domain_element[1:]))

        else:
            raise ParseError("Unknown element in domain: %s" % domain_element[0])

    return domain


def parse_task(tokens):
    assert len(tokens) > 1
    assert tokens[0] == "define"
    task = Task()
    for task_element in tokens[1:]:
        assert len(task_element) >= 1

        if task_element[0] == "problem":
            assert len(task_element) == 2
            task.name = task_element[1]

        elif task_element[0] == ":domain":
            assert len(task_element) == 2
            task.domain_name = task_element[1]

        elif task_element[0] == ":objects":
            task.objects = task_element[1:]

        elif task_element[0] == ":init":
            task.init = task_element[1:]

        elif task_element[0] == ":goal":
            assert len(task_element) == 2
            task.goal = parse_condition(task_element[1])

        else:
            raise ParseError("Unknown element in task: %s" % task_element[0])

    return task


def parse_lisp_file(filename):
    try:
        # The builtin open function is shadowed by this module's open function.
        # We use the Latin-1 encoding (which allows a superset of ASCII, of the
        # Latin-* encodings and of UTF-8) to allow special characters in
        # comments. In all other parts, we later validate that only ASCII is
        # used.
        return parse_nested_list(file_open(filename, encoding='ISO-8859-1'))
    except IOError as e:
        raise SystemExit("Error: Could not read file: %s\nReason: %s." %
                         (e.filename, e))
    except ParseError as e:
        raise SystemExit("Error: Could not parse %s file: %s\nReason: %s." %
                         (type, filename, e))


def parse_domain_file(filename):
    return parse_domain(parse_lisp_file(filename))


def parse_task_file(filename):
    return parse_task(parse_lisp_file(filename))


def parse_instance_files(domain_filename, task_filename):
    domain = parse_domain_file(domain_filename)
    task = parse_task_file(task_filename)
    assert domain.name == task.domain_name
    return domain, task
