;;
;;    ORG MODE CONFIGURES
;;

(with-eval-after-load 'org

  ;;org mode syntax
  (setq org-src-fontify-natively t)

  ;;org agenda dir
  (setq org-agenda-files '("~/.emacs.d"))

  ;;rapid take note
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/.emacs.d/gdt.org" "工作安排")
	   "* TODO [#B] %?\n  %i\n"
	   :empty-lines 1)))
  )



(provide 'init-org)
