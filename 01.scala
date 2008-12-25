// works!

// If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

// Find the sum of all the multiples of 3 or 5 below 1000.

def merge(as: Stream[Int], bs: Stream[Int]): Stream[Int] = {
	val h = as.head min bs.head
	Stream.cons(h, merge(as dropWhile {_ == h}, bs dropWhile {_ == h}))
}

def multiples (x: Int) : Stream[Int] = Stream.from(x,x)

merge(multiples(3), multiples(5)).takeWhile(_ < 1000).foldLeft(0)(_+_)
