-- doesn't work yet
-- Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

import Data.List
import System
import Divisors

limit = 1000 -- the problem tells us this is the greatest number to consider

isAbundant n = (sum $ divisors n) > n
abundants n = filter isAbundant [1 .. n]

-- I think an optimization I can make is to create two lists of abundants, for
-- odd abundants and even abundants, and then rather than computing all the sums,
-- instead create lists of even sums (summing the odds with each other and the
-- evens with each other) and odd sums (summing the odds and evens)

sumsOfLists xs ys = nub $ sort $ concatMap sums xs
	where sums x = map (\y -> x + y) ys

oddAbundants  n = filter odd  (abundants n)
evenAbundants n = filter even (abundants n)

answers n = filter (not . isAbundantSum) [1..n]

-- hmm, I wonder if the (oddAbundants x), etc., is causing re-calculation, because we keep passing in
-- different values of x.  Maybe we should make it isAbundantSum x n, and call (oddAbundants n) each
-- time, where n is the input (and therefore the same across all invocations in an instance of the program)
isAbundantSum x
  | odd  x = elem x $ sumsOfLists (oddAbundants x) ( evenAbundants x)
  | even x = elem x $ union (sumsOfLists (oddAbundants  x) (oddAbundants x)) (sumsOfLists (evenAbundants  x) (evenAbundants x))

answer = sum $ answers limit

main = do argv <- getArgs
	print sum $ answers $ read argv!!0

