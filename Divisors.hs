module Divisors (divisors) where

import Data.List

-- find divisors by first finding "small divisors", those less than sqrt(n)
-- then find the "large divisors", which are the corresponding divisors of the smalls
divisors :: Int -> [Int]
divisors n = sort $ union smalls bigs
	where
	smalls = small_divisors n
	bigs = large_divisors n smalls

small_divisors n = filter (divides n) $ takeWhile (\x -> x*x <= n) [1..]
	where divides x y = (mod x y) == 0

-- we don't want to count a number as its own divisor, so filter 1 out of the smalls
-- before computing the large divisors
large_divisors n smalls = map (\x -> div n x) $ filter (/= 1) smalls
