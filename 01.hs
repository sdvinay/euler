-- works!
-- in ghci, evaluate 'answer 1000' and get 233168
-- http://projecteuler.net/problem=1

answer = calc

-- bruteforce method
bruteforce n = sum(filter (\x -> (mod x 3 ==0 || mod x 5 ==0)) [1 .. n-1])

-- calculated method
summultiples  :: Int -> Int -> Int -- generalization of n(n+1)/2
summultiples limit step = div (steps*step*(steps+1))  2
    where steps = div limit step

calc n = (summultiples (n-1) 3) + 
         (summultiples (n-1) 5) -
         (summultiples (n-1) 15)
