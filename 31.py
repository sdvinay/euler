#!/usr/bin/python

# works!
# How many ways to make change

total = 200
coins = [200, 100, 50, 20, 10, 5, 2, 1]

def combos(sum, coins):
	val = coins[0]
	if (len(coins) == 1):
		if sum % val == 0:
			yield [(sum/val)]
		else: return
	else:
		for i in range(sum/val+1):
			for combo in combos(sum-(val*i), coins[1:]):
				yield ([i] + combo)

print len(list(combos(total, coins)))

