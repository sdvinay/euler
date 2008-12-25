-- Generate a stream of primes
-- The first prime is 2
-- The remaining primes are not divisible by any smaller prime

primes = 2 : filter isPrime [3,5..]

--isPrime x = dividesNoneOf x (takeWhile (<x) primes)
isPrime x = dividesNoneOf x [2..(x-1)]

dividesNoneOf x divisors = not (dividesAnyOf x divisors)

dividesAnyOf x divisors = foldr (||) False (map (\divisor -> (divides x divisor)) divisors)

divides x y = mod x y == 0

makedivider a = (\x -> divides x a)

