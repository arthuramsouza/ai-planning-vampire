(define (problem p09-grounded)
(:domain vampire-grounded-for-p09)
(:objects
)
(:init
   (slayer-is-alive)
   (slayer-is-in-room1)
   (vampire-is-alive)
   (vampire-is-in-room8)
   (light-on-room1)
   (light-on-room4)
)
(:goal
    (and
        (slayer-is-alive)
        (not (vampire-is-alive))
        (slayer-is-in-room13)
    )
)
)
