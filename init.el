(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(add-to-list 'load-path "~/.emacs.d")

(load-library "init-appearance")
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(load-library "init-functions")
(load-library "init-addons")
(load-library "init-keys")

(setq debug-on-error nil)
(dired "~")
