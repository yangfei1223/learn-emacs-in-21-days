;;
;;    VIEW SETTINGS
;;

;;hide toolbar
(tool-bar-mode -1)

;;hide scrollbar
(scroll-bar-mode -1)

;;show line number
(global-linum-mode t)

;;hide start surface
(setq inhibit-splash-screen t)

;;cursor type
(setq-default cursor-type 'bar)

;;start with fullscreen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;highlight curent line
(global-hl-line-mode t)



(provide 'init-ui)
