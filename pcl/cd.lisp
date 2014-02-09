 (defun make-cd (title artist rating ripped)
   (list 
    :title title 
    :artist artist 
    :rating rating 
    :ripped ripped)
   )

(defvar *db* nil)

(defun add-record (cd) 
  (push cd *db*))

; (add-record (make-cd "alone" "mad season" 9 t))
; (add-record (make-cd "Roses" "Kathy Mattea" 7 t))
; (add-record (make-cd "Fly" "Dixie Chicks" 8 t))
; (add-record (make-cd "Home" "Dixie Chicks" 9 t))

(defun db-dump ()
  (dolist (cd *db*)
    (format t "~{~a:~8t~a~%~}~%" cd)))
