
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;package management
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

(require 'cl)
;;add whatever packages you want here
(defvar yangfei/packages '(
			   company
			   monokai-theme
			   hungry-delete
			   smex
			   swiper
			   counsel
			   smartparens
			   js2-mode
			   exec-path-from-shell
			   ) "Default packages")

(setq package-selected-packages yangfei/packages)
     
(defun yangfei/packages-installed-p()
  (loop for pkg in yangfei/packages
	when(not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (yangfei/packages-installed-p)
  (message "%s" "Refeshing package database...")
  (package-refresh-contents)
  (dolist (pkg yangfei/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;;view set
(tool-bar-mode -1)
(scroll-bar-mode -1)
(electric-indent-mode t)
(setq inhibit-splash-screen t)
(global-linum-mode t)

;;key set
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;;open init.el
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

(setq-default cursor-type 'bar)
(setq make-backup-files nil)

;;org about
(require 'org)
(setq org-src-fontify-natively t)

;;open recent files
(require 'recentf)
(recentf-mode t)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;selection set
(delete-selection-mode t)
;;start with fullscreen
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;;paren match
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;highlight curent line
(global-hl-line-mode t)

;;Addon Config Setting
;;load monokai-theme
(load-theme 'monokai t)

;;let system could find executable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "PATH")

;;config for hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;;config for smex
(require 'smex) ;; Not needed if you use package.el
(smex-initialize) ;; Can be omitted. This might cause a (minimal) delay
;;when Smex is auto-initialized on its first run.
;;(global-set-key (kbd "M-x") 'smex)
;;(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-x M-x") 'execute-extended-command)

;;config for smartparens
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;;config for js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;;config for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;;config for org
(setq org-agenda-files '("~/Org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;;config for company
(global-company-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 3)
 '(custom-safe-themes
   (quote
    ("c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray")))))
