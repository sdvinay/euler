-- doesn't work yet
-- attempt at solving prob 14 with an array to store sequence lengths
-- http://projecteuler.net/index.php?section=problems&id=14

import Array

-- from the problem definition, here is how we define the sequence
nextInSeq n | even n    = div n 2
            | otherwise = 3*n+1

-- create an array with indices (1,n) with the sequence lengths as values
seqLens n = mySeq
	where 
	mySeq = array (1,n) [(i, (seqlen i)) | i <- [1..n]]
	-- when the next value is lower, look up its length in the array, otherwise compute it
	seqlen 1 = 1
	seqlen x | next < (min n x) = 1 + mySeq!next
			 | otherwise        = 1 + (seqlen next)
	           where next = nextInSeq x
{-
Perhaps I need to allocate a bigger array.  When I use 3*n instead of
n for the bounds, I run into the same stack overflow.  Heck, even when
I try just to compute the limit via 'maximum $ map nextInSeq 1000000', I get 
the stack overflow (yeah, that is not *really* the limit, but the
point is that it overflows).

I wonder if defining seqlen as a local function is the problem.
Except the whole point is that I'm memoizing the values in the array,
so it shouldn't matter, and I'm running into stack overflows even on 
trivial manipulations of lists/arrays of 1M values
-}

-- This doesn't give the answer, it will just give the max value.
-- If I can get this to work, then I can easily find the index with this value
-- There may be a more efficient way to do this, but I just don't know it yet.
maxLen n = maximum $ map ((seqLens n)!) [1..n]


