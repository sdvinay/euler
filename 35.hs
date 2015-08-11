-- works!
-- How many circular primes are there below one million

import Primes (isPrime, primes)

rotations :: String-> [String]
rotations str = map (\n->rotate str n) [0..(length str - 1)]
	where
	rotateOnce str = take (length str) (str!!(length str - 1) : str)
	rotate str n = if (n==0) then str else rotate (rotateOnce str) (n-1)

rotatedInts prm = map (\str->read(str)::Integer) (rotations (show prm))

isCircularPrime :: Integer -> Bool
isCircularPrime prm = all isPrime (rotatedInts prm)

answer n = length (filter isCircularPrime (takeWhile (<n) primes))

