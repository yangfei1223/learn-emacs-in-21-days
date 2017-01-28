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



(provide 'init-better-defaults)
