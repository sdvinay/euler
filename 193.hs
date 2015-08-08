-- doesn't work yet
-- How many squarefree numbers are there below 2^50?

import Primes

squaredPrimes = map (\x->x*x) primes

squarefree n = not $ any (\x -> (mod n x)==0) $ takeWhile (<=n) squaredPrimes

