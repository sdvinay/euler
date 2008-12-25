module Divisors (divisors) where

divisors :: Int -> [Int]
divisors n = filter (\x -> divides n x) [1 .. (div n 2)]
	where divides x y = (mod x y) == 0

