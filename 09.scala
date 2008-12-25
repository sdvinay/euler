// works!
// find the only pythag triplet {a,b,c} for which a+b+c=1000

def isPythTrip (a: Int, b: Int, c:Int) : Boolean = { a*a + b*b == c*c }

isPythTrip(3,4,5)
isPythTrip(3,4,6)

val total : Int = 1000;

// doing this imperatively, by looping :(
for (a <- (1 to total))
	for (b <- (a to total-a-1)) {
		var c: Int = total-a-b
		if (isPythTrip(a, b, c))
			println(a*b*c)
	}
