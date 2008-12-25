-- doesn't work yet
-- If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used? 

answer n = length (filter (/=' ') (concatMap spellNumber [1..n]))

spellNumber n 
	| n == 1000 = "one thousand"
	| mod n 100 == 0 = concat [spellNumber(div n 100), " hundred"]
	| n == 9 = "nine"
	| n == 8 = "eight"
	| n == 7 = "seven"
	| n == 6 = "six"
	| n == 5 = "five"
	| n == 4 = "four"
	| n == 3 = "three"
	| n == 2 = "two"
	| n == 1 = "one"
	| n>100 = concat [spellNumber ((div n 100)*100), " and ", spellNumber (mod n 100)]
	| n == 90 = "ninety"
	| n == 80 = "eighty"
	| n == 70 = "seventy"
	| n == 60 = "sixty"
	| n == 50 = "fifty"
	| n == 40 = "forty"
	| n == 30 = "thirty"
	| n == 20 = "twenty"
	| n == 15 = "fifteen"
	| n == 13 = "thirteen"
	| n == 12 = "twelve"
	| n == 11 = "eleven"
	| n == 10 = "ten"
	| n > 20 = concat [spellNumber ((div n 10)*10), " ", spellNumber (mod n 10)]
	| n > 10 = concat [spellNumber (mod n 10), "teen"]

