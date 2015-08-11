module Primes
    ( primeFactors,
      isPrime,
      primes) where

-- current implmenentation: take 50000 primes takes ~15 sec
-- current implmenentation: take 30000 primes takes ~8 sec
-- current implmenentation: take 20000 primes takes ~5 sec
-- current implmenentation: take 10000 primes takes 2-3 sec
-- timings are on MacBook Air, of CPU time 

-- map primeFactors [1..1000000] takes 190 sec
-- map primeFactors [1..100000]  takes  15 sec


isPrime n
  | n < 2     = False
  | otherwise = isP n primes
  where
    isP n (prm:prms)
      | n < (prm * prm) = True
      | mod n prm == 0 = False
      | otherwise = isP n prms

primes = 2 : filter isPrime [3,5..]


primeFactors :: Int -> [Int]
primeFactors n = pfs n primes
  where
    pfs n (prm:prms)
      | n < (prm * prm) = [n]
      | mod n prm == 0  = prm:(pfs (div n prm) (prm:prms))
      | otherwise       = pfs n prms
