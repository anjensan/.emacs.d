(setq user-full-name "Andrei Zhlobich")
(setq user-mail-address "a.zhlobich@gmail.com")

(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'eshell)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(load-library "my-packages")
(load-library "my-appearance")
(load-library "my-functions")
(load-library "my-addons")
(load-library "my-bindings")

(setq debug-on-error nil)
(dired "~")
