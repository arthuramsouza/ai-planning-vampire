(define (domain vampire-grounded-for-p09)
    (:requirements :conditional-effects)
    (:predicates
        (fighting)
        (light-on-room1)
        (light-on-room10)
        (light-on-room11)
        (light-on-room12)
        (light-on-room13)
        (light-on-room14)
        (light-on-room15)
        (light-on-room2)
        (light-on-room3)
        (light-on-room4)
        (light-on-room5)
        (light-on-room6)
        (light-on-room7)
        (light-on-room8)
        (light-on-room9)
        (slayer-is-alive)
        (slayer-is-in-room1)
        (slayer-is-in-room10)
        (slayer-is-in-room11)
        (slayer-is-in-room12)
        (slayer-is-in-room13)
        (slayer-is-in-room14)
        (slayer-is-in-room15)
        (slayer-is-in-room2)
        (slayer-is-in-room3)
        (slayer-is-in-room4)
        (slayer-is-in-room5)
        (slayer-is-in-room6)
        (slayer-is-in-room7)
        (slayer-is-in-room8)
        (slayer-is-in-room9)
        (vampire-is-alive)
        (vampire-is-in-room1)
        (vampire-is-in-room10)
        (vampire-is-in-room11)
        (vampire-is-in-room12)
        (vampire-is-in-room13)
        (vampire-is-in-room14)
        (vampire-is-in-room15)
        (vampire-is-in-room2)
        (vampire-is-in-room3)
        (vampire-is-in-room4)
        (vampire-is-in-room5)
        (vampire-is-in-room6)
        (vampire-is-in-room7)
        (vampire-is-in-room8)
        (vampire-is-in-room9)
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
    (:action toggle-light-room10-room11-room12
        :parameters ()
        :precondition 
        (not (fighting))
        :effect 
        (and
            (when
                (light-on-room11)
                (and
                    (not (light-on-room11))
                    (when
                        (slayer-is-in-room11)
                        (and
                            (not (slayer-is-in-room11))
                            (and
                                (when
                                    (light-on-room12)
                                    (and
                                        (slayer-is-in-room12)
                                        (when
                                            (vampire-is-in-room12)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (not (light-on-room12))
                                    (and
                                        (slayer-is-in-room10)
                                        (when
                                            (vampire-is-in-room10)
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
                (not (light-on-room11))
                (and
                    (light-on-room11)
                    (when
                        (vampire-is-in-room11)
                        (and
                            (not (vampire-is-in-room11))
                            (and
                                (when
                                    (not (light-on-room10))
                                    (and
                                        (vampire-is-in-room10)
                                        (when
                                            (slayer-is-in-room10)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (light-on-room10)
                                    (and
                                        (vampire-is-in-room12)
                                        (when
                                            (slayer-is-in-room12)
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
    (:action toggle-light-room11-room12-room13
        :parameters ()
        :precondition 
        (not (fighting))
        :effect 
        (and
            (when
                (light-on-room12)
                (and
                    (not (light-on-room12))
                    (when
                        (slayer-is-in-room12)
                        (and
                            (not (slayer-is-in-room12))
                            (and
                                (when
                                    (light-on-room13)
                                    (and
                                        (slayer-is-in-room13)
                                        (when
                                            (vampire-is-in-room13)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (not (light-on-room13))
                                    (and
                                        (slayer-is-in-room11)
                                        (when
                                            (vampire-is-in-room11)
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
                (not (light-on-room12))
                (and
                    (light-on-room12)
                    (when
                        (vampire-is-in-room12)
                        (and
                            (not (vampire-is-in-room12))
                            (and
                                (when
                                    (not (light-on-room11))
                                    (and
                                        (vampire-is-in-room11)
                                        (when
                                            (slayer-is-in-room11)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (light-on-room11)
                                    (and
                                        (vampire-is-in-room13)
                                        (when
                                            (slayer-is-in-room13)
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
    (:action toggle-light-room12-room13-room14
        :parameters ()
        :precondition 
        (not (fighting))
        :effect 
        (and
            (when
                (light-on-room13)
                (and
                    (not (light-on-room13))
                    (when
                        (slayer-is-in-room13)
                        (and
                            (not (slayer-is-in-room13))
                            (and
                                (when
                                    (light-on-room14)
                                    (and
                                        (slayer-is-in-room14)
                                        (when
                                            (vampire-is-in-room14)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (not (light-on-room14))
                                    (and
                                        (slayer-is-in-room12)
                                        (when
                                            (vampire-is-in-room12)
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
                (not (light-on-room13))
                (and
                    (light-on-room13)
                    (when
                        (vampire-is-in-room13)
                        (and
                            (not (vampire-is-in-room13))
                            (and
                                (when
                                    (not (light-on-room12))
                                    (and
                                        (vampire-is-in-room12)
                                        (when
                                            (slayer-is-in-room12)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (light-on-room12)
                                    (and
                                        (vampire-is-in-room14)
                                        (when
                                            (slayer-is-in-room14)
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
    (:action toggle-light-room13-room14-room15
        :parameters ()
        :precondition 
        (not (fighting))
        :effect 
        (and
            (when
                (light-on-room14)
                (and
                    (not (light-on-room14))
                    (when
                        (slayer-is-in-room14)
                        (and
                            (not (slayer-is-in-room14))
                            (and
                                (when
                                    (light-on-room15)
                                    (and
                                        (slayer-is-in-room15)
                                        (when
                                            (vampire-is-in-room15)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (not (light-on-room15))
                                    (and
                                        (slayer-is-in-room13)
                                        (when
                                            (vampire-is-in-room13)
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
                (not (light-on-room14))
                (and
                    (light-on-room14)
                    (when
                        (vampire-is-in-room14)
                        (and
                            (not (vampire-is-in-room14))
                            (and
                                (when
                                    (not (light-on-room13))
                                    (and
                                        (vampire-is-in-room13)
                                        (when
                                            (slayer-is-in-room13)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (light-on-room13)
                                    (and
                                        (vampire-is-in-room15)
                                        (when
                                            (slayer-is-in-room15)
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
    (:action toggle-light-room14-room15-room1
        :parameters ()
        :precondition 
        (not (fighting))
        :effect 
        (and
            (when
                (light-on-room15)
                (and
                    (not (light-on-room15))
                    (when
                        (slayer-is-in-room15)
                        (and
                            (not (slayer-is-in-room15))
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
                                        (slayer-is-in-room14)
                                        (when
                                            (vampire-is-in-room14)
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
                (not (light-on-room15))
                (and
                    (light-on-room15)
                    (when
                        (vampire-is-in-room15)
                        (and
                            (not (vampire-is-in-room15))
                            (and
                                (when
                                    (not (light-on-room14))
                                    (and
                                        (vampire-is-in-room14)
                                        (when
                                            (slayer-is-in-room14)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (light-on-room14)
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
    (:action toggle-light-room15-room1-room2
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
                                        (slayer-is-in-room15)
                                        (when
                                            (vampire-is-in-room15)
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
                                    (not (light-on-room15))
                                    (and
                                        (vampire-is-in-room15)
                                        (when
                                            (slayer-is-in-room15)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (light-on-room15)
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
    (:action toggle-light-room4-room5-room6
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
                                    (light-on-room6)
                                    (and
                                        (slayer-is-in-room6)
                                        (when
                                            (vampire-is-in-room6)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (not (light-on-room6))
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
                                        (vampire-is-in-room6)
                                        (when
                                            (slayer-is-in-room6)
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
    (:action toggle-light-room5-room6-room7
        :parameters ()
        :precondition 
        (not (fighting))
        :effect 
        (and
            (when
                (light-on-room6)
                (and
                    (not (light-on-room6))
                    (when
                        (slayer-is-in-room6)
                        (and
                            (not (slayer-is-in-room6))
                            (and
                                (when
                                    (light-on-room7)
                                    (and
                                        (slayer-is-in-room7)
                                        (when
                                            (vampire-is-in-room7)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (not (light-on-room7))
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
                (not (light-on-room6))
                (and
                    (light-on-room6)
                    (when
                        (vampire-is-in-room6)
                        (and
                            (not (vampire-is-in-room6))
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
                                        (vampire-is-in-room7)
                                        (when
                                            (slayer-is-in-room7)
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
    (:action toggle-light-room6-room7-room8
        :parameters ()
        :precondition 
        (not (fighting))
        :effect 
        (and
            (when
                (light-on-room7)
                (and
                    (not (light-on-room7))
                    (when
                        (slayer-is-in-room7)
                        (and
                            (not (slayer-is-in-room7))
                            (and
                                (when
                                    (light-on-room8)
                                    (and
                                        (slayer-is-in-room8)
                                        (when
                                            (vampire-is-in-room8)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (not (light-on-room8))
                                    (and
                                        (slayer-is-in-room6)
                                        (when
                                            (vampire-is-in-room6)
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
                (not (light-on-room7))
                (and
                    (light-on-room7)
                    (when
                        (vampire-is-in-room7)
                        (and
                            (not (vampire-is-in-room7))
                            (and
                                (when
                                    (not (light-on-room6))
                                    (and
                                        (vampire-is-in-room6)
                                        (when
                                            (slayer-is-in-room6)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (light-on-room6)
                                    (and
                                        (vampire-is-in-room8)
                                        (when
                                            (slayer-is-in-room8)
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
    (:action toggle-light-room7-room8-room9
        :parameters ()
        :precondition 
        (not (fighting))
        :effect 
        (and
            (when
                (light-on-room8)
                (and
                    (not (light-on-room8))
                    (when
                        (slayer-is-in-room8)
                        (and
                            (not (slayer-is-in-room8))
                            (and
                                (when
                                    (light-on-room9)
                                    (and
                                        (slayer-is-in-room9)
                                        (when
                                            (vampire-is-in-room9)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (not (light-on-room9))
                                    (and
                                        (slayer-is-in-room7)
                                        (when
                                            (vampire-is-in-room7)
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
                (not (light-on-room8))
                (and
                    (light-on-room8)
                    (when
                        (vampire-is-in-room8)
                        (and
                            (not (vampire-is-in-room8))
                            (and
                                (when
                                    (not (light-on-room7))
                                    (and
                                        (vampire-is-in-room7)
                                        (when
                                            (slayer-is-in-room7)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (light-on-room7)
                                    (and
                                        (vampire-is-in-room9)
                                        (when
                                            (slayer-is-in-room9)
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
    (:action toggle-light-room8-room9-room10
        :parameters ()
        :precondition 
        (not (fighting))
        :effect 
        (and
            (when
                (light-on-room9)
                (and
                    (not (light-on-room9))
                    (when
                        (slayer-is-in-room9)
                        (and
                            (not (slayer-is-in-room9))
                            (and
                                (when
                                    (light-on-room10)
                                    (and
                                        (slayer-is-in-room10)
                                        (when
                                            (vampire-is-in-room10)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (not (light-on-room10))
                                    (and
                                        (slayer-is-in-room8)
                                        (when
                                            (vampire-is-in-room8)
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
                (not (light-on-room9))
                (and
                    (light-on-room9)
                    (when
                        (vampire-is-in-room9)
                        (and
                            (not (vampire-is-in-room9))
                            (and
                                (when
                                    (not (light-on-room8))
                                    (and
                                        (vampire-is-in-room8)
                                        (when
                                            (slayer-is-in-room8)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (light-on-room8)
                                    (and
                                        (vampire-is-in-room10)
                                        (when
                                            (slayer-is-in-room10)
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
    (:action toggle-light-room9-room10-room11
        :parameters ()
        :precondition 
        (not (fighting))
        :effect 
        (and
            (when
                (light-on-room10)
                (and
                    (not (light-on-room10))
                    (when
                        (slayer-is-in-room10)
                        (and
                            (not (slayer-is-in-room10))
                            (and
                                (when
                                    (light-on-room11)
                                    (and
                                        (slayer-is-in-room11)
                                        (when
                                            (vampire-is-in-room11)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (not (light-on-room11))
                                    (and
                                        (slayer-is-in-room9)
                                        (when
                                            (vampire-is-in-room9)
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
                (not (light-on-room10))
                (and
                    (light-on-room10)
                    (when
                        (vampire-is-in-room10)
                        (and
                            (not (vampire-is-in-room10))
                            (and
                                (when
                                    (not (light-on-room9))
                                    (and
                                        (vampire-is-in-room9)
                                        (when
                                            (slayer-is-in-room9)
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    (light-on-room9)
                                    (and
                                        (vampire-is-in-room11)
                                        (when
                                            (slayer-is-in-room11)
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
            (vampire-is-alive)
            (vampire-is-in-room1)
            (slayer-is-alive)
            (fighting)
            (slayer-is-in-room1)
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
    (:action watch-fight-room10
        :parameters ()
        :precondition 
        (and
            (slayer-is-in-room10)
            (slayer-is-alive)
            (vampire-is-in-room10)
            (vampire-is-alive)
            (fighting)
        )
        :effect 
        (and
            (when
                (or
                    (light-on-room10)
                    (and
                        (not (light-on-room10))
                        (or
                        )
                    )
                )
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in-room10))
                    (not (fighting))
                )
            )
            (when
                (and
                    (not (light-on-room10))
                    (not
                        (or
                        )
                    )
                )
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in-room10))
                    (not (fighting))
                )
            )
        )
    )
    (:action watch-fight-room11
        :parameters ()
        :precondition 
        (and
            (slayer-is-in-room11)
            (slayer-is-alive)
            (vampire-is-in-room11)
            (vampire-is-alive)
            (fighting)
        )
        :effect 
        (and
            (when
                (or
                    (light-on-room11)
                    (and
                        (not (light-on-room11))
                        (or
                        )
                    )
                )
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in-room11))
                    (not (fighting))
                )
            )
            (when
                (and
                    (not (light-on-room11))
                    (not
                        (or
                        )
                    )
                )
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in-room11))
                    (not (fighting))
                )
            )
        )
    )
    (:action watch-fight-room12
        :parameters ()
        :precondition 
        (and
            (slayer-is-in-room12)
            (slayer-is-alive)
            (vampire-is-in-room12)
            (vampire-is-alive)
            (fighting)
        )
        :effect 
        (and
            (when
                (or
                    (light-on-room12)
                    (and
                        (not (light-on-room12))
                        (or
                        )
                    )
                )
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in-room12))
                    (not (fighting))
                )
            )
            (when
                (and
                    (not (light-on-room12))
                    (not
                        (or
                        )
                    )
                )
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in-room12))
                    (not (fighting))
                )
            )
        )
    )
    (:action watch-fight-room13
        :parameters ()
        :precondition 
        (and
            (slayer-is-in-room13)
            (slayer-is-alive)
            (vampire-is-in-room13)
            (vampire-is-alive)
            (fighting)
        )
        :effect 
        (and
            (when
                (or
                    (light-on-room13)
                    (and
                        (not (light-on-room13))
                        (or
                        )
                    )
                )
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in-room13))
                    (not (fighting))
                )
            )
            (when
                (and
                    (not (light-on-room13))
                    (not
                        (or
                        )
                    )
                )
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in-room13))
                    (not (fighting))
                )
            )
        )
    )
    (:action watch-fight-room14
        :parameters ()
        :precondition 
        (and
            (slayer-is-in-room14)
            (slayer-is-alive)
            (vampire-is-in-room14)
            (vampire-is-alive)
            (fighting)
        )
        :effect 
        (and
            (when
                (or
                    (light-on-room14)
                    (and
                        (not (light-on-room14))
                        (or
                        )
                    )
                )
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in-room14))
                    (not (fighting))
                )
            )
            (when
                (and
                    (not (light-on-room14))
                    (not
                        (or
                        )
                    )
                )
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in-room14))
                    (not (fighting))
                )
            )
        )
    )
    (:action watch-fight-room15
        :parameters ()
        :precondition 
        (and
            (slayer-is-in-room15)
            (slayer-is-alive)
            (vampire-is-in-room15)
            (vampire-is-alive)
            (fighting)
        )
        :effect 
        (and
            (when
                (or
                    (light-on-room15)
                    (and
                        (not (light-on-room15))
                        (or
                        )
                    )
                )
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in-room15))
                    (not (fighting))
                )
            )
            (when
                (and
                    (not (light-on-room15))
                    (not
                        (or
                        )
                    )
                )
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in-room15))
                    (not (fighting))
                )
            )
        )
    )
    (:action watch-fight-room2
        :parameters ()
        :precondition 
        (and
            (slayer-is-alive)
            (slayer-is-in-room2)
            (vampire-is-alive)
            (fighting)
            (vampire-is-in-room2)
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
                        (or
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
                        (or
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
                        (or
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
                        (or
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
    (:action watch-fight-room6
        :parameters ()
        :precondition 
        (and
            (slayer-is-in-room6)
            (slayer-is-alive)
            (vampire-is-in-room6)
            (vampire-is-alive)
            (fighting)
        )
        :effect 
        (and
            (when
                (or
                    (light-on-room6)
                    (and
                        (not (light-on-room6))
                        (or
                        )
                    )
                )
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in-room6))
                    (not (fighting))
                )
            )
            (when
                (and
                    (not (light-on-room6))
                    (not
                        (or
                        )
                    )
                )
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in-room6))
                    (not (fighting))
                )
            )
        )
    )
    (:action watch-fight-room7
        :parameters ()
        :precondition 
        (and
            (slayer-is-in-room7)
            (slayer-is-alive)
            (vampire-is-in-room7)
            (vampire-is-alive)
            (fighting)
        )
        :effect 
        (and
            (when
                (or
                    (light-on-room7)
                    (and
                        (not (light-on-room7))
                        (and
                        )
                    )
                )
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in-room7))
                    (not (fighting))
                )
            )
            (when
                (and
                    (not (light-on-room7))
                    (not
                        (and
                        )
                    )
                )
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in-room7))
                    (not (fighting))
                )
            )
        )
    )
    (:action watch-fight-room8
        :parameters ()
        :precondition 
        (and
            (slayer-is-in-room8)
            (slayer-is-alive)
            (vampire-is-in-room8)
            (vampire-is-alive)
            (fighting)
        )
        :effect 
        (and
            (when
                (or
                    (light-on-room8)
                    (and
                        (not (light-on-room8))
                        (or
                        )
                    )
                )
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in-room8))
                    (not (fighting))
                )
            )
            (when
                (and
                    (not (light-on-room8))
                    (not
                        (or
                        )
                    )
                )
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in-room8))
                    (not (fighting))
                )
            )
        )
    )
    (:action watch-fight-room9
        :parameters ()
        :precondition 
        (and
            (slayer-is-in-room9)
            (slayer-is-alive)
            (vampire-is-in-room9)
            (vampire-is-alive)
            (fighting)
        )
        :effect 
        (and
            (when
                (or
                    (light-on-room9)
                    (and
                        (not (light-on-room9))
                        (or
                        )
                    )
                )
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in-room9))
                    (not (fighting))
                )
            )
            (when
                (and
                    (not (light-on-room9))
                    (not
                        (or
                        )
                    )
                )
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in-room9))
                    (not (fighting))
                )
            )
        )
    )
)
