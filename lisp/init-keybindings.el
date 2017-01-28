;;key binding setq




;;recent files
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;old M-x
(global-set-key (kbd "C-x M-x") 'execute-extended-command)

;;find function files
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


;;swiper key bindings
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;;open init file
(global-set-key (kbd "<f2>") 'open-my-init-file)





(provide 'init-keybindings)
