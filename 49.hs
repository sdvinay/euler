-- works!
-- Find arithmetic sequences, made of prime terms, whose four digits are permutations of each other.

import List
import Primes

data Sequence = Seq {lowest, step :: Integer}
	deriving Show

isPrimeSequence sequence = all isPrime [low,mid,high]
	where 
	low = lowest sequence
	mid = lowest sequence + step sequence
	high = lowest sequence + 2 * step sequence

isPermutation num1 num2 = sort (show num1) == sort (show num2)

isPermutedSequence sequence = (isPermutation low mid) && (isPermutation low high)
	where 
	low = lowest sequence
	mid = lowest sequence + step sequence
	high = lowest sequence + 2 * step sequence

candidates = takeWhile(<10000) (dropWhile(<1000) primes)
maxStep lowest = div (9999-lowest) 2

getSequences lowest = filter isGood seqs
	where 
	seqs = map (\step -> Seq lowest step) [1..(maxStep lowest)]
	isGood seq = isPermutedSequence seq && isPrimeSequence seq

answer = map makenumber (concatMap getSequences candidates)
	where makenumber sequence = low*10000*10000 + mid*10000 + high
		where 
		low = lowest sequence
		mid = lowest sequence + step sequence
		high = lowest sequence + 2 * step sequence
