-- doesn't work yet
-- How many ways to make change



answers = [(p1, p2, p5, p10, p20, p50, p100, p200) | p1 <- [1..200], p2<-[1..100],p5 <- [1..20], p10 <- [1..20], p20 <- [1..10], p50 <- [1..4], p100 <- [1..2], p200 <- [1..1],  p1+2*p2+5*p5+10*p10+20*p20+50*p50+100*p100+200*p200==200]
