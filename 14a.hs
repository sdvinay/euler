import Data.List
 
-- computes the sequence for a given n
l n = n:unfoldr f n where
    f n
        | n==1 = Nothing -- we're done here
        -- for reasons of speed we do div and mod in one go
        | otherwise = let (d,m)=divMod n 2 in case m of
            0 -> Just (d,d) -- n was even
            otherwise -> let k = 3*n+1 in Just (k,k) -- n was odd
 
 
answer n = foldl1' f $ -- computes the maximum of a list of tuples
     -- save the length of the sequence and the number generating it in a tuple
    map (\x -> (length $! l x, x))  [1..n] where
        f (a,c) (b,d) -- one tuple is greater than other if the first component (=sequence-length) is greater
            | a > b = (a,c)
            | otherwise = (b,d)

