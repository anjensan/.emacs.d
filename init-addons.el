;; emacs doesn't work with fish shell
(setq shell-file-name "/bin/bash")

;; mode line
(require 'smart-mode-line)
(sml/apply-theme 'respectful)
(sml/setup)

;; mmm
(require 'mmm-mode)
(setq mmm-global-mode 'maybe)

;; undo
(require 'undo-tree)
(global-undo-tree-mode t)
(setq undo-tree-auto-save-history t)

;; ido & friends
(require 'uniquify)
(require 'ido)
(require 'idomenu)
(require 'smex)

(setq ido-enable-flex-matching t)
(ido-mode)
(ido-ubiquitous-mode)
(smex-initialize)
(fset 'yes-or-no-p 'y-or-n-p)

;; tags
(require 'etags-table)
(require 'ctags-update)
(setq ctags-update-command "ctags-exuberant")
(setq tags-revert-without-query 1)
(setq etags-table-search-up-depth 10)

;; iedit
(require 'iedit)

;; rainbow
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; yafolding
(require 'yafolding)

;; flycheck
(require 'flycheck)
(global-flycheck-mode 1)

;; saveplace
(require 'saveplace)
(setq save-place-file "~/.emacs.d/saved-places")
(setq-default save-place t)

;; git
(require 'magit)
(add-hook 'magit-mode-hook 'magit-load-config-extensions)
(require 'git-gutter-fringe+)
(global-git-gutter+-mode 1)

;; company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; elpy & python
(require 'elpy)
(elpy-enable)
(elpy-use-ipython)
(setq elpy-modules (delete 'elpy-module-flymake elpy-modules))
(add-to-list 'python-font-lock-keywords '("\\_<self\\_>" 0 'font-lock-self-class-face))
(add-to-list 'auto-mode-alist '("[.]rpy$" . python-mode))
(add-to-list 'auto-mode-alist '("[.]tac$" . python-mode))
(put 'test-case-name 'safe-local-variable (lambda (x) t))

;; clojure
(require 'cider)
(setq nrepl-hide-special-buffers t)
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; dired
(require 'dired)
(require 'dired-x)
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-omit-files-p t)

;; haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; snippets
(require 'yasnippet)
(setq yas-prompt-functions '(yas-ido-prompt yas-completing-prompt))
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
(remove-hook 'yas-global-mode-hook 'yas--global-mode-reload-with-jit-maybe)
(yas-global-mode 1)
(add-hook 'yas-global-mode-hook 'yas--global-mode-reload-with-jit-maybe)
