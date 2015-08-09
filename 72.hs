
fractionsUpTo limit = concatMap fractions [1..limit]
--[(n,d)| d<-[1..limit],n<-[1..d], n<d, (gcd n d) ==1] 

fractions d = [(n,d)| n<-[1..d], n<d, (gcd n d) ==1] 

