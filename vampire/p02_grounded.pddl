(define (problem p02-grounded)
(:domain vampire-grounded-for-p02)
(:objects
)
(:init
   (light-on-room1)
   (light-on-room2)
   (light-on-room4)
   (slayer-is-alive)
   (slayer-is-in-room1)
   (vampire-is-alive)
   (vampire-is-in-room5)
)
(:goal
    (and
        (slayer-is-alive)
        (not (vampire-is-alive))
        (slayer-is-in-room5)
    )
)
)
