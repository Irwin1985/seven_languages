module Main where
    import Data.List
    main :: IO ()
    main = do
      let stringTest1 = "$2,345,678.99"
      let stringTest2 = "$000002,345,678.99"
      let stringTest3 = "$2,345,078.09"
      putStrLn "String 1" 
      print stringTest1
      print (dollarToNum stringTest1)
      print ""
      putStrLn "String 2" 
      print stringTest2
      print (dollarToNum stringTest2)
      print ""
      putStrLn "String 3" 
      print stringTest3
      print (dollarToNum stringTest3)
      print ""
      print ""
      print "Lazy sequence"
      print "First 5 of seqs"
      print (take 5 (lazySeq 5))
      print (take 5 (lazySeq2 5))

      print (take 5 (every8th 5 3))

      print ""
      print "TODO Fn returns half"

      print ""
      print "TODO that adds new line to string"


    dollarToNum :: String -> Double
    dollarToNum input = (read (filter (not . (`elem` "$,")) input) :: Double)


--    lazySeq :: Integer -> Sequence

    lazyFib x y = x:(lazyFib y (x + y))

    lazySeq startNum = startNum:(lazySeq (startNum+3))
    lazySeq2 startNum = startNum:(lazySeq2 (startNum+2))


    every3rd x = [x, (x + 3) ..]
    every5th y = [y, (y + 5) ..]

    every8th x y =
        (zipWith (+) (every3rd x) (every5th y))
