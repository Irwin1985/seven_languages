module Main where
    main :: IO ()
    main = do
      let sampleList = [1,4,6,34,3423,341,6]
      putStrLn "All even example, orig list:" 
      print (sampleList)
      print ""
      print ""
      putStrLn "All even1:" 
      print (allEven1 sampleList)
      print ""
      putStrLn "All even2:" 
      print (allEven2 sampleList)
      print ""
      putStrLn "All even3:" 
      print (allEven3 sampleList)
      print ""
      putStrLn "All even4:" 
      print (allEven4 sampleList)
      print ""

    allEven1 :: [Integer] -> [Integer]
    allEven1 [] = []
    allEven1 (h:t) = if even h then h:allEven1 t else allEven1 t

    -- Using a list comprehension with a guard statement.
    allEven2 :: [Integer] -> [Integer]
    -- Map the given list onto the result list with a guard statement
    -- that requires the list item to be even.
    allEven2 numbers = [n | n <- numbers, (even n)]

    -- Using a folding-right approach.
    allEven3 :: [Integer] -> [Integer]
    -- Use the foldr. Since we want to return evens in the same order
    -- in which they are listed, we actually want to collect them in
    -- reverse order so we can build the list using the current index
    -- value as the new "head".
    allEven3 numbers =
        foldr
            (\n evens -> if (even n) then (n:evens) else evens)
            []
            numbers

    -- Using a filter approach.
    allEven4 :: [Integer] -> [Integer]
    -- Our filter function will be the native "even" method.
    allEven4 numbers = filter even numbers

