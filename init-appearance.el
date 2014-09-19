(defvar default-font "Source Code Pro 11")
(defvar default-frame-height 40 "Default frame height")
(defvar default-frame-width 132 "Default frame width")

(set-frame-font default-font)
(set-frame-size (selected-frame) (- default-frame-width 1) default-frame-height)
(load-theme 'base16-default t)

(defface font-lock-self-class-face
  '((default (:foreground "light slate gray")))
  "Hightliht 'self' keyword in python sources."
  :group 'font-lock-faces)

(add-to-list 'default-frame-alist (cons 'font default-font))
(add-to-list 'default-frame-alist (cons 'height (+ default-frame-height 0)))
(add-to-list 'default-frame-alist (cons 'width (+ default-frame-width 1)))

(setq font-use-system-font 1)
(setq initial-scratch-message "")
(setq inhibit-startup-screen 1)
(setq uniquify-buffer-name-style 'post-forward)

(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(show-paren-mode 1)
