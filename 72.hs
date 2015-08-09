import Primes

-- Count the unique fractions up to a certain denominator limit
--  (limit=10^6 in this case)
-- Enumerating the fractions works, but is way too slow for
--  that limit.  So we need to look at calculating.

fractionsUpTo limit = concatMap fractions [1..limit]

-- Enumerate the fractions for a denominator by checking the gcd
--  of each numerator.
fractions d = [(n,d)| n<-[1..d], n<d, (gcd n d) ==1] 

-- Compute the number of fractions for a denominator by 
--  subtracting multiples of prime factors
numFractions :: Int-> Int
numFractions d | isPrime d = d-1
               | otherwise = 0 -- TODO this is placeholding, not correct
