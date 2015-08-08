#!/usr/bin/python

# works!

# Enumerating the sequences, this takes 3 min to execute
# Computing lengths (but not enumerating sequences), takes 1 min
# Memoizing lengths, 3 seconds

def nextInSeq(n):
	if (n%2 == 0): return n/2
	else: return 3*n + 1

def sequence(n):
	if (n==1): return [n]
	else: return [n] + sequence(nextInSeq(n))

seqlengths = {0:1, 1:1}

def seqlen(n):
	if(seqlengths.has_key(n)):
		return seqlengths.get(n)
	else: 
		mylen = 1 + seqlen(nextInSeq(n))
		seqlengths[n] = mylen
		return mylen

def longestPath(n):
	longest =  max(map(seqlen, range(1,n)))
	for start, length in seqlengths.iteritems():
		if length == longest:
			return start, length

