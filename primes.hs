module Primes
	( largestPrimeFactor,
	  isPrime,
	  primes) where

largestPrimeFactor n = lpf n 2
  where
    lpf n start
      | n < (start * start) = n
      | mod n start == 0 = lpf ( div n start) start
      | otherwise = lpf n (start+1)

isPrime x = (largestPrimeFactor x) == x
primes = 2 : filter isPrime [3,5..]


