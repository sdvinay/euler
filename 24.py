#!/usr/bin/python

import math

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
