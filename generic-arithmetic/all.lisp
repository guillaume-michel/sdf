(uiop/package:define-package :sdf/generic-arithmetic/all
  (:nicknames :sdf/generic-arithmetic)
  (:use :common-lisp)
  (:use-reexport
   :sdf/generic-arithmetic/interface
   :sdf/generic-arithmetic/numeric
   :sdf/generic-arithmetic/symbolic))
