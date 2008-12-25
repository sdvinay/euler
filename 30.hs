-- works!
-- Find the sum of all the numbers that can be written as the sum of fifth powers of their digits

import Data.Char (digitToInt)

isGood num = num == sum(map (raise . digitToInt) (show num))
	where raise n = n^5

-- I know that with 7 digits, the max sum of powers of digits is 413,343, which
-- can't represent a 7-digit number, so they're out
-- 6 digits can be at most 6*9^5 = 354,294
limit = 6*(9^5)

answer = sum (filter isGood [10..limit])
