module Primes
    ( primeFactors,
      isPrime,
      primes) where

-- current implmenentation: take 30000 primes takes ~19 sec
-- current implmenentation: take 20000 primes takes ~11 sec
-- current implmenentation: take 10000 primes takes 4-5 sec
-- timings are on MacBook Air, of CPU time 

-- map primeFactors [1..1000000] takes 190 sec
-- map primeFactors [1..100000]  takes  15 sec


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


primeFactors :: Integer -> [Integer]
primeFactors n = pfs n primes
  where
    pfs n (prm:prms)
      | n < (prm * prm) = [n]
      | mod n prm == 0  = prm:(pfs (div n prm) (prm:prms))
      | otherwise       = pfs n prms
