-- works!
-- Find arithmetic sequences, made of prime terms, whose four digits are permutations of each other.

import Data.List -- for sort, used to identify permutations
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


getSequences lowest = filter isPermutedSequence $ filter isPrimeSequence seqs
	where 
	seqs = map (\step -> Seq lowest step) [1..(maxStep lowest)]
		where maxStep lowest = div (9999-lowest) 2

answer = map makenumber $ concatMap getSequences candidates
	where 
	candidates = takeWhile(<10000) $ dropWhile(<1000) primes
	makenumber sequence = low*10000*10000 + mid*10000 + high
		where 
		low = lowest sequence
		mid = lowest sequence + step sequence
		high = lowest sequence + 2 * step sequence
