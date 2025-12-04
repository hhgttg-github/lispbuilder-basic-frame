
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
     (sdl:draw-surface-at-* *bg* 0 0)
     (update-sprite *sp*)
     (draw-sprite *sp*)
     (sdl:update-display)
     (incf *frame-count*))
;;     (format t "x=~a y=~a~%" (x *sp*) (y *sp*))
;;     (format t "KEY in buffer : ~A~%" (get-buffer)))    ;*key-buffer*からdeque
    (:video-expose-event
     () ; ウィンドウの位置/重なり変更で再描画などの処理
     (sdl:draw-surface-at-* *bg* 0 0)
     (draw-sprite *sp*)
     (sdl:update-display))))

(defun main()
  (sdl:with-init ()
    (sdl:window 640 480)
    (setf (sdl:frame-rate) 60)
    
    (init-bg "/home/kawabe/lisp/lispbuilder-basic-frame/BG.png")
;    (sdl:draw-surface-at-* *bg* 0 0)

    (setf *sheet16* (make-sp-sheet "/home/kawabe/lisp/lispbuilder-basic-frame/CharacterA16x16.png" 16))
    (setf *sp* (make-sprite *sheet16* 32 0 0 32 0))
;    (draw-sprite *sp*)
    (sdl:update-display)
    (main-loop)))
