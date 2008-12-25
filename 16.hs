-- works!
-- sum of the digits of 2^1000

import Data.Char -- for digitToInt

answer = sumDigits (2^1000)
	where sumDigits num = sum(map digitToInt (show num))
