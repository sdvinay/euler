-- works!
-- What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

import Primes

odd_composites = filter (\x -> not $ isPrime x) [3,5..]

-- to check if a number is good, subtract the square of each number lower
-- than the sqrt, checking if the difference is prime
isGood :: Int -> Int -> Bool
isGood x y = isPrime (x - 2 * y * y)

check x = any (\y -> isGood x y)  (takeWhile (\y -> y*y < x) [1..])

answers = filter (not . check) odd_composites
