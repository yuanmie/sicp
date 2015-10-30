(load "eval-v2.scm")
(load "apply-v2.scm")
(load "list-of-values.scm")
(load "eval-if.scm")
;;eval let
(load "6.scm")
;;内部定义
(load "16.scm")
(load "eval-sequence.scm")
(load "eval-assignment.scm")
(load "eval-definition.scm")
(load "eval-judge.scm")
(load "eval-data-struct.scm")
(load "env.scm")
(load "eval-run.scm")

(define the-global-environment (setup-environment))
(driver-loop)
