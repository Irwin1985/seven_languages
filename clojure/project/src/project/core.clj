(ns project.core
  (:gen-class))

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

(defn big "Function to determine is string is big" [st n]
  (> (count st) n)
  )


(defn collection-type [col]
  (cond
    (list? col) ":list"
    (map? col) ":map"
    (vector? col) ":vector"
    :else "I don't know what this is")
  )

(defn day1 [] 
  (do
     (println "\n\nStart of Day1 XXX")
     (println "\nBig function")
     (test "Less" big ["awesomenessness" 11] true)
     (test "More" big ["awesomenessness" 51] false)

     (println "\nCollection Type function")
     (test "List" collection-type [ () ] ":list")
     (test "Map" collection-type [ {:1 "one" :2 "two"} ] ":map")
     (test "Vector" collection-type [ [:first :second :third] ] ":vector")
     (println "\nEnd of Day1")
  )  
)


(defmacro unless [pred a b]
  `(if (not ~pred) ~a ~b))


(defn day2 [] 
  (do
     (println "\n\nStart of Day2")
     (println "nif")
     (unless false (println "Will print - false test") (println "Will not print"))
     (unless true (println "Will NOT print") (println "Will print - true test"))

     (println "End of Day2")
  )  
)
(defn day3 [] 
  (do
     (println "\n\nStart of Day3")
     (println "End of Day3")
  )  
)

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (do
     (println "Start of Clojure")
     (day1 )
     (day2 )
     (day3 )
     (println "End of Clojure")
  )
)
