-- works!
-- sum of the digits of 100!

import Data.Char -- for digitToInt

answer = sumDigits (product [1..100])
	where sumDigits num = sum(map digitToInt (show num))
