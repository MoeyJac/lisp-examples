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

(defmacro if-let (binding true-expr false-expr)
    `(let (,binding)
        (if ,(first binding) ,true-expr ,false-expr)))

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