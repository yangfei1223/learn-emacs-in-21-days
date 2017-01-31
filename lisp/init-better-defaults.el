;;some better global defaults setting


;;diabled ring bell
(setq ring-bell-function 'ignore)

;;do not backup
(setq make-backup-files nil)

;;do not autosave
(setq auto-save-default nil)

;;auto revert
(global-auto-revert-mode t)

;;selection set
(delete-selection-mode t)

;;show paren
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;abbrev mode
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;;signature
					    ("7yf" "yangfei")
					    ))


;;open recent files
(recentf-mode t)
(setq recentf-max-saved-items 25)

;;indent buffer
(defun indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))  

(defun indent-region-or-buffer ()
  "Indent a region if selected,otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
 	(message "Indented buffer.")))))


;;hipe expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))


;;dired mode
;;yes-y no-n
(fset 'yes-or-no-p 'y-or-n-p)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'diabled nil)

;;open current buffer's dir
(require 'dired-x)
(setq dired-dwim-target t)


;;hidden dos end of line
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;;remove dos end of line
(defun remove-dos-end ()
  "Replace DOS eoflns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))


;;improve occur mode
;;dwin = do what i mean.
(defun occur-dwim ()
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	     (let ((sym (thing-at-point 'symbol)))
	       (when (stringp sym)
		 (regexp-quote sym))))
	  regexp-history)
	(call-interactively 'occur))


;;default encoding to utf-8
(set-language-environment "UTF-8")





(provide 'init-better-defaults)
