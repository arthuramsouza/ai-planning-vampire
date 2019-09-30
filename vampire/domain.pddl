(define (domain vampire)
    (:requirements :conditional-effects)
    (:predicates
        (light-on ?r)
        (slayer-is-alive)
        (slayer-is-in ?r)
        (vampire-is-alive)
        (vampire-is-in ?r)
        (fighting)
        ;
        ; static predicates
        (NEXT-ROOM ?r ?rn)
        (CONTAINS-GARLIC ?r)
    )

    (:action toggle-light
        :parameters (?anti-clockwise-neighbor ?room ?clockwise-neighbor)
        :precondition (and
            (NEXT-ROOM ?anti-clockwise-neighbor ?room)
            (NEXT-ROOM ?room ?clockwise-neighbor)
            (not (fighting))
        )
        :effect (and
            (when
                ; when the light is on
                (light-on ?room)
                (and
                    (not (light-on ?room))
                    ; TODO
                )
            )
            (when
                ; when the light is off...
                (not (light-on ?room))
                (and
                    ; ...the light gets turned on
                    (light-on ?room)
                    (when
                        ; when the vampire is in the room...
                        (vampire-is-in ?room)
                        (and
                            ; ...the vampire leaves the room
                            (not (vampire-is-in ?room))
                            (and
                                (when
                                    ; when the anti-clockwise room is dark...
                                    (not (light-on ?anti-clockwise-neighbor))
                                    (and
                                        ; ...the vampire goes to the anti-clockwise room
                                        (vampire-is-in ?anti-clockwise-neighbor)
                                        (when
                                            ; when the slayer is in that same room...
                                            (slayer-is-in ?anti-clockwise-neighbor)
                                            ; ...the vampire and the slayer start fighting
                                            (fighting)
                                        )
                                    )

                                )
                                (when
                                    ; when the anti-clockwise room is bright,
                                    ; the vampire will go to the clockwise room whether it is dark or not
                                    (light-on ?anti-clockwise-neighbor)
                                    (and
                                        ; ...the vampire goes to the clockwise room
                                        (vampire-is-in ?clockwise-neighbor)
                                        (when
                                            ; when the slayer is in that same room...
                                            (slayer-is-in ?clockwise-neighbor)
                                            ; ...the vampire and the slayer start fighting
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

    (:action watch-fight
        :parameters (?room)
        :precondition (and
            (slayer-is-in ?room)
            (slayer-is-alive)
            (vampire-is-in ?room)
            (vampire-is-alive)
            (fighting)
        )
        :effect (and
            ; TO-DO
        )
    )
)
