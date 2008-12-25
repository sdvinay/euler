-- works!
-- Find the 10,001st prime

import Primes
import System( getArgs )


main = do args <- getArgs;
		print (primes!! read(args!!0))

