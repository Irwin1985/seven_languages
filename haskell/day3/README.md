# Day 3 research

Monad explination: https://wiki.haskell.org/All_About_Monads#Do_notation
Monad Tutorials: https://wiki.haskell.org/Monad_tutorials_timeline

````
data Maybe a = Nothing | Just a
````
Maybe is a type constructor
Nothing and Just are data constructors

````
country = Just "China"
lookupAge :: DB -> String -> Maybe Int
````

lookupAge "is type of" DB String  (Maybe Int is the output)


List of monads:
Identity
Maybe
Error
IO
State
Reader
Writer
Continuation


A monad is a method functinoal composition. (Compositional pattern)
Monads avoid implicit state.
Monads are Excplicit side effects

State is threaded around using function arguments. Monad is a way of every function getting it's state variable.

In a programming language like c#, vb or c everything is in one monad
