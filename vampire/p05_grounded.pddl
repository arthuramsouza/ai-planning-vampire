(define (problem p05-grounded)
(:domain vampire-grounded-for-p05)
(:objects
)
(:init
   (slayer-is-alive)
   (slayer-is-in-room3)
   (vampire-is-alive)
   (vampire-is-in-room1)
)
(:goal
    (and
        (vampire-is-alive)
        (not (slayer-is-alive))
    )
)
)
