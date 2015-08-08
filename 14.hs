-- works! but without memoization, this takes minutes to run
-- still TODO memoization
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

