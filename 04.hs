-- works!
-- largest palindrome made from product of two 3-digit numbers

isPalindrome num = show num == reverse (show num)

getProducts :: Int -> Int -> [Int]
getProducts start end = concatMap makeProducts [start..end])
	where
	makeProducts x = map (*x) [x..end]

answer start end = maximum (filter isPalindrome (getProducts start end))
