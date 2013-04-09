;;; Play nice with shebangs
(set-dispatch-macro-character #\# #\!
 (lambda (stream character n)
  (declare (ignore character n))
  (read-line stream nil nil t)
  nil))

;;; The following lines added by ql:add-to-init-file:
#-quicklisp
(let ((quicklisp-init #P"/Applications/lispbox-0.7/quicklisp/setup.lisp"))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))
