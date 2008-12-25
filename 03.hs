-- works!
-- Find the largest prime factor of 600851475143.

input = 600851475143
largestPrimeFactor n = lpf n 2
  where
    lpf n start
      | n <= (start * 2) = n
      | mod n start == 0 = lpf ( div n start) start
      | otherwise = lpf n (start+1)

