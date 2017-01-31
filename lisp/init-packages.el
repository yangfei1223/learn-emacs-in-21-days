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
			   web-mode
			   js2-refactor
			   expand-region
			   iedit
			   org-pomodoro
			   helm-ag
			   flycheck
			   auto-yasnippet
			   evil
			   evil-leader
			   window-numbering
			   evil-surround
			   evil-nerd-commenter
			   which-key
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

(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)



;;config for js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

;;let system could find executable
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "PATH")


;;config for popwin
(require 'popwin)
(popwin-mode t)


;;config for web mode
(defun my-web-mode-ident-setup ()
  (setq web-mode-markup-indent-offset 2) ;html tag
  (setq web-mode-css-indent-offset 2)    ;css
  (setq web-mode-code-indent-offset 2)   ;js code
  )  

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)


(defun my-toggle-web-indent ()
  (interactive)
  ;;web development
  (if (or (eq major-mode 'js-mode) (eq major-mode js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2)4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2)4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2)4 2))))

  (setq indent-tabs-mode nil))



;;config for js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)


;;org-pomodoro
(require 'org-pomodoro)

;;flycheck activate
;;(global-flycheck-mode t)
(add-hook 'prog-mode-hook 'flycheck-mode)

;;yasnippet
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;;config for  evil mode
(evil-mode t)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(setq evil-want-C-u-scroll t)

;;evil leader
(global-evil-leader-mode)
(evil-leader/set-key
  "ff" 'find-file
  "fr" 'recentf-open-files
  "bb" 'switch-to-buffer
  "kb" 'kill-buffer
  "pf" 'counsel-git
  "ps" 'helm-do-ag-project-root
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":" 'counsel-M-x
  "wm" 'delete-other-windows
  "qq" 'save-buffers-kill-terminal)


;;window-numbering
(window-numbering-mode t)

;;evil-surround
(require 'evil-surround)
(global-evil-surround-mode t)

;;evil-nerd-commenter
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
;; (evilnc-default-hotkeys)



;;use kjhl in other modes
(dolist (mode '(ag-mode
		flycheck-error-list-mode
		occur-mode
		git-rebase-mode
		))
  (add-to-list 'evil-emacs-state-modes mode))

(add-hook 'occur-mode-hook
	  (lambda ()
	    (evil-add-hjkl-bindings occur-mode-map 'emacs
	      (kbd "/")  'evil-search-forward
	      (kbd "n")  'evil-search-next
	      (kbd "N")  'evil-search-previous
	      (kbd "C-d")  'evil-scroll-down
	      (kbd "C-u")  'evil-scroll-up)))

;;which key
(which-key-mode t)
;;(setq which-key-side-window-location 'right)



(provide 'init-packages)
