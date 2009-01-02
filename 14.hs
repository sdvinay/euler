-- doesn't work yet
-- Which starting number, under one million, produces the longest chain?
-- http://projecteuler.net/index.php?section=problems&id=14

seqlen :: (Integral a, Integral b) => a -> b
seqlen 1 = 1
seqlen n = 1+seqlen(nextInSeq n)


nextInSeq n | odd n     = 3*n+1
            | otherwise = div n 2

type MyPair = (Integer, Integer)

makePairs :: Integer -> Integer -> [MyPair]
makePairs start end = zip [start .. end] (map seqlen [start .. end])

maxPr :: MyPair -> MyPair -> MyPair
maxPr p1 p2 | snd(p1) < snd(p2) = p2
            | otherwise         = p1

longestPath n = foldr1 (maxPr) $ makePairs 1 n
{-
longestPath n = maximum $ map seqlen [1..n]
answer n = filter (\x-> seqlen x == longest) [1..n]
	where longest = longestPath n
-}


