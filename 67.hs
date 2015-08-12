-- works!!
-- the biggest pain here is reading the file in, and thus having to work inside a do block
-- Find the maximum total from top to bottom of the triangle below

zipRows higher lower = zipWith3 longestPath higher lower (tail lower)
    where longestPath val l r = val + (max l r)

main = do
  contents <- readFile "67_triangle.txt"
  putStr (answer contents)


answer contents = show $ head $ foldr1 zipRows input
    where input = (map (\line-> map (\wd->read wd ::Int) $ words line) ( lines contents))


