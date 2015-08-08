#!/usr/bin/python

# works! (well, it doesn't actually return the answer)
# this takes almost 3 min to execute.  Need to memoize the lengths

def nextInSeq(n):
	if (n%2 == 0): return n/2
	else: return 3*n + 1

def sequence(n):
	if (n==1): return [n]
	else: return [n] + sequence(nextInSeq(n))

def seqlen(n):
	return len(sequence(n))

def longestPath(n):
	return max(map(seqlen, range(1,n)))
