#!/usr/bin/env python

import sys, os
from collections import defaultdict
from itertools import product

from parser import parse_instance_files
from pddl_printer import save_domain, save_task
from pddl_types import *


def predicates_in_effect(effect):
    if isinstance(effect, (AtomicEffect, NegatedAtomicEffect)):
        yield effect.predicate
    elif isinstance(effect, ConjunctiveEffect):
        for conjunct in effect.conjuncts:
            for p in predicates_in_effect(conjunct):
                yield p
    elif isinstance(effect, ConditionalEffect):
        for p in predicates_in_effect(effect.subeffect):
            yield p
    else:
        assert False


def predicates_in_conditions(effect):
    if isinstance(effect, (AtomicEffect, NegatedAtomicEffect)):
        return
    elif isinstance(effect, ConjunctiveEffect):
        for conjunct in effect.conjuncts:
            for p in predicates_in_conditions(conjunct):
                yield p
    elif isinstance(effect, ConditionalEffect):
        for p in predicates_in_condition(effect.condition):
            yield p
        for p in predicates_in_conditions(effect.subeffect):
            yield p
    else:
        assert False


def predicates_in_condition(condition):
    if isinstance(condition, AtomicCondition):
        yield condition.name
    elif isinstance(condition, Conjunction):
        for conjunct in condition.conjuncts:
            for p in predicates_in_condition(conjunct):
                yield p
    elif isinstance(condition, Disjunction):
        for disjunct in condition.disjuncts:
            for p in predicates_in_condition(disjunct):
                yield p
    elif isinstance(condition, Negation):
        for p in predicates_in_condition(condition.negated_formula):
            yield p
    else:
        assert False


def predicates_in_action(action):
    for p in predicates_in_effect(action.effect):
        yield p
    for p in predicates_in_conditions(action.effect):
        yield p
    for p in predicates_in_condition(action.precondition):
        yield p


def get_static_predicates(domain, task):
    static_predicates = {
        p[0]: set() for p in domain.predicates
    }
    for predicate in task.init:
        predicate_name = predicate[0]
        predicate_values = tuple(predicate[1:])
        static_predicates[predicate_name].add(predicate_values)

    for action in domain.actions:
        for affected_predicate in predicates_in_effect(action.effect):
            static_predicates.pop(affected_predicate[0], None)

    return static_predicates


def simplify_condition(condition):
    """
    returns a condition that is equivalent to the given condition but
    does not contain constants TRUE_CONDITION or FALSE_CONDITION.
    """
    if isinstance(condition, AtomicCondition):
        return condition
    elif isinstance(condition, Conjunction):
        conjuncts = []
        for c in condition.conjuncts:
            simple_c = simplify_condition(c)
            if simple_c == TRUE_CONDITION:
                continue
            elif simple_c == FALSE_CONDITION:
                return FALSE_CONDITION
            if isinstance(simple_c, Conjunction):
                conjuncts += simple_c.conjuncts
            else:
                conjuncts += [simple_c]
        if len(conjuncts) == 1:
            return conjuncts[0]
        atomic_conditions = set(c for c in conjuncts
            if isinstance(c, AtomicCondition))
        neg_atomic_conditions = set(c.negated_formula for c in conjuncts
            if isinstance(c, Negation) and isinstance(c.negated_formula, AtomicCondition))
        if atomic_conditions & neg_atomic_conditions:
            return FALSE_CONDITION
        return Conjunction(sorted(conjuncts))
    elif isinstance(condition, Disjunction):
        disjuncts = []
        for d in condition.disjuncts:
            simple_d = simplify_condition(d)
            if simple_d == TRUE_CONDITION:
                return TRUE_CONDITION
            elif simple_d == FALSE_CONDITION:
                continue
            if isinstance(simple_d, Disjunction):
                disjuncts += simple_d.disjuncts
            else:
                disjuncts += [simple_d]
        if len(disjuncts) == 1:
            return disjuncts[0]
        atomic_conditions = set(d for d in disjuncts
            if isinstance(d, AtomicCondition))
        neg_atomic_conditions = set(d.negated_formula for d in disjuncts
            if isinstance(d, Negation) and isinstance(d.negated_formula, AtomicCondition))
        if atomic_conditions & neg_atomic_conditions:
            return TRUE_CONDITION
        return Disjunction(sorted(disjuncts))
    elif isinstance(condition, Negation):
        negated_formula = simplify_condition(condition.negated_formula)
        if negated_formula == TRUE_CONDITION:
            return FALSE_CONDITION
        if negated_formula == FALSE_CONDITION:
            return TRUE_CONDITION
        if isinstance(negated_formula, Negation):
            return negated_formula.negated_formula
        return Negation(negated_formula)
    else:
        assert False


def get_grounded_predicate(predicate, parameters):
    predicate_name = predicate[0]
    predicate_values = tuple(parameters.get(v) for v in predicate[1:])
    if None in predicate_values:
        print "unknown parameter in predicate: ", predicate
    grounded_predicate = "-".join([predicate_name] + list(predicate_values))
    return tuple([grounded_predicate])


def get_grounded_atomic_condition(predicate, parameters, static_predicates):
    predicate_name = predicate[0]
    predicate_values = tuple(parameters.get(v) for v in predicate[1:])
    if static_predicates and predicate_name in static_predicates:
        if predicate_values in static_predicates[predicate_name]:
            return TRUE_CONDITION
        else:
            return FALSE_CONDITION
    else:
        grounded_predicate = get_grounded_predicate(predicate, parameters)
        return AtomicCondition(grounded_predicate)


def ground_effect(effect, parameters, static_predicates):
    if isinstance(effect, AtomicEffect):
        return AtomicEffect(get_grounded_predicate(effect.predicate, parameters))
    elif isinstance(effect, NegatedAtomicEffect):
        return NegatedAtomicEffect(get_grounded_predicate(effect.predicate, parameters))
    elif isinstance(effect, ConjunctiveEffect):
        conjuncts = [ground_effect(c, parameters, static_predicates) for c in effect.conjuncts]
        return ConjunctiveEffect(conjuncts)
    elif isinstance(effect, ConditionalEffect):
        condition = ground_condition(effect.condition, parameters, static_predicates)
        subeffect = ground_effect(effect.subeffect, parameters, static_predicates)
        return ConditionalEffect(condition, subeffect)
    else:
        assert False


def ground_condition(condition, parameters, static_predicates):
    if isinstance(condition, AtomicCondition):
        return get_grounded_atomic_condition(condition.name, parameters, static_predicates)
    elif isinstance(condition, Conjunction):
        conjuncts = [ground_condition(c, parameters, static_predicates) for c in condition.conjuncts]
        return Conjunction(conjuncts)
    elif isinstance(condition, Disjunction):
        disjuncts = [ground_condition(d, parameters, static_predicates) for d in condition.disjuncts]
        return Disjunction(disjuncts)
    elif isinstance(condition, Negation):
        return Negation(ground_condition(condition.negated_formula, parameters, static_predicates))
    else:
        assert False


def ground_action(action, objects, static_predicates):
    # This is very inefficient but it should be ok for the exercises.
    for values in product(objects, repeat=len(action.parameters)):
        parameters = dict(zip(action.parameters, values))
        grounded_name = "-".join([action.name] + list(values))
        grounded_action = Action(grounded_name)
        grounded_action.parameters = []
        grounded_action.effect = ground_effect(action.effect, parameters, static_predicates)
        grounded_action.precondition = ground_condition(action.precondition, parameters, static_predicates)
        grounded_action.precondition = simplify_condition(grounded_action.precondition)
        if grounded_action.precondition != FALSE_CONDITION:
            yield grounded_action


def ground_init(init, static_predicates):
    grounded_init = []
    for p in init:
        if p[0] not in static_predicates:
            grounded_init.append(tuple(["-".join(p)]))
    return grounded_init


def ground_goal(goal):
    if isinstance(goal, AtomicCondition):
        return AtomicCondition(tuple(["-".join(goal.name)]))
    elif isinstance(goal, Conjunction):
        return Conjunction([ground_goal(c) for c in goal.conjuncts])
    elif isinstance(goal, Disjunction):
        return Disjunction([ground_goal(d) for d in goal.disjuncts])
    elif isinstance(goal, Negation):
        return Negation(ground_goal(goal.negated_formula))
    else:
        assert False


def ground(domain, task):
    def fail(msg):
        print msg
        sys.exit(1)

    static_predicates = get_static_predicates(domain, task)

    grounded_actions = {}
    for action in domain.actions:
        for ga in ground_action(action, task.objects, static_predicates):
            if ga in grounded_actions:
                fail("Error: Action names are not unique after grounding. Duplicate action: " + ga.name)
            grounded_actions[ga.name] = ga

    used_predicates = set()
    for a in grounded_actions.values():
        used_predicates |= set(predicates_in_action(a))

    grounded_domain = Domain()
    grounded_domain.name = domain.name + "-grounded-for-" + task.name
    grounded_domain.requirements = domain.requirements
    grounded_domain.predicates = sorted(used_predicates)
    grounded_domain.actions = [a for k, a in sorted(grounded_actions.items())]

    grounded_task = Task()
    grounded_task.name = task.name + "-grounded"
    grounded_task.domain_name = grounded_domain.name
    grounded_task.objects = []
    grounded_task.init = ground_init(task.init, static_predicates)
    grounded_task.goal = ground_goal(task.goal)
    return grounded_domain, grounded_task


def make_grounded_filenames(domain_filename, task_filename):
    domain_path, domain_ext = os.path.splitext(domain_filename)
    task_path, task_ext = os.path.splitext(task_filename)
    task_name = os.path.basename(task_path)
    grounded_domain_filename = domain_path + "_grounded_for_" + task_name + domain_ext
    grounded_task_filename = task_path + "_grounded" + task_ext
    return grounded_domain_filename, grounded_task_filename


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print "expected domain and task filename as the only parameters."
        sys.exit(1)
    domain_filename, task_filename = sys.argv[1:]
    domain, task = parse_instance_files(domain_filename, task_filename)
    grounded_domain, grounded_task = ground(domain, task)
    grounded_domain_filename, grounded_task_filename = make_grounded_filenames(domain_filename, task_filename)
    save_domain(grounded_domain, grounded_domain_filename)
    save_task(grounded_task, grounded_task_filename)
