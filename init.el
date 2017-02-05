
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;use cask to manage packages
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;;pallet init
(require 'pallet)
(pallet-mode t)

;;add load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;;open init.el
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))


;;load feature
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)

;;custom file set
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

;;optimize tramp's hanging on when start
(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

;;when using org code is needed
;;(require 'org-install)
;;(require 'ob-tangle)
;;(org-babel-load-file (expand-file-name "yangfei.org" user-emacs-directory))
