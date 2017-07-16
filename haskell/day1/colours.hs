module Main where
    main :: IO ()
    main = do
      let colourList = ["Black","White","Blue","Yellow","Red"]
      putStrLn "List of colours:" 
      print (colourList)
      print ""
      print "Combinations:"
      print ([(a ,b) | a <- colourList, b <- colourList, a < b])



