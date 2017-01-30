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

(require 'dired-x)

(setq dired-dwim-target t)

(provide 'init-better-defaults)
