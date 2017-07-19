module Main where
    import Data.List
    import Data.List.Split
    main :: IO ()
    main = do
      let testString = "Hey yo! This is Learn You a Haskell, the funkiest way to learn Haskell, which is the best functional programming language around. You may have heard of it. This guide is meant for people who have programmed already, but have yet to try functional programming The whole thing is completely free to read online, but it's also available in print and I encourage you to buy as many copies as you can afford! To contact me, shoot me an email to: bonus at learnyouahaskell dot com! You can also find me idling on #haskell where I go by the name BONUS."

      putStrLn "Orig:"
      putStrLn testString

      let wordList = splitOn " " testString
      print (wordList)

      print ""
      print "Folding into one string:"
      print (foldl (\x soFar -> x ++ " " ++ soFar) "" wordList)
      print ""
      print "Folding into List with one line per word:"
      print (foldr (\x soFar -> appendStrToLastLine x soFar) [""] wordList)

      print "Folding into List with new lines if over size:"
      print (foldr (\x soFar -> if ((length ((last soFar) ++ " " ++ x)) > 10) then ([x] ++ soFar) else (appendStrToLastLine x soFar)) [""] wordList)

--      print "--TTTe:"
--      print (foldr (\x soFar -> if (False) then ([x] ++ soFar) else (appendStrToLastLine x soFar)) [""] wordList)

      print ((length ((last [""]) ++ " " ++ "Hey")) > 10)

    replaceAtIndex :: Int -> a -> [a] -> [a]
    replaceAtIndex n item ls = a ++ (item:b) where (a, (_:b)) = splitAt n ls

    replaceLast :: a -> [a] -> [a]
    replaceLast item list = (replaceAtIndex ((length list)-1) item list)

--    appendStrToLastLine :: a -> [a] -> [a]
    appendStrToLastLine item list = (replaceLast ((last list) ++ " " ++ item) list)
