(require 'ergoemacs-mode)

; ergoemacs bind RET incorrectly (broke smex)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-RET") 'newline)


;; ---

(ergoemacs-theme-component aj-fn-keys ()
  "My Fn keys"

  (global-set-key (kbd "<f2>") 'kmacro-call-macro)
  (global-set-key (kbd "<f3>") 'kmacro-start-macro-or-insert-counter)
  (global-set-key (kbd "<f4>") 'kmacro-end-or-call-macro)
  (global-set-key (kbd "<f5>") 'revert-buffer)

  (global-set-key (kbd "<f6>") 'toggle-word-wrap)
  (global-set-key (kbd "<C-f6>") 'toggle-truncate-lines)

  (global-set-key (kbd "<f7>") 'highlight-indentation-mode)
  (global-set-key (kbd "<C-f7>") 'rainbow-delimiters-mode)

  (global-set-key (kbd "<f8>") 'flycheck-mode)
  (global-set-key (kbd "<C-f8>") 'font-lock-mode)

  (global-set-key (kbd "<f9>") 'linum-mode)
  (global-set-key (kbd "<C-f9>") 'global-linum-mode)

  (global-set-key (kbd "<C-f10>") 'menu-bar-mode)
  (global-set-key (kbd "<M-f10>") 'ergoemacs-mode)

  )


(ergoemacs-theme-component aj-navigation ()
  "My navigation keys"

  (global-set-key (kbd "<C-tab>") 'next-buffer)
  (global-set-key (kbd "<C-S-tab>") 'previous-buffer)
  (global-set-key (kbd "<C-S-iso-lefttab>") 'previous-buffer)

  (global-set-key (kbd "M-1") 'ergoemacs-previous-user-buffer)
  (global-set-key (kbd "M-!") 'previous-buffer)

  (global-set-key (kbd "M-2") 'delete-window)
  (global-set-key (kbd "M-@") 'quit-window)

  (global-set-key (kbd "M-3") 'delete-other-windows)
  (global-set-key (kbd "M-#") 'transpose-windows)

  (global-set-key (kbd "M-4") '(split-window-right split-window-vertically))
  (global-set-key (kbd "M-$") '(split-window-below split-window-horizontally))
  
  (global-set-key (kbd "M-5") 'ergoemacs-next-user-buffer)
  (global-set-key (kbd "M-%") 'next-buffer)

  (global-set-key (kbd "M-,") 'pop-tag-mark)
  (global-set-key (kbd "M-.") 'find-tag)
  )


(ergoemacs-theme-component aj-fixed-keys ()
  "My Fixed Shortcuts"
  :variable-reg nil

  (global-set-key (kbd "C-d") 'rgrep)
  (global-set-key (kbd "C-p") 'find-file-in-project)
  (global-set-key (kbd "C-j") 'join-line)
  (global-set-key (kbd "C-e") 'highlight-symbol-at-point)

  ; todo: review
  (global-set-key (kbd "C-g") 'magit-status)
  (global-set-key (kbd "C-'") 'dired-jump)
  (global-set-key (kbd "C-Z") 'undo-tree-visualize)
  (global-set-key (kbd "C-y") 'reposition-window)
  (global-set-key (kbd "C-v") 'flycheck-list-errors)
  (global-set-key (kbd "C-b") 'bs-show)

  (global-set-key (kbd "C-,") 'undo-tree-goto-last-change)
  (global-set-key (kbd "C-.") 'keyboard-quit)

  (global-set-key (kbd "C-<") 'shift-left)
  (global-set-key (kbd "C->") 'shift-right)

  (global-set-key (kbd "C-k") 'ace-jump-mode)
  (global-set-key (kbd "C-r") '("C-x r" nil))  ; region & bookmarks

  (global-set-key (kbd "M-'") 'comment-DWIM)
  )


(ergoemacs-theme-component aj-ct-keys ()
  "Some stuff keys prefixed with C-t"
  :first-is-variable-reg "C-t"

  (global-set-key (kbd "C-t t") 'transpose-sexps)
  (global-set-key (kbd "C-t C-t") 'transpose-sexps)

  (global-set-key (kbd "C-t w") 'transpose-words)
  (global-set-key (kbd "C-t l") 'transpose-lines)
  (global-set-key (kbd "C-t p") 'transpose-paragraphs)
  (global-set-key (kbd "C-t s") 'transpose-sentences)

  (global-set-key (kbd "C-t o") 'ff-get-other-file)

  (global-set-key (kbd "C-t c") 'capitalize-word)
  (global-set-key (kbd "C-t d") 'downcase-word)
  (global-set-key (kbd "C-t u") 'upcase-word)
  (global-set-key (kbd "C-t e") 'ergoemacs-toggle-camel-case)

  (global-set-key (kbd "C-t a") 'sort-lines)
  (global-set-key (kbd "C-t i") 'sort-includes)

  (global-set-key (kbd "C-t m") 'mmm-ify-region)
  )


(ergoemacs-theme-component aj-delete ()
  "Exteded deletion keys"

  (global-set-key (kbd "M-d") 'delete-backward-char)
  (global-set-key (kbd "M-f") 'delete-char)
  (global-set-key (kbd "M-D") 'backward-kill-sexp)
  (global-set-key (kbd "M-F") 'kill-sexp)
  (global-set-key (kbd "M-S-<backspace>") 'backward-kill-sexp)
  (global-set-key (kbd "M-S-<delete>") 'kill-sexp)
)


(ergoemacs-theme-component aj-move-buffer ()
  "Exteded deletion keys"
  (global-unset-key (kbd "M->"))
  (global-unset-key (kbd "M-<"))
  (global-set-key (kbd "M-y") 'ergoemacs-beginning-or-end-of-buffer)
  (global-set-key (kbd "M-Y") 'ergoemacs-end-or-beginning-of-buffer)
)


(ergoemacs-theme-component aj-misc ()
  "My misc keys"

  (global-set-key (kbd "M-b") 'ido-switch-buffer)
  (global-set-key (kbd "M-B") 'ibuffer)
  (global-set-key (kbd "M-n") 'idomenu)

  (global-set-key (kbd "M-m") 'flycheck-next-error)
  (global-set-key (kbd "M-M") 'flycheck-previous-error)

  (global-set-key (kbd "M-T") 'ergoemacs-call-keyword-completion)
  (global-set-key (kbd "M-t") 'dabbrev-expand)

  )

(defmacro mk-push-command-event (keysym)
  (let ((fn-name (intern (concat "push-command-event--" (symbol-name keysym)))))
  `(defun ,fn-name ()
     (interactive)
     (push (cons t ',keysym) unread-command-events))))


;;; Variable Components
(ergoemacs-theme-component aj-move-char ()
  "Move Char"
  :variable-reg ".*"

  (global-set-key (kbd "M-j") (mk-push-command-event left))
  (global-set-key (kbd "M-l") (mk-push-command-event right))
  (global-set-key (kbd "M-i") (mk-push-command-event up))
  (global-set-key (kbd "M-k") (mk-push-command-event down))

  (global-set-key (kbd "M-C-j") (mk-push-command-event C-left))
  (global-set-key (kbd "M-C-l") (mk-push-command-event C-right))
  (global-set-key (kbd "M-C-i") (mk-push-command-event C-up))
  (global-set-key (kbd "M-C-k") (mk-push-command-event C-down))

  (global-set-key (kbd "M-C-J") (mk-push-command-event M-left))
  (global-set-key (kbd "M-C-L") (mk-push-command-event M-right))
  (global-set-key (kbd "M-C-I") (mk-push-command-event M-up))
  (global-set-key (kbd "M-C-K") (mk-push-command-event M-down))

  (global-set-key (kbd "M-C-u") 'highlight-symbol-prev)
  (global-set-key (kbd "M-C-o") 'highlight-symbol-next)

  ; isearch binds some M-* keys, whick may block navigation keys
  (when isearch-mode-hook
    :modify-map t
    :full-shortcut-map t
    (define-key isearch-mode-map (kbd "M-j") 'isearch-other-control-char)
    (define-key isearch-mode-map (kbd "M-l") 'isearch-other-control-char)
    (define-key isearch-mode-map (kbd "M-i") 'isearch-other-control-char)
    (define-key isearch-mode-map (kbd "M-k") 'isearch-other-control-char)
    )

  )

(ergoemacs-theme-component aj-move-pages ()
  "Move by Page"
  (global-set-key (kbd "M-I") '(scroll-down-command scroll-down))
  (global-set-key (kbd "M-K") '(scroll-up-command scroll-up)))

(ergoemacs-theme-component aj-search ()

  "Search and Replace"
  (global-set-key (kbd "M-;") 'isearch-forward)
  (global-set-key (kbd "M-:") 'isearch-backward)
  
  (global-set-key (kbd "M-^") 'query-replace-regexp)
  (global-set-key (kbd "M-6") 'query-replace)
  
  (global-set-key (kbd "C-M-%") nil)
  (global-set-key (kbd "M-%") '(vr/query-replace query-replace-regexp))

  (define-key browse-kill-ring-mode-map (kbd "M-;") 'browse-kill-ring-search-forward)
  (define-key browse-kill-ring-mode-map (kbd "M-:") 'browse-kill-ring-search-backward)

  (when company-completion-started-hook
    :modify-map t
    (define-key company-active-map (kbd "M-;") 'company-search-candidates))

  )

(ergoemacs-theme-component aj-select-items ()
  "Select Items"
  (global-set-key (kbd "M-S-SPC") 'mark-paragraph)

  (global-set-key (kbd "M-7") 'ergoemacs-select-current-line)
  (global-set-key (kbd "M-&") 'ergoemacs-select-current-block)

  (global-set-key (kbd "M-8") 'er/expand-region)
  (global-set-key (kbd "M-*") 'er/contract-region)

  (global-set-key (kbd "M-9") 'goto-match-paren)
  (global-set-key (kbd "M-(") '(er/mark-inside-quotes ergoemacs-select-text-in-quote))

  (global-set-key (kbd "M-0") 'yafolding-toggle-element)
  (global-set-key (kbd "M-)") 'yafolding-toggle-all)
 )


;; ---

(ergoemacs-theme AJ ()
  "AnJensan's mode"

  :components
  '(
    aj-move-buffer
    aj-move-char
    move-bracket
    move-line
    aj-move-pages
    move-paragraph
    move-word

    execute
    kill-line
    misc
    copy

    ;fixed-newline
    standard-fixed
    ; search
    aj-select-items
    switch
    text-transform
    standard-vars
    help
    quit

    backspace-del-seq

    dired-to-wdired
    ido-remaps
    dired-tab
    ergoemacs-remaps

    helm-remaps
    multiple-cursors-remaps

    aj-fixed-keys
    aj-delete
    aj-ct-keys
    aj-fn-keys
    aj-misc
    aj-navigation
    aj-search
 
    )

  ; restore, sometimes WM already use M-SPC 
  (global-set-key (kbd "C-SPC") 'set-mark-command)
  (global-set-key (kbd "<C-return>") 'company-complete)

  )


;; ---

;; navigate using RU-keys
;; see http://ru-emacs.livejournal.com/82428.html

(defun reverse-input-method (input-method)
  "Build the reverse mapping of single letters from INPUT-METHOD."
  (interactive
   (list (read-input-method-name "Use input method (default current): ")))
  (if (and input-method (symbolp input-method))
      (setq input-method (symbol-name input-method)))
  (let ((current current-input-method)
        (modifiers '(nil (control) (meta) (control meta))))
    (when input-method
      (activate-input-method input-method))
    (when (and current-input-method quail-keyboard-layout)
      (dolist (map (cdr (quail-map)))
        (let* ((to (car map))
               (from (quail-get-translation
                      (cadr map) (char-to-string to) 1)))
          (when (and
		 (characterp from)
		 (characterp to)
		 (/= from to)
		 (> from 127)  ; hack - don't convert ascii letters
		 )
            (dolist (mod modifiers)
              (define-key local-function-key-map
                (vector (append mod (list from)))
                (vector (append mod (list to)))))))))
    (when input-method
      (activate-input-method current))))


(load-library "russian-colemak")

(setq default-input-method
      (if (equal (getenv "ERGOEMACS_KEYBOARD_LAYOUT") "colemak")
	  'russian-colemak 'russian-computer))

(reverse-input-method default-input-method)

;; ---

(setq ergoemacs-theme "AJ")
(setq ergoemacs-handle-ctl-c-or-ctl-x 'only-C-c-and-C-x)
(ergoemacs-mode 1)

