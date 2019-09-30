from pddl_types import *

def save_domain(d, filename):
    with open(filename, "w") as f:
        for line in generate_domain_pddl(d):
            f.write(line + "\n")

def save_task(t, filename):
    with open(filename, "w") as f:
        for line in generate_task_pddl(t):
            f.write(line + "\n")


def print_domain(d):
    for line in generate_domain_pddl(d):
        print line

def print_condition(c):
    for line in generate_condition_pddl(c, 0):
        print line


def generate_lisp_list(l):
    elements = " ".join([e for e in l])
    return "(%s)" % elements


def generate_task_pddl(t):
    yield "(define (problem %s)" % t.name
    yield "(:domain %s)" % t.domain_name

    yield "(:objects"
    for obj in t.objects:
        yield "    " + obj
    yield ")"
    yield "(:init"
    for p in t.init:
        yield "   " + generate_lisp_list(p)
    yield ")"
    yield "(:goal"
    for line in generate_condition_pddl(t.goal, indent=4):
        yield line
    yield ")"
    yield ")"


def generate_domain_pddl(d):
    yield "(define (domain %s)" % d.name
    requirements = " ".join(d.requirements)
    yield "    (:requirements %s)" % requirements
    yield "    (:predicates"
    for p in d.predicates:
        yield "        " + generate_lisp_list(p)
    yield "    )"

    for action in d.actions:
        for line in generate_action_pddl(action):
            yield line
    yield ")"

def generate_action_pddl(action):
    yield "    (:action " + action.name
    yield "        :parameters " + generate_lisp_list(action.parameters)
    yield "        :precondition "
    for line in generate_condition_pddl(action.precondition, indent=8):
        yield line
    yield "        :effect "
    for line in generate_effect_pddl(action.effect, indent=8):
        yield line
    yield "    )"


def generate_condition_pddl(condition, indent):
    indent_str = " " * indent
    if isinstance(condition, AtomicCondition):
        yield indent_str + generate_lisp_list(condition.name)
    elif isinstance(condition, Conjunction):
        yield indent_str + "(and"
        for c in condition.conjuncts:
            for line in generate_condition_pddl(c, indent + 4):
                yield line
        yield indent_str + ")"
    elif isinstance(condition, Disjunction):
        yield indent_str + "(or"
        for c in condition.disjuncts:
            for line in generate_condition_pddl(c, indent + 4):
                yield line
        yield indent_str + ")"
    elif isinstance(condition, Negation):
        if isinstance(condition.negated_formula, AtomicCondition):
            yield indent_str + "(not %s)" % next(generate_condition_pddl(condition.negated_formula, 0))
        else:
            yield indent_str + "(not"
            for line in generate_condition_pddl(condition.negated_formula, indent + 4):
                yield line
            yield indent_str + ")"
    else:
        assert False, condition


def generate_effect_pddl(effect, indent):
    indent_str = " " * indent
    if isinstance(effect, AtomicEffect):
        yield indent_str + generate_lisp_list(effect.predicate)
    elif isinstance(effect, NegatedAtomicEffect):
        yield indent_str + "(not %s)" % generate_lisp_list(effect.predicate)
    elif isinstance(effect, ConjunctiveEffect):
        yield indent_str + "(and"
        for c in effect.conjuncts:
            for line in generate_effect_pddl(c, indent + 4):
                yield line
        yield indent_str + ")"
    elif isinstance(effect, ConditionalEffect):
        yield indent_str + "(when"
        for line in generate_condition_pddl(effect.condition, indent + 4):
            yield line
        for line in generate_effect_pddl(effect.subeffect, indent + 4):
            yield line
        yield indent_str + ")"
    else:
        assert False, effect
