(define native-apply apply)

(load "metacircular/common.scm")

(load "metacircular/apply.scm")
(load "metacircular/assignment.scm")
(load "metacircular/begin.scm")
(load "metacircular/boolean.scm")
(load "metacircular/conditional.scm")
(load "metacircular/definition.scm")
(load "metacircular/environment.scm")
(load "metacircular/eval.scm")
(load "metacircular/lambda.scm")
(load "metacircular/let.scm")
(load "metacircular/quote.scm")
(load "metacircular/repl.scm")
(load "metacircular/sequence.scm")
(load "metacircular/variable.scm")

(load "metacircular/global.scm")

(define the-global-environment (setup-environment))

