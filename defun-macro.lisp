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