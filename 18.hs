-- works!
-- Find the maximum total from top to bottom of the triangle below

import BinaryTreeOfInts

input = Node 63 (Node 04 Empty Empty) (Node 62 Empty Empty)

makeLeaves       :: String -> [BTreeInt]
makeLeaves row = map makeLeafNode $ words row
	where 
	makeLeafNode :: String -> BTreeInt
	makeLeafNode str = (Node ((read str)::Int) Empty Empty)

makeNodes       :: String -> [BTreeInt] -> [BTreeInt]
makeNodes row children = zipWith makeNode (words row) pairChildren
	where
	pairChildren :: [(BTreeInt, BTreeInt)]
	pairChildren = zip children (tail children)
	makeNode  :: String -> (BTreeInt, BTreeInt) -> BTreeInt
	makeNode str chldrn = Node ((read str)::Int) (fst chldrn) (snd chldrn)

	
tree = 
	  makeNodes "75"
	$ makeNodes "95 64"
	$ makeNodes "17 47 82"
	$ makeNodes "18 35 87 10"
	$ makeNodes "20 04 82 47 65"
	$ makeNodes "19 01 23 75 03 34"
	$ makeNodes "88 02 77 73 07 63 67"
	$ makeNodes "99 65 04 28 06 16 70 92"
	$ makeNodes "41 41 26 56 83 40 80 70 33"
	$ makeNodes "41 48 72 33 47 32 37 16 94 29"
	$ makeNodes "53 71 44 65 25 43 91 52 97 51 14"
	$ makeNodes "70 11 33 28 77 73 17 78 39 68 17 57"
	$ makeNodes "91 71 52 38 17 14 91 43 58 50 27 29 48" 
	$ makeNodes  "63 66 04 68 89 53 67 30 73 16 69 87 40 31" 
	$ makeLeaves "04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

answer = maximum $ map longestPath tree

