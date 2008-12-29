-- works!
-- Find the next triangle number that is also pentagonal and hexagonal

import List

triangles = map (\n -> div (n * (n+1))   2) [1..]
pentagons = map (\n -> div (n * (3*n-1)) 2) [1..]
hexagons  = map (\n ->      n * (2*n-1)   ) [1..]

ordered_intersect (x:xs) (y:ys) | x==y = x:(ordered_intersect  xs ys)
                                | x<y  = ordered_intersect  xs (y:ys)
                                | x>y  = ordered_intersect  (x:xs) ys

answers = foldr1 ordered_intersect [triangles, pentagons, hexagons]



odds = [1,3..]
threes = [3,6..]
fives = [5,10..]
cmn= foldr1 ordered_intersect  [odds, threes, fives]

