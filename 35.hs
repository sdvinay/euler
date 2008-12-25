-- works!
-- How many circular primes are there below one million
-- make using 'ghc Primes.hs 35.hs -o 35.out'

import Primes
import System( getArgs )

rotations :: String-> [String]
rotations str = map (\n->rotate str n) [0..(length str - 1)]
	where
	rotateOnce str = take (length str) (str!!(length str - 1) : str)
	rotate str n = if (n==0) then str else rotate (rotateOnce str) (n-1)

rotatedInts prm = map (\str->read(str)::Integer) (rotations (show prm))

isCircularPrime :: Integer -> Bool
isCircularPrime prm = all isPrime (rotatedInts prm)

answer n = length (filter isCircularPrime (takeWhile (<n) primes))

main = do args <- getArgs;
		print (answer(read(args!!0)::Integer))
