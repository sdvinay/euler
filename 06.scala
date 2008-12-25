// works!

def square (n:Int) : Int = { n*n}

square((1 to 100).foldLeft(0)(_+_)) - (1 to 100).map(square).foldLeft(0)(_+_) 

