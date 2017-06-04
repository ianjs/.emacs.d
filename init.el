;; init.el

;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to "load" them.
;;
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "~/bin")

;; Add a directory to our load path so that we can `load` them
(add-to-list 'load-path "~/.emacs.d/customizations")

;; Load all packages in one place
(load "mypackages.el")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
(load "shell-integration.el")

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; Hard-to-categorize customizations
(load "misc.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")

(load "org-mode.el")

;;;;;;;;; IJS Specific ;;;;;;;;;;;;;;

;; Separate stuff that is for graphics mode only

(if (display-graphic-p)
    (load "guistuff.el"))


;; Set remote user to root by default
(setq tramp-default-user "root")

;; Highlight whole expression on paren match, not just other bracket
(setq show-paren-style 'expression)

(setq cider-repl-use-pretty-printing t)

;; Nicer font on OSX
(set-face-attribute 'default nil :family "Source Code Pro" :weight 'Light  :height 160)

;; completion help 
(which-key-mode)

;; M-Left, M-right = Move region. M-up, M-down = Move line(s)
;; Nah, screws with org mode
;;(drag-stuff-global-mode nil)

;;; Org mode customisation
;; Nice bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-return-follows-link 1)

;; Sane mouse scroll wheel
(setq mouse-wheel-scroll-amount '(3))
(setq mouse-wheel-progressive-speed nil)

(setq-default cursor-type 'box)

;; Nice Completion mode
(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(global-company-mode)

;; Wavering on auto save. Might trash a conf file if done on command line.
;; Even GUI mode migt kill a remote file when using Tramp.
;;(setq auto-save-visited-file-name nil)
;;(setq auto-save-timeout 5)

;; Mmmmmm hoopy symbols like λ
(global-prettify-symbols-mode +1)
