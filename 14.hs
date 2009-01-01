
seqlen :: (Integral a, Integral b) => a -> b
seqlen n | n==1 = 1
         | otherwise = 1+seqlen(nextInSeq n)


nextInSeq n | mod n 2 == 1 = 3*n+1
			| otherwise    = div n 2

type MyPair = (Integer, Integer)

pairsFrom :: Integer -> [MyPair]
pairsFrom n = zip [n..] (map seqlen [n..])

lt :: MyPair -> MyPair -> Bool
lt p1 p2 = snd(p1) < snd(p2)

maxPr :: MyPair -> MyPair -> MyPair
maxPr p1 p2 | lt p1  p2 = p2
            | otherwise = p1

longestPath n = foldr (maxPr) (0,0)  (take n (pairsFrom 1))

