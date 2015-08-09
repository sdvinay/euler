-- doesn't work yet
-- Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

import Divisors
import Data.List

limit = 28123 -- the problem tells us this is the greatest number to consider

isAbundant n = (sum $ divisors n) > n

answers n = [x| x <- [1..n], not $ elem x abundantSums]
    where
    abundants  = filter isAbundant [1 .. n]
    abundantSums = [x+y | x <- abundants , y<- abundants , x+y <= n]


sums n = abundantSums
    where
    abundants  = filter isAbundant [1 .. n]
    abundantSums = nub[s |s<-[1..n], x <- abundants , s>x, isAbundant(s-x)]
    --abundantSums = nub [x+y | x <- abundants , y<- abundants, x+y <n ]

answer n = sum $ answers n

