module Main where
    main :: IO ()
    main = do
      putStrLn "Drunkn monad"

      putStrLn "  non-monand way to pass state around"
      print (treasureMap (Position 0))

      

--got from https://jezenthomas.com/haskell-day-three/

    data Position typ = Position typ deriving (Show)

    stagger (Position d) = Position (d + 2)
    crawl (Position d) = Position (d + 1)

    rtn x = x
    x >>== f = f x

    treasureMap :: Position Integer -> Position Integer
    treasureMap pos = pos >>==
                      stagger >>==
                      crawl >>==
                      stagger >>==
                      crawl >>==
                      crawl >>==
                      stagger >>==
                      stagger >>==
                      rtn

