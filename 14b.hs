-- doesn't work yet
-- attempt at soliving prob 14 with an array to store sequence lengths

import Array

seqLens n = mySeq
	where 
	mySeq = array (1,n) [(i, (seqlen i)) | i <- [1..n]]
	seqlen 1 = 1
	seqlen x | next < (min n x) = 1 + mySeq!next
			 | otherwise        = 1 + seqlen next
	           where next = nextInSeq x


nextInSeq n | odd n     = 3*n+1
            | otherwise = div n 2

maxLen n = maximum $ map ((seqLens n)!) [1..n]
