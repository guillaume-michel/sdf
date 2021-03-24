(uiop/package:define-package :sdf/generic-arithmetic/numeric
  (:use
   :common-lisp
   :sdf/generic-arithmetic/interface))

(in-package :sdf/generic-arithmetic/numeric)

(defmethod binary-+ ((x number) (y number))
  (+ x y))
