;;org mode configure


(require 'org)
;;org mode syntax
(setq org-src-fontify-natively t)

;;org agenda dir
(setq org-agenda-files '("~/Org"))
;;key bind
(global-set-key (kbd "C-c a") 'org-agenda)


(provide 'init-org)
