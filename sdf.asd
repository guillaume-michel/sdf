#-asdf3.1 (error "SDF requires ASDF 3.1 or later.")

(defsystem "sdf"
  :description "Playground for Software Design for Flexibility (in Common Lisp)"
  :version "0.0.1"
  :author "Guillaume MICHEL"
  :mailto "contact@orilla.fr"
  :homepage "http://orilla.fr"
  :license "MIT license"
  :class :package-inferred-system
  :depends-on ("sdf/ode-integrator/all"
               "sdf/generic-arithmetic/all"))
