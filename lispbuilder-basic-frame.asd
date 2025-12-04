
;;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-

(defpackage lispbuilder-basic-frame
  (:use :cl :asdf))

(in-package lispbuilder-basic-frame)

(defsystem lispbuilder-basic-frame
    :name "lispbuilder-basic-frame"
    :version "0.0.1"
    :maintainer "ks"
    :author "ks"    
    :serial t
    :components (
		 (:file "variables")
;		 (:file "sprite"
;			:depends-on ("variables"))
                 (:file "main"
			:depends-on ("variables"))))

