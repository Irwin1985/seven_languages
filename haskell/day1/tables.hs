module Main where
    main :: IO ()
    main = do
      let numbers = [1,2,3,4,5,6,7,8,9,10,11,12]
      putStrLn "Numbers:" 
      print (numbers)
      print ""
      print "Tables:"
      print ([(a ,b, (a * b)) | a <- numbers, b <- numbers])



