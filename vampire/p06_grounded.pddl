(define (problem p06-grounded)
(:domain vampire-grounded-for-p06)
(:objects
)
(:init
   (slayer-is-alive)
   (slayer-is-in-room6)
   (vampire-is-alive)
   (vampire-is-in-room1)
)
(:goal
    (and
        (slayer-is-alive)
        (not (vampire-is-alive))
        (slayer-is-in-room1)
    )
)
)
