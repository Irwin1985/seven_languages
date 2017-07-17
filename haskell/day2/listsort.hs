module Main where
    main :: IO ()
    main = do
      let tstStr = "aaa\nbbb\nccc\nddd"
      let tstTple = (1,2)
      let sampleIntegerList = [1,4,6,34,3423,341,6,99999999]
      let sampleStringList = ["Item 1", "Item 3", "Item 2"]
      putStrLn "Do part 1 - Functions to work on lists" 
      putStrLn "Merge two lists"
      print (merge sampleStringList sampleStringList)
      putStrLn "Head lists"
      print (head sampleStringList)
      putStrLn "Last lists"
      print (last sampleStringList)
      putStrLn "Tail lists"
      print (tail sampleStringList)
      putStrLn ""
      putStrLn "String functions"
      print (tstStr)
      putStrLn "lines functions"
      print (lines tstStr)
      putStrLn ""
      putStrLn "Tuple functions"
      print tstTple
      putStrLn "fst"
      print (fst tstTple)
      putStrLn "snd"
      print (snd tstTple)

      print ""
      print ""
      putStrLn "Do part 2 - Find way to sort lists" 
      putStrLn "integer list" 
      print (sampleIntegerList)
      putStrLn "sampleStringList sirted:" 
      print (sampleStringList)
      print ""
      print ""
      print "Sorted"
      print (quicksort sampleIntegerList)
      print (quicksort sampleStringList)

--got from https://stackoverflow.com/questions/19082953/how-to-sort-a-list-in-haskell-in-command-line-ghci

    quicksort :: Ord a => [a] -> [a]
    quicksort []     = []
    quicksort (p:xs) = (quicksort lesser) ++ [p] ++ (quicksort greater)
      where
          lesser  = filter (< p) xs
          greater = filter (>= p) xs

    merge [] ys = ys
    merge (x:xs) ys = x:merge ys xs
