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
                ; when the light is on...
                (light-on ?room)
                (and
                    ; ...the light gets turned off
                    (not (light-on ?room))
                    (when
                        ; when the slayer is in the room...
                        (slayer-is-in ?room)
                        (and
                            ; ...the slayer leaves the room
                            (not (slayer-is-in ?room))
                            (and
                                (when
                                    ; when the clockwise room is bright...
                                    (light-on ?clockwise-neighbor)
                                    (and
                                        ; ..the slayer goes to the clockwise room
                                        (slayer-is-in ?clockwise-neighbor)
                                        (when
                                            ; when the vampire is in that same room...
                                            (vampire-is-in ?clockwise-neighbor)
                                            ; ...the vampire and the slayer start fighting
                                            (fighting)
                                        )
                                    )
                                )
                                (when
                                    ; when the clockwise room is dark,
                                    ; the slayer will go to the anti-clockwise room whether it is bright or not
                                    (not (light-on ?clockwise-neighbor))
                                    (and
                                        ; ...the slayer goes to the clockwise room
                                        (slayer-is-in ?anti-clockwise-neighbor)
                                        (when
                                            ; when the vampire is in that same room...
                                            (vampire-is-in ?anti-clockwise-neighbor)
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
            (when
                (or
                    ; when the room is bright...
                    (light-on ?room)
                    ; ...or when the room is dark and has garlic in it...
                    (and
                        (not (light-on ?room))
                        (CONTAINS-GARLIC ?room)
                    )
                )
                ; ...the slayer defeats the vampire
                (and
                    (not (vampire-is-alive))
                    (not (vampire-is-in ?room))
                    (not (fighting))
                )
            )
            (when
                ; when the room is dark and there's no garlic inside it...
                (and
                    (not (light-on ?room))
                    (not (CONTAINS-GARLIC ?room))
                )
                ; ...the vampire defeats the slayer
                (and
                    (not (slayer-is-alive))
                    (not (slayer-is-in ?room))
                    (not (fighting))
                )
            )
        )
    )
)
