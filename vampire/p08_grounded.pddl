(define (problem p08-grounded)
(:domain vampire-grounded-for-p08)
(:objects
)
(:init
   (slayer-is-alive)
   (slayer-is-in-room1)
   (vampire-is-alive)
   (vampire-is-in-room6)
   (light-on-room1)
   (light-on-room4)
)
(:goal
    (and
        (slayer-is-alive)
        (not (vampire-is-alive))
        (slayer-is-in-room7)
    )
)
)
