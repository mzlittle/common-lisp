(defparameter *school-ops*
               (list
                (make-op :action `drive-son-to-school
                     :preconds `(son-at-home car-works)
                     :add-list `(son-at-school)
                     :del-list `(son-at-home))))


; (gps `(son-at-home car-works)
;                   `(son-at-school)
;                   *school-ops*)
