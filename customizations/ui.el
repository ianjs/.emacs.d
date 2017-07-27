;; These customizations change the way emacs looks in GUI mode. 

;; Remove the graphical toolbar at the top. 
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Color Themes
;; Read http://batsov.com/articles/2012/02/19/color-theming-in-emacs-reloaded/
;; for a great explanation of emacs color themes.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; for a more technical explanation.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'zenburn t)

;; Set selection colour to something actually visible in this theme
(set-face-attribute 'region nil :background "#aaa")


;; increase font size for better readability
(set-face-attribute 'default nil :height 140)

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it

;; Now done by restoring desktop
;;(setq initial-frame-alist '((top . 0) (left . 0) (width . 156) (height . 39)))

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
    x-select-enable-clipboard t

    ;; I'm actually not sure what this does but it's recommended?
     x-select-enable-primary t

    ;; Save clipboard strings into kill ring before replacing them.
    ;; When one selects something in another program to paste it into Emacs,
    ;; but kills something in Emacs before actually pasting it,
    ;; this selection is gone unless this variable is non-nil
     save-interprogram-paste-before-kill t

     ;; Shows all options when running apropos. For more info,
     ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
     apropos-do-all t

     ;; Mouse yank commands yank at point instead of at click.
     mouse-yank-at-point t
     
     ;; no bell
     ring-bell-function 'ignore)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

 
