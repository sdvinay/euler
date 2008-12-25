-- works!
-- Generate a stream of primes
-- The first prime is 2
-- The remaining primes are not divisible by any smaller prime

primes = 2 : filter isPrime [3,5..]
	where
	isPrime x = dividesNoneOf x (takeWhile (\prm -> prm*prm <=x) primes)
	dividesNoneOf x divisors = not( any (\divisor ->  divides x divisor)  divisors)
	divides x y = mod x y == 0


