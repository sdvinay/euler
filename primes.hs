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

isPrime n = isP n 2
  where
    isP n start
      | n < (start * start) = True
      | mod n start == 0 = False
      | otherwise = isP n (start+1)

primes = 2 : filter isPrime [3,5..]


