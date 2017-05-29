;;;;;;;;;;;
;; Sanities
;;;;;;;;;;;

;; Save customisations in one file to avoid screwing up .emacs

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(setq custom-file "~/.emacs.d/emacs-custom.el")
(if (not (file-exists-p custom-file)) 
    (write-region "" nil custom-file)) 
(load custom-file)

;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

;; Don't do backup/lock files
(setq make-backup-files t)
(setq create-lockfiles nil)

;; Stop screen jumping around so much
(setq  scroll-preserve-screen-position t)

;; Don't load site extensions after this file
(setq inhibit-default-init 1)


;;Don't do this on command line. Could save to a config file and break something while typing
;;(setq auto-save-visited-file-name t)
;;(setq auto-save-timeout 5)
;;(setq auto-save-default nil)

(menu-bar-mode -1)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; CUA Mode
;; Regions get C-x = cut, C-c = copy
;; C-v = paste, C-z = undo, C-y = redo
;; Shift-move = select text
;; Hmmmm maybe not. Let's go all in with emacs
;; (cua-mode 1)
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; delete regions like CUA. Too weird otherwise
(delete-selection-mode 1)

;; Line numbers
(global-linum-mode 1)
(setq linum-format "%d ")

;; Only prompt with y/n
(fset 'yes-or-no-p 'y-or-n-p)


;;;;;;;;;;;;;;;;;;;
;; Overridden keys
;;;;;;;;;;;;;;;;;;;

;; Need to use emacs editing extensions to get this to work in OSX text edit https://gist.github.com/cheapRoc/9670905
(global-set-key (kbd "C-/") 'undo)

(global-set-key [(control h)] 'delete-backward-char)

;; Kill current buffer without prompt by default
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; try?
;;(require 'ido)
;;(ido-mode t)

;; Ctrl-w for delete word (like bash)
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


;; Cycle windows with repeatable keystroke
;; Sigh. Won't work in terminal
;;(global-set-key (kbd "C-.") 'other-window)
;;(global-set-key (kbd "C-,") 'prev-window)

;; Do it with F6
(defun other-window-or-switch-buffer ()
  "Call `other-window' if more than one window is visible, switch
to next buffer otherwise."
  (interactive)
  (if (one-window-p)
      (switch-to-buffer nil)
    (other-window 1)))

(global-set-key (kbd "<f6>") #'other-window-or-switch-buffer)

;;  See if there are local customisations
(if (file-exists-p "~/.emacs.d/init.el")
    (load "~/.emacs.d/init.el"))

