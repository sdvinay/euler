#!/usr/bin/python

# works!
# Millionth lexicographical permutation of the digits 0...9

import math

# The 1st permutation has them ordered 0...9
# Each subsequent one makes an adjustment on the furthest right
# Instead of iterating 1000000 times, let's instead adjust from
# the left, and deduct how many permutations that takes.
# Incrementing the leftmost digit is 9! permutations per step
digits_remaining=[0,1,2,3,4,5,6,7,8,9]
num = 0
perms_remaining = 1000000-1

for power in range(10,0,-1):
	step = math.factorial(power-1)
	steps = perms_remaining / step
	perms_remaining -= steps*step
	digit = digits_remaining[steps]
	digits_remaining.remove(digit)
	num += digit * math.pow(10,power-1)

print num	
