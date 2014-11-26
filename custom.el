(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" default)))
 '(delete-selection-mode t)
 '(eshell-banner-message "")
 '(initial-scratch-message
   #(";; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with Ctrl+O,
;; then enter the text in that file's own buffer." 131 135
						       (face ergoemacs-pretty-key)
						       136 137
						       (face ergoemacs-pretty-key)))
 '(org-CUA-compatible t)
 '(org-special-ctrl-a/e t)
 '(org-support-shift-select t)
 '(recentf-menu-before "Close")
 '(recentf-mode t)
 '(rm-blacklist
   (quote
    (" yas" " ||" " ErgoAJ[colemak]" " ErgoAJ[us]" " AC" " GitGutter" " ElDoc" " Undo-Tree" " MRev")))
 '(rm-excluded-modes
   (quote
    (" yas" " ||" " ErgoAJ[colemak]" " ErgoAJ[us]" " AC" " GitGutter" " ElDoc" " Undo-Tree" " MRev")))
 '(scroll-error-top-bottom t)
 '(set-mark-command-repeat-pop t)
 '(smex-prompt-string
   #("Alt+A " 0 3
     (face ergoemacs-pretty-key)
     4 5
     (face ergoemacs-pretty-key)))
 '(sml/hidden-modes
   (quote
    (" yas" " ||" " ErgoAJ[colemak]" " ErgoAJ[us]" " AC" " GitGutter" " ElDoc" " Undo-Tree" " MRev"))))
 

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "#252525"))))
 '(mode-line ((t (:background "gray23" :foreground "#e0e0e0" :box (:line-width 1 :color "grey26")))))
 '(mode-line-inactive ((t (:inherit mode-line :background "grey13" :foreground "grey80" :box (:line-width 1 :color "grey25")))))
 '(region ((t (:background "#404144"))))
 '(vertical-border ((t (:foreground "gray22")))))
