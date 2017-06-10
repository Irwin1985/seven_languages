# Seven Languages Day 1

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

Implement a function called (big st n) that returns true if a string st is longer than n characters
```eval-clojure
(defn big "Function to determine is string is big" [st n]
  (> (count st) n)
  )

(do
  (test "Less" big ["awesomenessness" 11] true)
  (test "More" big ["awesomenessness" 51] false)
  )
```


Write a function called (collection-type col) that returns :list, :map, or :vercor based on the type of collection col.

```eval-clojure
;class is not availiable in clojure script


(defn collection-type [col]
  (cond
    (list? col) ":list"
    (map? col) ":map"
    (vector? col) ":vector"
    :else "I don't know what this is")
  )

(do
  (test "List" collection-type [ () ] ":list")
  (test "Map" collection-type [ {:1 "one" :2 "two"} ] ":map")
  (test "Vector" collection-type [ [:first :second :third] ] ":vector")
  )
```

Finaly block for playing aroud:
```eval-clojure
  (println "Hello")
```
