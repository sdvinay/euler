
fractions limit = [(n,d)| d<-[1..limit],n<-[1..d], n<d, (gcd n d) ==1] 
