(defvar default-frame-font "Ubuntu Mono 12" "Default frame font")
(defvar default-frame-height 40 "Default frame height")
(defvar default-frame-width 132 "Default frame width")

(when (window-system)
  ;; (load-theme 'adwaita t)
  (add-to-list 'default-frame-alist (cons 'height (+ default-frame-height 0)))
  (add-to-list 'default-frame-alist (cons 'width (+ default-frame-width 1)))
  (set-face-attribute 'default nil :font default-frame-font)
  (set-frame-size (selected-frame) (- default-frame-width 1) default-frame-height)
  )

(defface font-lock-self-class-face
  '((default (:foreground "light slate gray")))
  "Hightliht 'self' keyword in python sources."
  :group 'font-lock-faces)
