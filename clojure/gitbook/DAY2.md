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
### The implementation of some of the commonly used macros in the clojure language

when
```eval-clojure
(macroexpand '(when boolean-expression
                expression-1
                expression-2
                expression-3))
```

comment - ;
```eval-clojure
(macroexpand '(; expression-1 expression-2
                expression-3))
```

Making my own one - nif

DID NOT WORK AT ALL
```eval-clojure
(defmacro nif "not if" [cond func] (list(not (if cond func))) )

(nif (= 1 2) (str "True res") (str "False res"))
```


### An example of defining your own lazy sequence

```eval-clojure
(defn last-plus-square-numbers 
  ([] (last-plus-square-numbers 1))
  ([n] (lazy-seq (
                   ;cons returns a NEW sequence where the first arg is the
                   ; first element and the second arg is the rest
                   cons (+ (* n n) 1) (
                            last-plus-square-numbers (inc n)
                          )
                 )
        )
   )
  )

(take 5 (last-plus-square-numbers))
```


### The current status of the defrecord and protocol features (these features were still under development as this book was being developed)

http://blog.klipse.tech/clojurescript/2016/04/25/records-wacky-maps.html

https://clojuredocs.org/clojure.core/defrecord

```eval-clojure
(defprotocol Animal
  (cry [this]))

(deftype Bird []
  Animal
  (cry [this] "Tweet tweet!"))

(deftype Dog []
  Animal
  (cry [this] "Woof woof!"))

(def Pluto (Dog.))
(def Tweety (Bird.))

(map cry [Pluto Tweety])
```

## Do

### Implement an unless with an else condition using macros.

Worked in clojure runtime but NOT in clojure script I don't know whyf
```eval-clojure
(defmacro unless [pred a b]
  `(if (not ~pred) ~a ~b))

(unless false (println "Will print") (println "Will not print"))
```


### Write a type using defrecord that implements a protocol.

https://blog.jayway.com/2013/02/05/learn-clojure-using-records-and-protocols/


Protocol is like an interface.

```eval-clojure
(defprotocol Greet
  (sayHello [this]))

(defrecord Person [^String firstName ^String lastName]
  Greet
  (sayHello [this] (print "Hello, my name is " firstName " " lastName))
  )

(def robert (Person. "Rob" "Met"))

(sayHello robert)

```


## Util

Finaly block for playing aroud:
```eval-clojure
  (println "Hello")
```
