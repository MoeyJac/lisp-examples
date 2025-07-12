(defclass circle ()
  ((radius  :initarg :radius
            :initform (error "You must provide a value for the radius")
            :accessor radius)))

(defparameter *my-circle* (make-instance 'circle :radius 10))

(princ (class-of *my-circle*))

(print (slot-value *my-circle* 'radius))
(setf (slot-value *my-circle* 'radius) 20)
(print (slot-value *my-circle* 'radius))

(print (radius *my-circle*))
(setf (radius *my-circle*) 20)

(defclass colored-circle (circle)
  ((color :initarg :color
          :initform (error "You must provide a value for the color")
          :accessor color)))

(defparameter *my-colored-circle* (make-instance 'colored-circle :radius 5 :color "Green"))

(print (radius *my-colored-circle*))
(print (color *my-colored-circle*))
(setf (color *my-colored-circle*) "White")
(print (color *my-colored-circle*))


(defclass rectangle ()
  ((base  :initarg :base
          :initform (error "You must provide a value for base")
          :accessor base)
    (height :initarg :height
            :initform (error "You must povide a value for the height")
            :accessor height)))

(defparameter *my-rectangle* (make-instance 'rectangle :base 10 :height 5))

(print (base *my-rectangle*))


(defclass colored-object ()
  ((color :initarg :color
          :initform (error "You must provide a value for color")
          :accessor color)))

(defclass colored-rectangle (rectangle colored-object)
  ())

(defclass colored-circle (circle colored-object)
  ())

(defparameter *my-colored-rectangle* (make-instance 'colored-rectangle :base 10 :height 5 :color "Black"))

(print (color *my-colored-rectangle*))

(defgeneric area (shape)
  (:documentation "Compute the area of a shape"))

(defmethod area ((shape circle))
  (* pi (radius shape) (radius shape)))

(defmethod area ((shape rectangle))
  (* (base shape) (height shape)))

(print (area *my-colored-circle*))
(print (area *my-colored-rectangle*))


