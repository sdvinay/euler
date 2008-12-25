-- works!
-- What is the sum of both diagonals in a 1001 by 1001 spiral formed in the same way?

-- note that in an NxN spiral, the top-right diagonal is the sum of the first
-- N odd squares, and the bottom-left are the numbers exactly halfway between them
-- and the other two diagonals are the same as the bottom-left

squares size = map (\n->n*n) [1,3..size]
averages squares = zipWith average squares (tail squares)
	where average a b = div(a+b) 2

diagsum size = sum (squares size) + 3* sum(averages (squares size))
