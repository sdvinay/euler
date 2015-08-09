module Primes
    ( primeFactors,
      isPrime,
      primes) where

primeFactors :: Integer -> [Integer]
primeFactors n = pfs n 2
  where
    pfs n start
      | n < (start * start) = [n]
      | mod n start == 0 = start:(pfs ( div n start) start)
      | otherwise = pfs n (start+1)

isPrime x | x > 1 =  (largestPrimeFactor x) == x
          | otherwise = False

primes = 2 : filter isPrime [3,5..]


