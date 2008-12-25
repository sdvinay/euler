-- works!
-- Find the sum of all the even-valued terms in the sequence which do not exceed four million.

import Fibs

answer n = sum (filter even (takeWhile (<n) fibs))
