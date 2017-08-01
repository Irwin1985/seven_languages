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

bind operator
unit operator

\a->(fa) >>= \a->(ga)
List of monads:

| Monad NAme   | Funciton  |
| ------------ | --------- |
| Identity     | Does nothing to input. Just changes it's type from a to Ma |
| Maybe        |
| Error        |
| IO           |
| State        |
| Reader       |
| Writer       |
| Continuation |


A monad is a method functinoal composition. (Compositional pattern)
Monads avoid implicit state.
Monads are Excplicit side effects

State is threaded around using function arguments. Monad is a way of every function getting it's state variable.

In a programming language like c#, vb or c everything is in one monad


Notes from: https://www.youtube.com/watch?v=ZhuHCtR3xq8
>>=   is the bind function
 - lamda


\a->(fa) >>= \a->(ga)

f:a->Ma
g:a->Ma
h:a->Ma   (composed funciton)
