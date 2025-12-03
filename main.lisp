
;;;;====================================
;;;;
;;;; M A I N

(defun main-loop ()
  (sdl:with-events ()
    (:quit-event() t)
    (:key-down-event
     (:key key)
     (if (sdl:key= key :sdl-key-escape)
	 (sdl:push-quit-event)
	 (put-buffer key)))     ;*key-buffer*にenque
    (:idle
     ()
     (format t "KEY in buffer : ~A~%" (get-buffer)))    ;*key-buffer*からdeque
    (:video-expose-event
     () ; 再描画などの処理
     (sdl:update-display))))))
	  
(defun main()
  (sdl:with-init ()
    (sdl:window 640 480)
    (setf (sdl:frame-rate) 60)
    (sdl:update-display)
    (main-loop)))
