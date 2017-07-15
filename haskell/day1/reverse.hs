module Main where
    main :: IO ()
    main = do
      let sampleIntegerList = [1,4,6,34,3423,341,6,99999999]
      let sampleStringList = ["Item 1", "Item 2", "Item 3"]
      putStrLn "reverse example, orig sampleIntegerList list:" 
      print (sampleIntegerList)
      putStrLn "reverse example, orig sampleStringList list:" 
      print (sampleStringList)
      print ""
      print ""
      putStrLn "reversed (Integer):" 
      print (rjm_reverse sampleIntegerList)
      putStrLn "reversed (String):" 
      print (rjm_reverse sampleStringList)

    rjm_reverse :: [item] -> [item]
    rjm_reverse [] = []
    rjm_reverse (head:tail) = rjm_reverse( tail ) ++ [head]



