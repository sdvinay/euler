#!/usr/bin/python

# works!!
# All sequences end in 1 or 89
# So the interesting operation (and the output to cache) i
#  which of 1 vs. 89

def nextInSeq(n):
    total = 0
    while n > 0:
        dig = n%10
        total += (dig*dig)
        n = n/10
    return total


seqoutcomes = {1:1, 89:89}

def seqfinish(n):
    if(seqoutcomes.has_key(n)):
        return seqoutcomes.get(n)
    else: 
        finish = seqfinish(nextInSeq(n))
        seqoutcomes[n] = finish
        return finish

o89 = 0
for i in range(1,10*1000*1000):
    if seqfinish(i) == 89:
        o89+= 1
print o89

