# Seven Languages Day 3

Lots of use of Java here so not in the gitbook

## Find a queue implementation that blocks when the queue is empty and  waits for a new item in the queue

seque

http://clojuredocs.org/clojure.core/seque

```eval-clojure
(let [start (System/nanoTime)
             q (seque
                 (iterate
                   #(do (Thread/sleep 400) (inc %))
                   0))]
         (println "sleep five seconds...")
         (Thread/sleep 5000)
         (doseq [i (take 20 q)]
           (println (int (/ (- (System/nanoTime) start) 1e7))
                    ":" i)))
```

## Do: Use refs to create a vector of accounts in memory. Create debit and credit functions to charge the balance of an account

Didn't do myself but looked at:
https://www.bennadel.com/blog/2101-seven-languages-in-seven-weeks-clojure---day-3.htm
