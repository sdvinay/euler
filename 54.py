#!/usr/bin/python

# works!
# poker hand scoring/ranking

# Basically, every hand can be reduced to a tuple, and the 
# two tuples can be compared to choose a winner

import collections
import fileinput


str="8S 3S 4S TS 7S 4C 5C 3C 6C 7C"

HIGH_CARD=1
ONE_PAIR=2
TWO_PAIR=3
TRIPS=4
STRAIGHT=5
FLUSH=6
BOAT=7
QUADS=8
STFLUSH=9

def isFlush(hand):
	return (hand[0][1] == hand[1][1] == hand[2][1] == hand[3][1] == hand[4][1])

def winner(hand1, hand2):
	return score(hand1) > score(hand2)

def rank(card):
	val = card[0]
	faces = {'A': 14, 'K': 13, 'Q': 12, 'J': 11, 'T':10}
	if faces.has_key(val): return faces[val]
	else: return int(val)

def getranks(hand):
	ranks = map(rank, hand)
	ranks.sort(reverse=True)
	return ranks

def isStraight(hand):
	ranks = getranks(hand)
	return ((ranks[0] - 1 == ranks[1]) and
			(ranks[0] - 2 == ranks[2]) and
			(ranks[0] - 3 == ranks[3]) and
			(ranks[0] - 4 == ranks[4]) )

def score(hand):
	ranks = getranks(hand)
	counter = collections.Counter(ranks)

	if isFlush(hand) and isStraight(hand): return(STFLUSH, ranks[0])

	common = counter.most_common(4)
	biggest_set = common[0][1]

	if biggest_set == 4: return (QUADS, common[0][0]) # kickers don't matter for quads
	if biggest_set == 3: 
		if common[1][1] ==2:# check for boat
			return (BOAT, common[0][0], common[1][0])

	if isFlush(hand): return (FLUSH, ranks)
	if isStraight(hand): return (STRAIGHT, ranks[0])

	if biggest_set == 3: # no boat
		return (TRIPS, common[0][0]) #kickers don't matter for trips

	if biggest_set == 2:
		if common[1][1] ==2:# check for two pair
			pairs = [common[0][0], common[1][0]] 
			pairs.sort(reverse=True)
			return (TWO_PAIR, pairs[0], pairs[1], common[2][0]) 
		else: # one pair
			pair = common[0][0]
			kickers = ranks
			kickers.remove(pair)
			kickers.remove(pair)
			return (ONE_PAIR,  common[0][0], kickers)
		
		
	else: return (HIGH_CARD, ranks)

def play(str):
	cards = str.split(" ")
	h1 = cards[0:5]
	h2 = cards[5:10]
	print (score(h1), score(h2), winner(h1,h2))

play("8S 3S 4S TS 7S 4C 5C 3C 6C 7C") # F, SF, false
play("8S 3S 4S TD 7S 4C 5D 3C 6C 7C") # HC, S, false
play("8S 8C 8H 3D 8D 5S 5C 5D 5H TS") # Q83, Q5T, true
play("8S 3C 8H 3D 8D 5S 5C 5D 5H TS") # B83, Q5T, false
play("8S 2C 8H 3D 8D 5S 5C 5D 5H TS") # T832, Q5T, false
play("8S 2C 8H 3D 8D 5S 5C 5D 5H TS") # T832, Q5T, false
play("8S 2C 7H 3D 8D 6S 6C 5D 5H TS") # P8732, P6P5T, false
play("8S 2C 7H 3D 8D 8C 8H 5S 6D 7S") # P8732, P8765, false
play("8S 2C 7H 3D 8D 8C 8H 5S 6D 4S") # P8732, P8654, true

for line in fileinput.input():
	play(line.strip())
