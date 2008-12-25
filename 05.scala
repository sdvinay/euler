// works!

// 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
// What is the smallest number that is evenly divisible by all of the numbers from 1 to 20?

// Fold 1...20 using lcm
def intersect (xs: Stream[Int], ys: Stream[Int]) : Stream[Int] = {
	if (xs.head == ys.head)
		Stream.cons(xs.head, intersect(xs.tail, ys.tail))
	else if (xs.head < ys.head)
		intersect(xs.tail, ys)
	else
		intersect(xs, ys.tail)
}

def multiples (x: Int) : Stream[Int] = { Stream.from(x,x) }

def lcm (x: Int, y: Int) : Int = {
	intersect(multiples(x), multiples(y)).head
}

// just test out lcm
lcm(8,12)

// here's the actual answer
(3 to 20).foldLeft(2)(lcm)
