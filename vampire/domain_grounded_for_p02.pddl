(define (domain vampire-grounded-for-p02)
    (:requirements :conditional-effects)
    (:predicates
        (fighting)
        (light-on-room1)
        (light-on-room2)
        (light-on-room3)
        (light-on-room4)
        (light-on-room5)
        (slayer-is-alive)
        (slayer-is-in-room1)
        (slayer-is-in-room2)
        (slayer-is-in-room3)
        (slayer-is-in-room4)
        (slayer-is-in-room5)
        (vampire-is-alive)
        (vampire-is-in-room1)
        (vampire-is-in-room2)
        (vampire-is-in-room3)
        (vampire-is-in-room4)
        (vampire-is-in-room5)
    )
    (:action toggle-light-room1-room2-room3
        :parameters ()
        :precondition 
        (not (fighting))
        :effect 
        (and
            (when
                (light-on-room2)
                (and
                    (not (light-on-room2))
                    (when
                        (slayer-is-in-room2)
                        (and
                            (not (slayer-is-in-room2))
                            (and
                                (when
                                    (light-on-room3)
                                    (and
                                        (slayer-is-in-room3)
                                        (when
                                            (vampire-is-in-room3)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (not (light-on-room3))
                                    (and
                                        (slayer-is-in-room1)
                                        (when
                                            (vampire-is-in-room1)
                                            (fighting)
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
            (when
                (not (light-on-room2))
                (and
                    (light-on-room2)
                    (when
                        (vampire-is-in-room2)
                        (and
                            (not (vampire-is-in-room2))
                            (and
                                (when
                                    (not (light-on-room1))
                                    (and
                                        (vampire-is-in-room1)
                                        (when
                                            (slayer-is-in-room1)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (light-on-room1)
                                    (and
                                        (vampire-is-in-room3)
                                        (when
                                            (slayer-is-in-room3)
                                            (fighting)
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
    (:action toggle-light-room2-room3-room4
        :parameters ()
        :precondition 
        (not (fighting))
        :effect 
        (and
            (when
                (light-on-room3)
                (and
                    (not (light-on-room3))
                    (when
                        (slayer-is-in-room3)
                        (and
                            (not (slayer-is-in-room3))
                            (and
                                (when
                                    (light-on-room4)
                                    (and
                                        (slayer-is-in-room4)
                                        (when
                                            (vampire-is-in-room4)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (not (light-on-room4))
                                    (and
                                        (slayer-is-in-room2)
                                        (when
                                            (vampire-is-in-room2)
                                            (fighting)
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
            (when
                (not (light-on-room3))
                (and
                    (light-on-room3)
                    (when
                        (vampire-is-in-room3)
                        (and
                            (not (vampire-is-in-room3))
                            (and
                                (when
                                    (not (light-on-room2))
                                    (and
                                        (vampire-is-in-room2)
                                        (when
                                            (slayer-is-in-room2)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (light-on-room2)
                                    (and
                                        (vampire-is-in-room4)
                                        (when
                                            (slayer-is-in-room4)
                                            (fighting)
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
    (:action toggle-light-room3-room4-room5
        :parameters ()
        :precondition 
        (not (fighting))
        :effect 
        (and
            (when
                (light-on-room4)
                (and
                    (not (light-on-room4))
                    (when
                        (slayer-is-in-room4)
                        (and
                            (not (slayer-is-in-room4))
                            (and
                                (when
                                    (light-on-room5)
                                    (and
                                        (slayer-is-in-room5)
                                        (when
                                            (vampire-is-in-room5)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (not (light-on-room5))
                                    (and
                                        (slayer-is-in-room3)
                                        (when
                                            (vampire-is-in-room3)
                                            (fighting)
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
            (when
                (not (light-on-room4))
                (and
                    (light-on-room4)
                    (when
                        (vampire-is-in-room4)
                        (and
                            (not (vampire-is-in-room4))
                            (and
                                (when
                                    (not (light-on-room3))
                                    (and
                                        (vampire-is-in-room3)
                                        (when
                                            (slayer-is-in-room3)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (light-on-room3)
                                    (and
                                        (vampire-is-in-room5)
                                        (when
                                            (slayer-is-in-room5)
                                            (fighting)
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
    (:action toggle-light-room4-room5-room1
        :parameters ()
        :precondition 
        (not (fighting))
        :effect 
        (and
            (when
                (light-on-room5)
                (and
                    (not (light-on-room5))
                    (when
                        (slayer-is-in-room5)
                        (and
                            (not (slayer-is-in-room5))
                            (and
                                (when
                                    (light-on-room1)
                                    (and
                                        (slayer-is-in-room1)
                                        (when
                                            (vampire-is-in-room1)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (not (light-on-room1))
                                    (and
                                        (slayer-is-in-room4)
                                        (when
                                            (vampire-is-in-room4)
                                            (fighting)
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
            (when
                (not (light-on-room5))
                (and
                    (light-on-room5)
                    (when
                        (vampire-is-in-room5)
                        (and
                            (not (vampire-is-in-room5))
                            (and
                                (when
                                    (not (light-on-room4))
                                    (and
                                        (vampire-is-in-room4)
                                        (when
                                            (slayer-is-in-room4)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (light-on-room4)
                                    (and
                                        (vampire-is-in-room1)
                                        (when
                                            (slayer-is-in-room1)
                                            (fighting)
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
    (:action toggle-light-room5-room1-room2
        :parameters ()
        :precondition 
        (not (fighting))
        :effect 
        (and
            (when
                (light-on-room1)
                (and
                    (not (light-on-room1))
                    (when
                        (slayer-is-in-room1)
                        (and
                            (not (slayer-is-in-room1))
                            (and
                                (when
                                    (light-on-room2)
                                    (and
                                        (slayer-is-in-room2)
                                        (when
                                            (vampire-is-in-room2)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (not (light-on-room2))
                                    (and
                                        (slayer-is-in-room5)
                                        (when
                                            (vampire-is-in-room5)
                                            (fighting)
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
            (when
                (not (light-on-room1))
                (and
                    (light-on-room1)
                    (when
                        (vampire-is-in-room1)
                        (and
                            (not (vampire-is-in-room1))
                            (and
                                (when
                                    (not (light-on-room5))
                                    (and
                                        (vampire-is-in-room5)
                                        (when
                                            (slayer-is-in-room5)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (light-on-room5)
                                    (and
                                        (vampire-is-in-room2)
                                        (when
                                            (slayer-is-in-room2)
                                            (fighting)
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
    (:action watch-fight-room1
        :parameters ()
        :precondition 
        (and
            (slayer-is-alive)
            (slayer-is-in-room1)
            (fighting)
            (vampire-is-in-room1)
            (vampire-is-alive)
        )
        :effect 
        (and
            (when
                (or
                    (light-on-room1)
                    (and
                        (not (light-on-room1))
                        (or
                        )
                    )
                )
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in-room1))
                    (not (fighting))
                )
            )
            (when
                (and
                    (not (light-on-room1))
                    (not
                        (or
                        )
                    )
                )
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in-room1))
                    (not (fighting))
                )
            )
        )
    )
    (:action watch-fight-room2
        :parameters ()
        :precondition 
        (and
            (slayer-is-in-room2)
            (slayer-is-alive)
            (vampire-is-in-room2)
            (vampire-is-alive)
            (fighting)
        )
        :effect 
        (and
            (when
                (or
                    (light-on-room2)
                    (and
                        (not (light-on-room2))
                        (or
                        )
                    )
                )
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in-room2))
                    (not (fighting))
                )
            )
            (when
                (and
                    (not (light-on-room2))
                    (not
                        (or
                        )
                    )
                )
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in-room2))
                    (not (fighting))
                )
            )
        )
    )
    (:action watch-fight-room3
        :parameters ()
        :precondition 
        (and
            (slayer-is-in-room3)
            (slayer-is-alive)
            (vampire-is-in-room3)
            (vampire-is-alive)
            (fighting)
        )
        :effect 
        (and
            (when
                (or
                    (light-on-room3)
                    (and
                        (not (light-on-room3))
                        (and
                        )
                    )
                )
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in-room3))
                    (not (fighting))
                )
            )
            (when
                (and
                    (not (light-on-room3))
                    (not
                        (and
                        )
                    )
                )
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in-room3))
                    (not (fighting))
                )
            )
        )
    )
    (:action watch-fight-room4
        :parameters ()
        :precondition 
        (and
            (slayer-is-in-room4)
            (slayer-is-alive)
            (vampire-is-in-room4)
            (vampire-is-alive)
            (fighting)
        )
        :effect 
        (and
            (when
                (or
                    (light-on-room4)
                    (and
                        (not (light-on-room4))
                        (and
                        )
                    )
                )
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in-room4))
                    (not (fighting))
                )
            )
            (when
                (and
                    (not (light-on-room4))
                    (not
                        (and
                        )
                    )
                )
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in-room4))
                    (not (fighting))
                )
            )
        )
    )
    (:action watch-fight-room5
        :parameters ()
        :precondition 
        (and
            (slayer-is-in-room5)
            (slayer-is-alive)
            (vampire-is-in-room5)
            (vampire-is-alive)
            (fighting)
        )
        :effect 
        (and
            (when
                (or
                    (light-on-room5)
                    (and
                        (not (light-on-room5))
                        (or
                        )
                    )
                )
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in-room5))
                    (not (fighting))
                )
            )
            (when
                (and
                    (not (light-on-room5))
                    (not
                        (or
                        )
                    )
                )
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in-room5))
                    (not (fighting))
                )
            )
        )
    )
)
