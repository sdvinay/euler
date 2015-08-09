module Primes
    ( primeFactors,
      isPrime,
      primes) where

-- current implmenentation: take 30000 primes takes ~19 sec
-- current implmenentation: take 20000 primes takes ~11 sec
-- current implmenentation: take 10000 primes takes 4-5 sec
-- timings are on MacBook Air, of CPU time 

primeFactors :: Integer -> [Integer]
primeFactors n = pfs n 2
  where
    pfs n start
      | n < (start * start) = [n]
      | mod n start == 0 = start:(pfs ( div n start) start)
      | otherwise = pfs n (start+1)

isPrime 4 = False
isPrime 6 = False
isPrime 8 = False
isPrime n = isP n 3
  where
    isP n start
      | n < (start * start) = True
      | mod n start == 0 = False
      | otherwise = isP n (start+2)

primes = 2 : filter isPrime [3,5..]


