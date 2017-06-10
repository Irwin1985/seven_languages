# Seven Languages Day 2

Before the exercises define a test function:
```eval-clojure
(defn test [test_name fn args exp_res]
  (do 
    (print "Test" test_name ":")
    (let [res (apply fn args)]
      (if (= res exp_res)
        (print "Pass")
        (print "Fail expected" exp_res "got" res)
        )
      )
    (println)
    )
  )
```
## Find
The implementation fo some of the commonly used mactos in the clojure language

An example of defining your own lazy sequence

The current status of the defrecord and protocol features (these features were still under development as this book was being developed)


# Do

Implement an unless with an else condition using macros.

Write a type using defrecord that implements a protocol.

## Util

Finaly block for playing aroud:
```eval-clojure
  (println "Hello")
```
