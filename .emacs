;;
;; Symlink this file into home directory as .emacs
;;
;; Can also use it stand alone as the basic niceties are included here and it will load
;; .emacs.d/init.el of one exists. 

;; That way the .emacs can be copied around to use at the shell but the full blown environment
;; for the GUI can just checked out of github. Also keeps command line loads light weight.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(set-default-coding-systems 'utf-8)

;; Put all backups in system temp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Force customisations to a file rather than having the .emacs or init file poked at
(setq custom-file "~/.emacs.d/_emacs-custom.el")
(if (not (file-exists-p custom-file)) 
    (write-region "" nil custom-file)) 
(load custom-file)

;; Don't do backup/lock files
(setq make-backup-files t)
(setq create-lockfiles nil)

;; Stop screen jumping around so much
(setq  scroll-preserve-screen-position t)

;; PageDown all the way to the end!!
(setq scroll-error-top-bottom t)

;; Follow symlinks - I'm going to anyway
(setq vc-follow-symlinks t)

;; Don't load site extensions after this file
(setq inhibit-default-init 1)

;;Don't do this on command line. Could save to a config file and 
;; break something on a production server while typing
;;(setq auto-save-visited-file-name t)
;;(setq auto-save-timeout 5)
;; Only enable this in specific modes eg org
(setq auto-save-default nil)

;; Don't need no steenking menu
(menu-bar-mode -1)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; Saner behavior
(setq cua-keep-region-after-copy t)

;; delete regions like CUA. Too weird otherwise
(delete-selection-mode 1)

;; Line numbers
(global-linum-mode 1)
(setq linum-format "%d ")

;; Only prompt with y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Don't hassle about running downcase-region
(put 'downcase-region 'disabled nil)

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)

;; Cycle windows with F6
(defun other-window-or-switch-buffer ()
  "Call `other-window' if more than one window is visible, switch to next buffer otherwise."
  (interactive)
  (if (one-window-p)
      (switch-to-buffer nil)
    (other-window 1)))
(global-set-key (kbd "<f6>") #'other-window-or-switch-buffer)

;; comment line or region
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)


;;;;;;;;;;;;;;;;;;;
;; Overridden keys
;;;;;;;;;;;;;;;;;;;

;; Use emacs editing extensions and standard emacs keys also work in OSX text edit 
;; https://gist.github.com/cheapRoc/9670905
(global-set-key (kbd "C-/") 'undo)
(global-set-key [(control h)] 'delete-backward-char)

;; Kill current buffer without prompt by default
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; Goto line like xemacs (apparently) - better it is one key
(global-set-key (kbd "M-g") 'goto-line)

;; Ctrl-w for delete word (for consistency bash)
(defun kill-region-or-backwards-kill-word ()
  "If transient mark mode is on and a region is selected, call `kill-region'; otherwise call `backward-kill-word'"
  (interactive)
  (if (and transient-mark-mode mark-active)
      (kill-region (point) (mark) )
    (backward-kill-word 1))) 
(global-set-key "\C-w" 'kill-region-or-backwards-kill-word)

;; Interactive search key bindings. By default, C-s runs
;; isearch-forward, so this swaps the bindings.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; buffer-menu updates on buffer delete and also appears over current window
(global-set-key "\C-x\C-b" 'ibuffer)
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))




;;  If there is an init.el then evaluate it - presumably we are in the GUI on OS X
(if (file-exists-p "~/.emacs.d/init.el")
    (load "~/.emacs.d/init.el"))


