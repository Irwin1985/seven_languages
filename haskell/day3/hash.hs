module Main where
  main :: IO ()
  main = do
    putStrLn "Hash lookup from web"
    putStrLn "data:"
    print (testData)
    
    putStrLn ""
    putStrLn "Lookup 1"
    print (my_lookup 1 testData)

    putStrLn ""
    putStrLn "Lookup 2"
    print (my_lookup 2 testData)

    putStrLn ""
    putStrLn "Lookup 3"
    print (my_lookup 3 testData)

    putStrLn ""
    putStrLn "Lookup 4"
    print (my_lookup 4 testData)

    putStrLn ""
    putStrLn "Lookup 2ai (chaining state between functions)"
    print (my_lookup 2 testData >>= my_lookup "a" >>= my_lookup "i")

    putStrLn ""
    putStrLn ""
    putStrLn "data2:"
    print (testData2)
    
    putStrLn ""
    putStrLn "Lookup 2"
    print (my_lookup 2 testData2)

    putStrLn ""
    putStrLn "Lookup 3"
    print (my_lookup 3 testData2)

    putStrLn ""
    putStrLn "Lookup 4"
    print (my_lookup 4 testData2)

--got from https://jezenthomas.com/haskell-day-three/


  my_lookup key [] = Nothing
  my_lookup key ((k, value):rest)
    | key == k  = Just value
    | otherwise = lookup key rest

  testData = [(1, []), (2, [("a", [("i", "tada!")]), ("b", [("j", "nope")])]), (3, [("c", [("k", "tada!")])])]

  testData2 = [(1, "AA"), (2, "BB"), (3, "CC")]


