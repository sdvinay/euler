-- this is a data type representing a binary tree of integers

module BinaryTreeOfInts where

data BTreeInt  = Node {val::Int, left::BTreeInt, right::BTreeInt}
			| Empty
			deriving (Show)

longestPath :: BTreeInt -> Int
longestPath Empty = 0
longestPath node = (val node) + maximum (map longestPath [left node, right node])

makeTree :: [String] -> BTreeInt
makeTree input = head $ foldr makeNodes [] input
	where
	makeLeaves       :: String -> [BTreeInt]
	makeLeaves row = map makeLeafNode $ words row
		where 
		makeLeafNode :: String -> BTreeInt
		makeLeafNode str = (Node ((read str)::Int) Empty Empty)
	makeNodes       :: String -> [BTreeInt] -> [BTreeInt]
	makeNodes row [] = makeLeaves row
	makeNodes row children = zipWith makeNode (words row) pairChildren
		where
		pairChildren :: [(BTreeInt, BTreeInt)]
		pairChildren = zip children (tail children)
		makeNode  :: String -> (BTreeInt, BTreeInt) -> BTreeInt
		makeNode str chldrn = Node ((read str)::Int) (fst chldrn) (snd chldrn)

	
