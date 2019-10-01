(define (problem p04-grounded)
(:domain vampire-grounded-for-p04)
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
        (slayer-is-alive)
        (not (vampire-is-alive))
        (slayer-is-in-room2)
    )
)
)
