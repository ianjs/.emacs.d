;;;;;;;;;;;
;; Sanities
;;;;;;;;;;;

;; Don't use hard tabs
(setq-default indent-tabs-mode nil)
(setq  scroll-preserve-screen-position t)

;; Don't load site extensions after this file
(setq inhibit-default-init 1)

;Don't do backup/lock files
(setq make-backup-files t)
(setq auto-save-visited-file-name t)
(setq auto-save-timeout 5)


(setq create-lockfiles nil)


;; Emacs can automatically create backup files. This tells Emacs to
;; put all backups in ~/.emacs.d/backups. More info:
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))

                                        ;(setq auto-save-default nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hide uninteresting stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; GUI specifics
(when (display-graphic-p)

  ;; Mmmmmm hoopy symbols like λ
  (global-prettify-symbols-mode +1)
  
  ;; Don't need toolbar
  (setq tool-bar-mode -1)
  (set-face-attribute 'default nil :height 140)

  ;; Nicer cursor
  (setq-default cursor-type 'bar)
  (setq default-frame-alist
        '((cursor-color . "white")))

  ;; Copy on select
  (setq mouse-drag-copy-region t)
  )

(menu-bar-mode -1)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)


;; CUA Mode
;; Regions get C-x = cut, C-c = copy
;; C-v = paste, C-z = undo, C-y = redo
;; Shift-move = select text
;; Hmmmm maybe not. Let's go all in with emacs
; (cua-mode 1)
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; delete regions like CUA. Too weird otherwise
(delete-selection-mode 1)

;; Line numbers
(global-linum-mode 1)
(setq linum-format "%d ")

;; Only prompt with y/n
(fset 'yes-or-no-p 'y-or-n-p)


;;  See if there are local customisations

 (if (file-exists-p "~/.emacs.d/init.el")
     (load "~/.emacs.d/init.el"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#000000"))
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" default)))
 '(fci-rule-color "#2a2a2a")
 '(global-rainbow-delimiters-mode t)
 '(package-selected-packages
   (quote
    (which-key tagedit swiper smex rainbow-delimiters paredit magit iedit ido-ubiquitous hydra company clojure-mode-extra-font-locking cider aggressive-indent ace-window)))
 '(send-mail-function nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;
;; Overridden keys
;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-/") 'undo) ;; Not in OS X text edit :-(
(global-set-key [(control h)] 'delete-backward-char)

;; Ctrl-w for delete word (like bash)
(global-set-key "\C-w" 'kill-region-or-backwards-kill-word)

;; Kill current buffer without prompt by default
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; try?
;;(require 'ido)
;;(ido-mode t)

;; Cycle windows with repeatable keystroke
;; Sigh. Won't work in terminal
;;(global-set-key (kbd "C-.") 'other-window)
;;(global-set-key (kbd "C-,") 'prev-window)

(defun kill-region-or-backwards-kill-word ()
  "If transient mark mode is on and a region is selected, call `kill-region'; otherwise call `backward-kill-word'"
  (interactive)
  (if (and transient-mark-mode mark-active)
      (kill-region (point) (mark) )
    (backward-kill-word 1)))

;; Interactive search key bindings. By default, C-s runs
;; isearch-forward, so this swaps the bindings.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

