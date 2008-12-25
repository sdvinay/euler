// works!
// What is the value of the first triangle number to have over five hundred divisors?

// Design of solution:
// Create a stream of triangle numbers
// Define a function to calculate number of divisors
// Filter the stream to find those with numDivisors>500

lazy val triangles : Stream[Int]  = Stream.cons(1, 
		 Stream.from(2).zip(triangles).map(t => t._1 + t._2))

// TODO this is missing the square root for perfect squares
def numDivisors(x:Int) : Int = {
	(1 until Math.sqrt(x)).filter(x%_ == 0).length*2 +1 // add 1 to count x as its own divisor
}

triangles.take(10).print
println(triangles.filter(t => numDivisors(t) >= 500).head)

