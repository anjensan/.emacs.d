;; pkgs.el

(require 'cl)
(require 'package)

(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defvar required-packages)

; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun install-all-required-packages ()
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))


(setq package-pinned-archives
      '((clojure-mode . "melpa-stable")
	(cider . "melpa-stable")))

(setq required-packages
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

(unless (packages-installed-p)
  (install-all-required-packages))
