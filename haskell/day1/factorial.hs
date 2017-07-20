module Main where
  factorial :: Integer -> Integer
  factorial 0 = 1
  factorial x = x * factorial (x - 1)

  factorialL :: (Integer,Integer) -> [(Integer,Integer)]
  factorialL (seqPos,facValue) = (seqPos,facValue):factorialL (seqPos+1,facValue * (seqPos+1))

  factorialF :: [Integer]
  factorialF = [snd x | x <- factorialL (1,1)]


  factorialV n = head (drop (n-1) (take n [snd x | x <- factorialL (1,1)]))

