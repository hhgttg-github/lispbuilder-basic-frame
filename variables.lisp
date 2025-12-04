
;;;;=====================================
;;;;
;;;; BUFFERS

(defparameter *key-buffer* nil)

(defun put-buffer (k)
  (setf *key-buffer* (append *key-buffer* (list k))))

(defun get-buffer ()
  (if *key-buffer*
      (pop *key-buffer*)
      nil))

;;;;=====================================
;;;;
;;;; CONSTANT


;;;;=====================================
;;;;
;;;; VARIBLES

(defparameter *sheet16* nil)
(defparameter *sp* nil)
