-- works!
-- Evaluate the sum of all the amicable numbers under 10000


divisors :: Int -> [Int]
divisors n = filter (\x -> divides n x) [1 .. (div n 2)]
	where divides x y = (mod x y) == 0

d n = sum (divisors n)

isAmicable n = n == (d (d n)) && n /= d n

answer n = sum(filter isAmicable [1 .. n-1])

