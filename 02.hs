-- works!
-- Find the sum of all the even-valued terms in the sequence which do not exceed four million.

fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

answer n = sum (filter even (takeWhile (<n) fibs))
