-- works (but is really dang slow)
-- Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
-- https://projecteuler.net/problem=37

import Primes
import Data.List

isTruncatablePrime prm = all isPrime $ map (\str -> read str::Int) $ truncations $ show prm

truncations str = union (truncationsL str) (truncationsR str)

truncationsL (char:chars) = (char:chars) : truncationsL chars
truncationsL [] = []

truncationsR str = map reverse (truncationsL $ reverse str)


answer = sum $ take 11 $ filter isTruncatablePrime candidates
    where candidates = dropWhile (<= 7) primes
    
check = answer==748317
