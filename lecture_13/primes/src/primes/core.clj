(ns primes.core
  (:require [clojure.core.reducers :as r]))

; prime? taken from http://blog.programmingdan.com/?p=35
; thanks to Daniel Gruszczyk for doing the hard work to optimize
; this algorithm for clojure!

(defn prime? [n]
  (let [sqrt (Math/sqrt n)]
    (cond
      (< n 2) false
      (= n 2) true
      (even? n) false
      :else
        (loop [i 3]
          (cond
            (> i sqrt) true
            (zero? (unchecked-remainder-int n i)) false
            (< i sqrt) (recur (+ i 2)))))))

(defn produce-range [n]
  (into [] (range n)))

(defn find-primes [numbers]
  (doall (map prime? numbers)))

(defn find-primes-par [numbers]
  (r/map prime? numbers))

(defn convert-to-numbers [primes]
  (doall (map (fn [x] (if (true? x) 1 0)) primes)))

(defn convert-to-numbers-par [primes]
  (r/map (fn [x] (if (true? x) 1 0)) primes))

(defn sum [numbers]
  (reduce + numbers))

(defn sum-par [numbers]
  (r/fold + numbers))

(defn count-primes [n]
  (sum (convert-to-numbers (find-primes (produce-range n)))))

(defn count-primes-par [n]
  (sum-par (convert-to-numbers-par (find-primes-par (produce-range n)))))
