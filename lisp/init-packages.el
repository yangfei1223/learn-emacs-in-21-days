;;package management
(require 'cl)

(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )

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
			   popwin
			   ) "Default packages")

(setq package-selected-packages yangfei/packages)

;;check and install packages
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






;;config for company
(global-company-mode t)

;;load monokai-theme
(load-theme 'monokai t)

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


;;config for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


;;config for smartparens
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;;config for js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;;let system could find executable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "PATH")


;;config for popwin
(require 'popwin)
(popwin-mode t)



(provide 'init-packages)
