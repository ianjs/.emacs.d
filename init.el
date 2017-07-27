;; init.el

;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to "load" them.
;;
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "~/bin")

;; Add a directory to our load path so that we can `load` them
(add-to-list 'load-path "~/.emacs.d/customizations")

;;;;;;;;;;;;;;;;; Load all packages in one place
(load "mypackages.el")

;; Sets up exec-path-from-shell so that Emacs will use the correct
;; environment variables
;; Sets up exec-path-from shell
;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))

;; These customizations make it easier for you to navigate files,
;; switch buffers, and choose options from the minibuffer.
(load "navigation.el")

;; These customizations change the way emacs looks and disable/enable
;; some user interface elements
(load "ui.el")

;; These customizations make editing a bit nicer.
(load "editing.el")

;; For editing lisps
(load "elisp-editing.el")

;; Langauage-specific
(load "setup-clojure.el")
(load "setup-js.el")
(load "org-mode.el")

(if (display-graphic-p)
    (load "guistuff.el"))

;;;;;;;;; IJS Specific ;;;;;;;;;;;;;;

;; Separate stuff that is for graphics mode only


;; Set remote user to root by default
(setq tramp-default-user "root")

;; Highlight whole expression on paren match, not just other bracket
(setq show-paren-style 'expression)

(setq cider-repl-use-pretty-printing t)

;; Nicer font on OSX
(set-face-attribute 'default nil :family "Source Code Pro" :weight 'Light  :height 160)

;; completion help 
(which-key-mode)

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
