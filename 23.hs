-- doesn't work yet
-- Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

import Data.List
import Divisors

limit = 28123 -- the problem tells us this is the greatest number to consider

isAbundant n = (sum $ divisors n) > n
abundants n = filter isAbundant [1 .. n]

allSums lst = nub $ sort $ concatMap sums lst
	where sums x = map (\y -> x + y) lst

answers n = filter (not . isAbundantSum) [1..n]
	where isAbundantSum x = elem x $ allSums $ abundants n

answer = sum $ answers limit
