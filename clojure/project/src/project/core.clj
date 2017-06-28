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

(defn transfer-money [a1 a2 amount]
  (dosync
    (alter a1 - amount)
    (alter a2 + amount)
    amount)
)

(defn credit [acc amount]
  (dosync
    (alter acc + amount)
    amount)
)

(defn debit [acc amount]
  (credit acc (* -1 amount))
)

;barber shop problem

(def open-for-business? (atom false))
(def haircut-count (atom 0))
(def waiting-room (ref []))
(def waiting-room-size 3)

(defn
    open-shop
    [duration]
    (future 
      (println "Opening Shop")
      (reset! open-for-business? true)
      (Thread/sleep duration)
      (println "Closing Shop")
      (reset! open-for-business? false)
    )
)

(defn
    display
    []
    (do 
      (print "\033[u")
      (print "Cuts: " @haircut-count)
      (print " Wait Room: " (dosync (count (ensure waiting-room))))
    )
)

(defn
    add-customers
    []
    (future
      (do
        (println "Starting to add customers")
        (while
            @open-for-business?
            (dosync
                (if
                    (<
                        (count (ensure waiting-room))
                        waiting-room-size
                    )
                    ;-- The waiting room is now full
                    (alter waiting-room conj :customer)
                )
            )
            (Thread/sleep
                (+ 10 (rand-int 71))
            )
        )
        (println "Finished adding customers")
      )
    )
)
(defn
    cut-hair
    []
    (future
      (do
        (println "Starting to cut-hair")
        (while
            (or @open-for-business? (dosync (count (ensure waiting-room))))
            (when-let
                [
                    next-customer
                    (dosync
                        (let
                            [
                                next-customer
                                (first (ensure waiting-room))
                            ]
                            ;-- We found the next customer
                            (when
                                next-customer
                                ;-- take the first customer off the list
                                (alter waiting-room rest)
                                next-customer
                            )
                        )
                    )
                ]
                (Thread/sleep 80)
                (swap! haircut-count inc)
            )
        )
        (println "Finished cutting hair")
      )
    )
)

(defn day3 [] 
  (do
     (println "\n\nStart of Day3")

     (println "Create bank account acc1 with 100 in it")
     (def acc1 (ref 100))
     (println "Create bank account acc2 with 100 in it")
     (def acc2 (ref 200))

     (println "Acc 1 Balance=" @acc1)
     (println "Acc 2 Balance=" @acc2)

     (println "Moving 20 from acc1 to acc2")
     (transfer-money acc1 acc2 20)

     (println "Acc 1 Balance=" @acc1)
     (println "Acc 2 Balance=" @acc2)

     (println "\n\nUsing credit and debit - breaks my double entry account system but the book told me to do it")
     (credit acc1 19000)
     (debit acc2 19001)

     (println "Acc 1 Balance=" @acc1)
     (println "Acc 2 Balance=" @acc2)

     (println "\n\n\n-------------------\nOk now the barber problem\n------------")

     (open-shop (* 10 1000))
     ;--(open-shop (* 10 50))
     (cut-hair)
     (add-customers)

     (print "\033[s")
     (while
          @open-for-business?
          (display)
     )
     (println "")
     (Thread/sleep 100)
     (println "Number of cuts:" @haircut-count)


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
