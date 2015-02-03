;; helper functions


(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis. Else go to the
   opening parenthesis one level up."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1))
	(t
	 (backward-char 1)
	 (cond ((looking-at "\\s\)")
		(forward-char 1) (backward-list 1))
	       (t
		(while (not (looking-at "\\s("))
		  (backward-char 1)
		  (cond ((looking-at "\\s\)")
			 (message "->> )")
			 (forward-char 1)
			 (backward-list 1)
			 (backward-char 1)))
		  ))))))


(defun shift-text (distance)
  (if (use-region-p)
      (let ((mark (mark)))
        (save-excursion
          (indent-rigidly
	   (region-beginning)
	   (region-end)
	   distance)
          (push-mark mark t t)
          (setq deactivate-mark nil)))
    (indent-rigidly
     (line-beginning-position)
     (line-end-position)
     distance)))

(defun shift-right (count)
  (interactive "*p")
  (shift-text count))

(defun shift-left (count)
  (interactive "*p")
  (shift-text (- count)))

(defvar goto-last-change-undo-tree-node nil)
(make-variable-buffer-local 'goto-last-change-undo-tree-node)

(defun undo-tree-goto-last-change (&optional mark-point minimal-line-distance)
  "Set point to the position of the last change.
   Consecutive calls set point to the position of the previous change.
   With a prefix arg (optional arg MARK-POINT non-nil), set mark so \
   \\[exchange-point-and-mark]
   will return point to the current position."

  (interactive "P")
  (undo-list-transfer-to-tree)

  (when mark-point
    (push-mark))
  (unless minimal-line-distance
    (setq minimal-line-distance 10))

  (let ((position nil)
	(utree-node (if (and (eq this-command last-command) goto-last-change-undo-tree-node)
			goto-last-change-undo-tree-node
		      (undo-tree-current buffer-undo-tree)))
	undo)
    (while (and utree-node
                (or (not position)
                    (eql position (point))
                    (and minimal-line-distance
                         ;; The first invocation always goes to the last change, subsequent ones skip
                         ;; changes closer to (point) then minimal-line-distance.
                         (memq last-command '(undo-tree-goto-last-change))
                         (< (count-lines (min position (point-max)) (point))
                            minimal-line-distance))))
      (setq undo (car (undo-tree-node-undo utree-node)))
      (cond ((and (consp undo) (integerp (car undo)) (integerp (cdr undo)))
	     ;; (BEG . END)
	     (setq position (cdr undo)))
	    ((and (consp undo) (stringp (car undo))) ; (TEXT . POSITION)
	     (setq position (abs (cdr undo))))
	    ((and (consp undo) (eq (car undo) t))) ; (t HIGH . LOW)
	    ((and (consp undo) (null (car undo)))
	     ;; (nil PROPERTY VALUE BEG . END)
	     (setq position (cdr (last undo))))
	    ((and (consp undo) (markerp (car undo)))) ; (MARKER . DISTANCE)
	    ((integerp undo))		; POSITION
	    ((null undo))		; nil
	    (t (error "Invalid undo entry: %s" undo)))
      (setq utree-node (undo-tree-node-previous utree-node)))

    (cond (position
	   (setq goto-last-change-undo-tree-node utree-node)
	   (goto-char (min position (point-max))))
	  ((and (eq this-command last-command)
		goto-last-change-undo-tree-node)
	   (setq goto-last-change-undo-tree-node nil)
	   (error "No further undo information"))
	  (t
	   (setq goto-last-change-undo-tree-node nil)
	   (error "Buffer not modified")))))


(defun insert-random-uuid ()
  "Insert a random universally unique identifier (UUID).

   UUID is a 32 digits hexadecimal formatted in certain way with dash.
   Example of a UUID: 1df63142-a513-c850-31a3-535fc3520c3d."
  (interactive)
  (insert
   (format "%04x%04x-%04x-4%03x-%04x-%06x%06x"
           (random (expt 16 4))
           (random (expt 16 4))
           (random (expt 16 4))
           (random (expt 16 3))
           (random (expt 16 4))
           (random (expt 16 6))
           (random (expt 16 6)))))


(defun transpose-windows (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
	    (next-win (window-buffer (funcall selector))))
	(set-window-buffer (selected-window) next-win)
	(set-window-buffer (funcall selector) this-win)
	(select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))


(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ffip-project-root))
	(file-name (buffer-file-name)))
    (if project-dir
	(progn
	  (neotree-dir project-dir)
	  (neotree-find file-name))
      (progn
	(message "Could not find git project root.")
	(neotree-show)))))


(defun newline-and-indent-relative ()
  (interactive)
  (newline)
  (indent-relative-maybe))
