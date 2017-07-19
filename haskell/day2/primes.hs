module Main where
    import Data.List
    main :: IO ()
    main = do
      putStr "Primes:"
      print (take 3000 primes)

    primes :: [Integer]
    primes = sieve [2..]
      where
        sieve (p:xs) = p : sieve [x|x <- xs, x `mod` p > 0]
