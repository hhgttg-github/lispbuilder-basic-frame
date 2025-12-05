
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
     (update-sprite-list *sp-list*)
     
     (draw-sprite *sp*)
     (draw-sprite-list *sp-list*)
     
     (sdl:update-display)
     (incf *frame-count*))
;;     (format t "x=~a y=~a~%" (x *sp*) (y *sp*))
;;     (format t "KEY in buffer : ~A~%" (get-buffer)))    ;*key-buffer*からdeque
    (:video-expose-event () ; ウィンドウの位置/重なり変更で再描画などの処理
     (sdl:draw-surface-at-* *bg* 0 0)
     (draw-sprite *sp*)
     (sdl:update-display))))

(defun main()
  (sdl:with-init ()
    (sdl:window 640 480)
    (setf (sdl:frame-rate) 60)
    
    (init-bg "/home/kawabe/lisp/lispbuilder-basic-frame/BG.png")
    (setf *sheet16* (make-sp-sheet "/home/kawabe/lisp/lispbuilder-basic-frame/CharacterA16x16.png" 16))

    #| sprite単体の設定|#
    (setf *sp* (make-sprite *sheet16* 32 0 0 32 0))
    (new-frames *sp* :right '(32 33 34 33)) ;右方向のフレーム追加
    (init-animate *sp* :right 10)           ;アニメーション開始(setf freeze nil)

    #| spriteリストの設定|#
    (setf *sp-list*
	  (cons (make-sprite *sheet16* 1 320 0 0 16)
		*sp-list*))
    (new-frames (car *sp-list*) :front '(0 1 2 1))
    (init-animate (car *sp-list*) :front 20)
    
    (sdl:update-display)
    (main-loop)))
