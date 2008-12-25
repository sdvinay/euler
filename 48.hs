-- works!
-- find the last ten digits of the series 1^1 + 2^2 + ... +1000^1000

answer n digits = round (sum (map (round . raise) [1..n]))
	where 
	round num = mod num (10^digits)
	raise num = num^num
