(ns atoms.core)

(def counter (atom 0))

(add-watch counter :print #(println "Changed from " %3 " to " %4))

(def log (atom []))

(defn log-message [i]
  (format "Thread %d updating atom: %d to %d" i @counter (inc @counter)))

(def wait-for-it (promise))

(defn perform-update [i]
  (let [msg (log-message i)]
    (swap! log conj msg)
    (swap! counter inc)))

(defn perform-updates [i]
  (deref wait-for-it)
  (doseq [x (range 20)] (perform-update i)))

(def t1 (future (perform-updates 1)))
(def t2 (future (perform-updates 2)))

(defn wake-them-up []
  (deliver wait-for-it "Go for it!"))

(defn counter-value []
  (println "Current value of counter is" @counter))

(defn refresh []
  (reset! counter 0)
  (reset! log [])
  (def wait-for-it (promise))
  (def t1 (future (perform-updates 1)))
  (def t2 (future (perform-updates 2))))
