-- doesn't work yet
-- Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

import Data.List
import Divisors

limit = 28123 -- the problem tells us this is the greatest number

isAbundant n = (sum $ divisors n) > n
abundants = filter isAbundant [1 .. limit]
allSums = nub $ sort $ concatMap sums abundants
	where sums x = map (\y -> x + y) abundants

answers = filter (not . isAbundantSum) [1..limit]
	where isAbundantSum x = elem x allSums

answer = sum answers
