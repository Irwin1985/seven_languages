module Main where
    import Data.List
    main :: IO ()
    main = do
      let sampleIntegerList = [1,44545,6,34,3423,341,6,99999999]
      putStrLn "List sort" 
      print sampleIntegerList
      putStrLn "Simple"
      print (quicksort sampleIntegerList)
      putStrLn "Comparator 1"
      print (quicksort2 (\a b -> if (a < b) then LT else GT) sampleIntegerList)
      putStrLn "Comparator 2"
      print (quicksort2 (\a b -> if (a > b) then LT else GT) sampleIntegerList)

--got from https://stackoverflow.com/questions/19082953/how-to-sort-a-list-in-haskell-in-command-line-ghci

    quicksort :: Ord a => [a] -> [a]
    quicksort []     = []
    quicksort (p:xs) = (quicksort lesser) ++ [p] ++ (quicksort greater)
      where
          lesser  = filter (< p) xs
          greater = filter (>= p) xs

    quicksort2 :: (Ord a) => (a -> a -> Ordering) -> [a] -> [a]
    quicksort2 comparator list = sortBy comparator list


