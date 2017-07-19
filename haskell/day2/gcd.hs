module Main where
    import Data.List
    main :: IO ()
    main = do
      putStr "GCD of 135 and 456:"
      print (gcd2 135 456)
      putStr "GCD of 1350 and 4560:"
      print (gcd2 1350 4560)
      putStr "GCD of 1350 and 4500:"
      print (gcd2 1350 4500)




    gcd2 :: (Integral a) => a -> a -> a
    gcd2 x y = gcd2_ (abs x) (abs y)
      where
        gcd2_ a 0 = a
        gcd2_ a b = gcd2_ b (a `rem` b)

