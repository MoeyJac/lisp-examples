(defclass avatar () ())
(defclass warrior (avatar) ())
(defclass wizard (avatar) ())

(defclass weapon () ())
(defclass sword (weapon) ())
(defclass magic-stick (weapon) ()) 

(defgeneric make-attack (avatar weapon))

(defmethod make-attack ((avatar warrior) (weapon sword))
    (format t "Great physical attack ~%"))

(defmethod make-attack ((avatar wizard) (weapon sword))
    (format t "Bad physical attack ~%"))

(defmethod make-attack ((avatar warrior) (weapon magic-stick))
    (format t "Bad special attack ~%"))

(defmethod make-attack ((avatar wizard) (weapon magic-stick))
    (format t "Great special attack ~%"))

(let ((war (make-instance 'warrior))
      (wiz (make-instance 'wizard))
      (big-sword (make-instance 'sword))
      (old-stick (make-instance 'magic-stick)))
    (make-attack war big-sword)
    (make-attack war old-stick)
    (make-attack wiz big-sword)
    (make-attack wiz old-stick))

(defclass apprentice-wizard (wizard) ())

(defmethod make-attack ((avatar apprentice-wizard) (weapon magic-stick))
    (format t "I'm just learning.~%")
    ; calls the next closest method in the inheritence hierarchy/function type matching override
    (call-next-method))

(defmethod print-object ((obj apprentice-wizard) stream)
    (format stream "I am an apprentice"))

(let ((junior (make-instance 'apprentice-wizard))
      (old-stick (make-instance 'magic-stick)))
      (make-attack junior old-stick))