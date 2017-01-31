;;key binding setq



;;recent files
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;old M-x
(global-set-key (kbd "C-c M-x") 'execute-extended-command)

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


;;counsel-git
(global-set-key (kbd "C-c p f") 'counsel-git)

;;org-agenda binding
(global-set-key (kbd "C-c a") 'org-agenda)

;;indent region or buffer
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;;complete str
(global-set-key (kbd "s-/") 'hippie-expand)

;;dired mode
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;;web mode
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;;occur dwin
(global-set-key (kbd "M-s o") 'occur-dwim)

;;imenu
(global-set-key (kbd "M-s i") 'counsel-imenu)

;;expand-region select region
(global-set-key (kbd "C-=") 'er/expand-region)

;;iedit multi-line edit
(global-set-key (kbd "M-s e") 'iedit-mode)

;;org capture r aka remember
(global-set-key (kbd "C-c r") 'org-capture)

;;js2-refactor prefix keybindings
(js2r-add-keybindings-with-prefix "C-c C-m")



(provide 'init-keybindings)
