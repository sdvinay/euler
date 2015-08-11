-- works!
-- Find arithmetic sequences, made of prime terms, whose four digits are permutations of each other.

import Data.List (sort) -- used to identify permutations
import Primes

data Sequence = Seq {lowest, step :: Int}
    deriving Show

l :: Sequence -> Int
l sequence = lowest sequence
m sequence = lowest sequence + step sequence
h sequence = lowest sequence + 2 * step sequence

isPrimeSequence sequence = all isPrime [l sequence,m sequence,h sequence]

isPermutedSequence seq = (isPermutation (l seq) (m seq)) &&
                         (isPermutation (l seq) (h seq))
    where isPermutation num1 num2 = sort (show num1) == sort (show num2)


getSequences lowest = filter isPermutedSequence $ filter isPrimeSequence seqs
    where 
    seqs = map (\step -> Seq lowest step) [1..(maxStep lowest)]
        where maxStep lowest = div (9999-lowest) 2

answer = map makenumber $ concatMap getSequences candidates
    where 
    candidates = takeWhile(<10000) $ dropWhile(<1000) primes
    makenumber seq = (l seq)*10000*10000 + (m seq)*10000 + (h seq)
