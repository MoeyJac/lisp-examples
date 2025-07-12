(defun plusf (a b) `(+ ,a ,b))
(defmacro plusm (a b) `(+ ,a ,b))

(defun test ()
    (if t 
        (progn
            (princ "Hello ")
            (princ "World")
        )
    )
)

; (when t (princ "Hello") (princ "World"))

; (let ((x x-value))
;     (if x true-expr false-expr))

; (if-let (x x-value) true-expr false-expr)

; (defmacro if-let (binding true-expr false-expr)
;     `(let (,binding)
;         (if ,(first binding) ,true-expr ,false-expr)))

(defmacro if-swap (stmt false-expr true-expr)
    `(if ,stmt ,true-expr ,false-expr))

(defun my-when (condition true-fn)
    (if condition (funcall true-fn)))

; (my-when (< 41 42)
;         (lambda ()
;           (princ "Hello")
;           (princ "World")
;         )
; )

(defun foof () 42)
(defmacro foom () 42)

; (defmacro my-and (&rest x)
;     (if (= (length x) 1) 
;             (first x) 
;             `(if ,(first x) 
;                 ,(first x) 
;                 (my-and ,@(cdr x))
;             )
;     )
; )

(defmacro my-and (&rest x)
    (cond
        ((null x)   'nil)
        ((first x)  (first x))
        (t          `(my-and ,@(cdr x)))
    ) 
)

; (defun foo (a b &optional (c 42)) (list a b c))

(defun foo (&key (a 42) b c) (list a b c))

; (defmacro if-let ((x x-val) true-expr &optional false-expr)
;     `(let ((,x ,x-val))
;         (if ,x ,true-expr ,false-expr)))

; (defpackage :com.example
;     (:use :cl)
;     (:export :test))

; (in-package :com.example)

; (defun test1() "Test from the example package")

; (defpackage :com.example2
;     (:use cl)
;     (:import-from :com.example #:test1)
;     (:export #:test2))

; (in-package :com.example2)

; (defun test2 () (test1))

; do ((var var-init (var-next))) (stop-condition optional-return-val)


(defmacro for ((var from to) &rest body)
    (let ((sym-to (gensym)))
        `(do ((,var ,from (1+ ,var)) 
                (,sym-to ,to))
            ((>= ,var ,sym-to) t)
            ,@body)))
