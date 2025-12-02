
;;;;====================================
;;;;
;;;; M A I N

(defun main-loop ()
  (sdl:with-events ()
    (:quit-event() t)
    (:key-down-event
     (:key key)
     (if  (sdl:key= key :sdl-key-escape )
	  (sdl:push-quit-event)
))))

(defun main()
  (sdl:with-init ()
    (sdl:window 640 480)
    (sdl:update-display)
    (main-loop)))
