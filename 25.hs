-- works!
-- What is the index of the first Fib number to contain 1000 digits

import Fibs

fibPairs = zip [1..] fibs
answer n = fst ( head (dropWhile (\fibPair -> (snd fibPair) < 10^(n-1)) fibPairs))
