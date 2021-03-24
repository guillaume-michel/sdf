(uiop/package:define-package :sdf/generic-arithmetic/interface
  (:use :common-lisp)
  (:export
   #:binary-+))

(in-package :sdf/generic-arithmetic/interface)

(defgeneric binary-+ (x y)
  (:documentation "Generic binary addition x + y"))
