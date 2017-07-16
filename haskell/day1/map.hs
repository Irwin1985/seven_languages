module Main where
    main :: IO ()
    main = do
      let colours = ["Red","Green","Blue"]
      let states = ["Alabama", "Mississippi", "Georgia", "Tennessee", "Florida"]
      putStrLn "Colours:" 
      print (colours)
      putStrLn "States:" 
      print (states)
      print ""

      print ([(tennessee, mississippi, alabama, georgia, florida) |
          tennessee <- colours,
          mississippi <- colours,
          alabama <- colours,
          georgia <- colours,
          florida <- colours,
          tennessee /= mississippi,
          tennessee /= alabama,
          tennessee /= georgia,
          mississippi /= alabama,
          alabama /= georgia,
          florida /= alabama,
          florida /= georgia])

