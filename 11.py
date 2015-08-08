#!/usr/bin/python

# works!

import sys

# read the input into a big array
numArray = list()
for line in sys.stdin.readlines():
	nums = map(int, line.split())
	numArray.append(nums)
#print numArray

def Product(nums):
	return reduce(lambda x,y: x*y, nums)

def ComputeProducts(numArray, i, j):
	horizProd = Product(numArray[i][j:j+4])
	vertProd = Product([numArray[i][j], numArray[i+1][j], numArray[i+2][j], numArray[i+3][j]])
	diagProd1 = Product([numArray[i][j], numArray[i+1][j+1], numArray[i+2][j+2], numArray[i+3][j+3]])
	diagProd2 = Product([numArray[i+3][j], numArray[i+2][j+1], numArray[i+1][j+2], numArray[i+0][j+3]])
	return horizProd, vertProd, diagProd1,diagProd2

maxProduct = 0
for i in range(0,17):
	for j in range(0,17):
		prods = ComputeProducts(numArray, i, j)
		#print prods
		maxProduct = max(maxProduct, max(prods))

print maxProduct
