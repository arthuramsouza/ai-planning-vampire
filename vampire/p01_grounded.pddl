(define (problem p01-grounded)
(:domain vampire-grounded-for-p01)
(:objects
)
(:init
   (light-on-room1)
   (light-on-room3)
   (slayer-is-alive)
   (slayer-is-in-room1)
   (vampire-is-alive)
   (vampire-is-in-room5)
)
(:goal
    (and
        (slayer-is-alive)
        (not (vampire-is-alive))
        (slayer-is-in-room3)
    )
)
)
