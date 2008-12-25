
seqlen n | n==1 = 1
         | True = 1+seqlen(nextInSeq n)


nextInSeq n | mod n 2 == 1 = 3*n+1
			| True =  div n 2

type MyPair = (Integer, Integer)
numsFrom n = n : numsFrom (n+1)

pairsFrom :: Integer -> [MyPair]
pairsFrom n = zip (numsFrom n) (map seqlen (numsFrom n))

lt :: MyPair -> MyPair -> Bool
lt p1 p2 = snd(p1) < snd(p2)

maxPr :: MyPair -> MyPair -> MyPair
maxPr p1 p2 | lt p1  p2 = p2
            | True    = p1

longestPath n = foldr (maxPr) (0,0)  (take n (pairsFrom 1))

