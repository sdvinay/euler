-- this is a data type representing a binary tree of integers

module BinaryTreeOfInts where

data BTreeInt  = Node {val::Int, left::BTreeInt, right::BTreeInt}
			| Empty
			deriving (Show)

longestPath :: BTreeInt -> Int
longestPath Empty = 0
longestPath node = (val node) + maximum (map longestPath [left node, right node])

