(define (problem p07-grounded)
(:domain vampire-grounded-for-p07)
(:objects
)
(:init
   (slayer-is-alive)
   (slayer-is-in-room1)
   (vampire-is-alive)
   (vampire-is-in-room6)
   (light-on-room1)
   (light-on-room4)
   (light-on-room7)
   (light-on-room9)
   (light-on-room10)
)
(:goal
    (and
        (slayer-is-alive)
        (not (vampire-is-alive))
        (slayer-is-in-room2)
    )
)
)
