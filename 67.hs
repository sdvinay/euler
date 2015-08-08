-- doesn't work yet
-- Find the maximum total from top to bottom of the triangle below

problem_67 = readFile "67_triangle.txt" >>= print . solve . parse
parse = map (map read . words) . lines
solve = head . foldr1 step
step [] [z] = [z]
step (x:xs) (y:z:zs) = x + max y z : step xs (z:zs)

zipRows higher lower = zipWith3 longestPath higher lower (tail lower)
	where longestPath val l r = val + (max l r)

input = readFile "67_triangle.txt" >>= print . parse
	where parse = map (map read . words) . lines


answer = head $ foldr1 zipRows input

--answer = longestPath $ makeTree input

