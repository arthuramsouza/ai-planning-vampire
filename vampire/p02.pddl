(define (problem p02)
(:domain vampire)
;
; Room1 Room2 Room3 Room4 Room5
; 1S    1     0G    1G    0V
;
(:objects
    room1
    room2
    room3
    room4
    room5
)
(:init
    (light-on room1)
    (light-on room2)
    (light-on room4)

    (slayer-is-alive)
    (slayer-is-in room1)

    (vampire-is-alive)
    (vampire-is-in room5)

    (CONTAINS-GARLIC room3)
    (CONTAINS-GARLIC room4)

    (NEXT-ROOM room1 room2)
    (NEXT-ROOM room2 room3)
    (NEXT-ROOM room3 room4)
    (NEXT-ROOM room4 room5)
    (NEXT-ROOM room5 room1)
)
(:goal (and
    (slayer-is-alive)
    (not (vampire-is-alive))
    (slayer-is-in room5)
))
)
