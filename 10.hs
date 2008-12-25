-- works!
-- Find the sum of all the primes below two million.


primes = 2 : filter isPrime [3,5..]
	where
	isPrime x = dividesNoneOf x (takeWhile (\prm -> prm*prm <=x) primes)
	dividesNoneOf x divisors = not( any (\divisor ->  divides x divisor)  divisors)
	divides x y = mod x y == 0

answer n = sum (takeWhile (<n) primes)
