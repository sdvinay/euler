-- works!
-- Evaluate the sum of all the amicable numbers under 10000

import Divisors


answer n = sum(filter isAmicable [1 .. n-1])
	where 
	isAmicable n = n == (d (d n)) && n /= d n
	d n = sum (divisors n)

