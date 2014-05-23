(ns sleeping-barber)
; (load-file "day3-sleeping-barber.clj") (use 'sleeping-barber) (run)

(def barber (agent 0))
(def waiting-room (agent 0))

; Waiting room accessors.
(defn add-customer[x] (if (>= x 3) x (+ 1 x))) 
(defn rem-customer[x] (if (> x 0) (- x 1) x)) 
      
; This function pulls a customer out of the waiting room and cuts its hair,
; if such a customer exists. Call it on the barber. 
(defn cut-hair [x]
  (if (> (deref waiting-room) 0)
      (do
        (send waiting-room rem-customer)
        (Thread/sleep 20)
        (+ 1 x))
       x))

; The moment the barber handles one customer, make it poll again for another.
(defn barber-watcher [key x oldval newval] (send x cut-hair))

(defn run []
  (println "Starting simulation...")
  (def end-time (+ 10000 (System/currentTimeMillis)))
  (add-watch barber "BarberWatcher" barber-watcher)
  (send barber cut-hair)
  (loop [i 0]
    (println i "customers sent; " (deref barber) "cuts given")
    (send waiting-room add-customer)
    (Thread/sleep (+ 10 (rand 20)))
    (if (< (System/currentTimeMillis) end-time)
      (recur (+ i 1))))
  (remove-watch barber "BarberWatcher"))
