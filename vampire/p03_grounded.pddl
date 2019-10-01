(define (problem p03-grounded)
(:domain vampire-grounded-for-p03)
(:objects
)
(:init
   (slayer-is-alive)
   (slayer-is-in-room5)
   (vampire-is-alive)
   (vampire-is-in-room1)
)
(:goal
    (and
        (slayer-is-alive)
        (not (vampire-is-alive))
        (slayer-is-in-room3)
    )
)
)
