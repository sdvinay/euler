-- doesn't work yet
-- Which starting number, under one million, produces the longest chain?
-- http://projecteuler.net/index.php?section=problems&id=14

seqlen :: (Integral a, Integral b) => a -> b
seqlen n | n==1 = 1
         | otherwise = 1+seqlen(nextInSeq n)


nextInSeq n | mod n 2 == 1 = 3*n+1
			| otherwise    = div n 2

type MyPair = (Integer, Integer)

makePairs :: Integer -> Integer -> [MyPair]
makePairs start end = zip [start .. end] (map seqlen [start .. end])

lt :: MyPair -> MyPair -> Bool
lt p1 p2 = snd(p1) < snd(p2)

maxPr :: MyPair -> MyPair -> MyPair
maxPr p1 p2 | lt p1  p2 = p2
            | otherwise = p1

longestPath n = foldr1 (maxPr) $ makePairs 1 n

