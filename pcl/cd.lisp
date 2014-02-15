
(defun populate-db ()
  (add-record (make-cd "alone" "mad season" 9 t))
  (add-record (make-cd "Roses" "Kathy Mattea" 7 t))
  (add-record (make-cd "Fly" "Dixie Chicks" 8 t))
  (add-record (make-cd "Home" "Dixie Chicks" 9 t))
  (add-record (make-cd "Rockin the burbs" "ben folds" 4 t))
  (add-record (make-cd "give us a break" "limpopo" 8 t))
  (add-record (make-cd "Lyle Lovett" "Lyle Lovett" 9 t)))

(defun make-cd (title artist rating ripped)
   (list 
    :title title 
    :artist artist 
    :rating rating 
    :ripped ripped))

(defvar *db* nil)

(defun add-record (cd) 
  (push cd *db*))

(defun db-dump ()
  (dolist (cd *db*)
    (format t "~{~a:~8t~a~%~}~%" cd)))

(defun dump-db2 ()
  (format t "~{~{~a:~10t~a~%~}~%~}" *db*))

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun prompt-for-cd ()
  (make-cd
   (prompt-read "Title")
   (prompt-read "Artist")
   (or (parse-integer (prompt-read "Rating") :junk-allowed t) 0)
   (y-or-n-p "Ripped [y/n]: ")))

(defun add-cds ()
  (loop (add-record (prompt-for-cd))
    (if (not (y-or-n-p "Another? [y/n]: ")) (return))))

(defun save-db (filename)
  (with-open-file (out filename
		   :direction :output
		   :if-exists :supersede)
    (with-standard-io-syntax
      (print *db* out))))

(defun load-db (filename)
  (with-open-file (in filename)
    (with-standard-io-syntax
      (setf *db* (read in)))))

(defun select-by-artist (artist)
  (remove-if-not
   #'(lambda (cd) (equal (getf cd :artist) artist)) 
   *db*))

(defun select (selector-fn)
  (remove-if-not selector-fn *db*))