;; pkgs.el

(require 'cl)
(require 'package)

(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defvar my-packages)

(defun install-my-packages ()
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(setq package-pinned-packages
      '((clojure-mode . "melpa-stable")
	(cider . "melpa-stable")))

(setq my-packages
      '(
	ace-jump-mode
	base16-theme
	cider
	clojure-mode
	company
	ctags-update
	elpy
	ergoemacs-mode
	erlang
	etags-table
	expand-region
	find-file-in-project
	flycheck
	git-commit-mode
	git-gutter+
	git-gutter-fringe+
	git-rebase-mode
	haskell-mode
	highlight-indentation
	highlight-symbol
	hy-mode
	ido-ubiquitous
	idomenu
	iedit
	imenu-anywhere
	jinja2-mode
	lua-mode
	magit
	markdown-mode
	mmm-mode
	muse
	neotree
	org-cua-dwim
	pyvenv
	rainbow-delimiters
	smart-mode-line
	smex
	undo-tree
	yafolding
	yaml-mode
	yasnippet
	))

(unless (cl-every 'package-installed-p my-packages)
  (install-my-packages))
