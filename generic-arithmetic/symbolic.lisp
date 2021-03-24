(uiop/package:define-package :sdf/generic-arithmetic/symbolic
  (:use
   :common-lisp
   :sdf/generic-arithmetic/interface))

(in-package :sdf/generic-arithmetic/symbolic)

(defmethod binary-+ ((x symbol) (y symbol))
  (list '+ x y))

(defmethod binary-+ ((x number) (y symbol))
  (list '+ x y))

(defmethod binary-+ ((x symbol) (y number))
  (list '+ x y))
