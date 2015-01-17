
(set-face-attribute 'default nil :font "Source Code Pro 11")
(set-fontset-font "fontset-default" '(#x0400 . #x04ff) "Dejavu Sans Mono")

(defvar default-frame-height 40 "Default frame height")
(defvar default-frame-width 132 "Default frame width")

(set-frame-size (selected-frame) (- default-frame-width 1) default-frame-height)
(load-theme 'base16-default t)

(defface font-lock-self-class-face
  '((default (:foreground "light slate gray")))
  "Hightliht 'self' keyword in python sources."
  :group 'font-lock-faces)

(add-to-list 'default-frame-alist (cons 'height (+ default-frame-height 0)))
(add-to-list 'default-frame-alist (cons 'width (+ default-frame-width 1)))
