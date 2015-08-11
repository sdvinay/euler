import Primes
import Data.List

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
--  e.g. for d=60, the fractions are all numerators mutually prime with 60
--  so start with 59 factors, then subtract multiples of 2, multiples of 3, etc
--  but this double counts multiples of 6, so add those back in
--  but multiples of 3 factors (like 2*3*5=30) are over counted, so back them out
--  generalize this by multiplying every subset of prime factors together,
--  subtracting or adding based on the number of primes multiplied together

-- this is close but getting off by one because of div by negative number
-- e.g. div 8 (0-3) == -3, when we want to remove two numerators (3 and 6)
numFractions :: Int-> Int
numFractions d 
 | isPrime d = d-1
 | otherwise = d - 1 - unreducedNumerators
   where
     -- this pattern is correct, but needs to be repeated beyond double-counts; if there are >2 pfs, then we have triplecounts, etc TODO
     unreducedNumerators = sum $ map (\x->div (d-1) x)$ map product pfsets
       where
         pfs = nub ( primeFactors d) -- list of prime factors, dupes removed
         pfsets = tail $ subsets $ map (\x->(0-x)) pfs -- invert the primes, so multiplying together will give the right sign


-- creates a tuple of the two different computations from the one denominator
compareComputations d = (d, length $ fractions d, numFractions d)

-- if the two values in the tuple match, that means the computations give the same result
-- if a 2-tuple has varying values, that means the calcs gave different values!
test = map compareComputations [72,67,1, 2, 100, 53, 13, 60, 14, 30, 2*2*3*5*7*11]

subsets :: [Int] -> [[Int]]
subsets []  = [[]]
subsets (x:xs) = subsets xs ++ map (x:) (subsets xs)