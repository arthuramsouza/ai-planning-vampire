(define (problem p01)
(:domain vampire)
;
; Room1 Room2 Room3 Room4 Room5
; 1S    0     1     0G    0V
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
    (light-on room3)

    (slayer-is-alive)
    (slayer-is-in room1)

    (vampire-is-alive)
    (vampire-is-in room5)

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
    (slayer-is-in room3)
))
)
