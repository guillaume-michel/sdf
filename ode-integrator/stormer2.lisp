(uiop/package:define-package :sdf/ode-integrator/stormer2
  (:use :common-lisp)
  (:export
   #:make-initial-history
   #:history-x
   #:history-t
   #:evolver
   #:stormer-2))

(in-package :sdf/ode-integrator/stormer2)

(defun make-initial-history (time h xt xt-h xt-2h)
  (list (cons time xt)
        (cons (- time h) xt-h)
        (cons (- time (* 2 h)) xt-2h)))

(defun extend-history (t+h xt+h history)
  (cons (cons t+h xt+h) history))

(defun history-t (index history)
  (car (nth index history)))

(defun history-x (index history)
  (cdr (nth index history)))

(defun stormer-2 (F h)
  (lambda (history)
    (+ (* 2 (history-x 0 history))
       (* -1 (history-x 1 history))
       (* (/ (expt h 2) 12)
          (+ (* 13 (funcall F (history-t 0 history) (history-x 0 history)))
             (* -2 (funcall F (history-t 1 history) (history-x 1 history)))
             (funcall F (history-t 2 history) (history-x 2 history)))))))

(defun stepper (h integrator)
  (lambda (history)
    (extend-history (+ (history-t 0 history) h)
                    (funcall integrator history)
                    history)))

(defun evolver (F h make-integrator)
  (let* ((integrator (funcall make-integrator F h))
         (step (stepper h integrator)))
    (labels ((evolve (history n-steps)
               (if (> n-steps 0)
                   (evolve (funcall step history) (- n-steps 1))
                   history)))
      (lambda (history n-steps) (evolve history n-steps)))))


#|
(defun F (time x)
  (declare (ignore time))
  (- x))

(defparameter s0
  (make-initial-history 0 .01 (sin 0) (sin -.01) (sin -.02)))

(history-x 0 (funcall (evolver #'F .01 #'stormer-2) s0 100))
|#
