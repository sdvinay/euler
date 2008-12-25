module Primes
	( largestPrimeFactor,
	  primes) where

largestPrimeFactor n = lpf n 2
  where
    lpf n start
      | n < (start * start) = n
      | mod n start == 0 = lpf ( div n start) start
      | otherwise = lpf n (start+1)

primes = 2 : filter (\x -> (largestPrimeFactor x) == x) [3,5..]

