(add-to-list 'load-path "~/.emacs.d/lisp")
(setq custom-file "~/.emacs.d/custom.el")

(load "~/.emacs.d/pkgs.el")
(load custom-file)
(load-library "init-appearance")
(load-library "init-functions")
(load-library "init-addons")
(load-library "init-keys")

(setq debug-on-error nil)
(dired "~")
