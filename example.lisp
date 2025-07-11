; Lisp practice functions
; Joe Macaluso 2025-07-11

; (format t "Hello, World!")

; (defun ask-name ()
;     (format t "Name: ")
;     (finish-output)
;     (read-line))

; (defun ask-and-return ()
;     (let ((name (ask-name)))
;         (setf name (concatenate 'string "Hi " name "!"))
;         (format t "~A~%" name)
;         name))

; (princ (ask-and-return))

; (let* ((x 42) (y x))
;     (princ x)
;     (terpri)
;     (princ y))

; (defun print-sign (n)
;     (format t (if (< n 0) 
;                     "negative"
;                     (if (= n 0) 
;                         "zero" 
;                         "positive"))))

; (defun print-sign (n)
;     (format t "~A~%"
;             (cond
;                 ((< n 0) (format t "Chosen branch ") "negative")
;                 ((= n 0)    "zero")
;                 (t          "positive"))))


; (print-sign -1)


; (defun next-number (n)
;     (if (= (mod n 2) 0) 
;         (progn
;             (format t "Divide!")
;             (/ n 2)
;         )
;         (+ (* 3 n) 1)
;     )
; )

; (princ (next-number 16))


; (defun read-number ()
;     (format t "Write a number: ")
;     (finish-output)
;     (parse-integer (read-line)))

; (defun read-and-sum (n)
;     (let ((total 0))
;         (dotimes (i n total)
;             (setf total (+ total (read-number)))
;         )
;     )
; )

; (defun read-and-sum (n)
;     (let ((total 0))
;         (do ((i 0 (+ i 1))) ((= i n) total)
;             (setf total (+ total (read-number)))
;         )
;     )
; )

; (defun read-and-sum (n)
;     (let ((total 0))
;         (do ((i (read-number) (read-number))) ((= i 0) total)
;             (setf total (+ total i))
;         )
;     )
; )

; (princ (read-and-sum 5))