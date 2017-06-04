;;;;
;; Packages
;;;;
;; Added by Package.el. This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Define package repositories
(require 'package)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("tromey" . "http://tromey.com/elpa/") t)
 
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

;; latest org mode
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ("melpa" . "http://melpa-stable.milkbox.net/packages/")))


;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; Install basic packages but install the rest with use-package
(dolist (p '(use-package))
  (when (not (package-installed-p p))
    (package-install p)))

(setq use-package-always-ensure t)

;; The packages you want installed. You can also install these
;; manually with M-x package-install
;; Add in your own as you wish:


;; makes handling lisp expressions much, much easier
;; Cheatsheet: http://www.emacswiki.org/emacs/PareditCheatsheet
(use-package paredit)

;; key bindings and code colorization for Clojure
;; https://github.com/clojure-emacs/clojure-mode
(use-package clojure-mode)

;; extra syntax highlighting for clojure
(use-package clojure-mode-extra-font-locking)

;; integration with a Clojure REPL
;; https://github.com/clojure-emacs/cider
(use-package cider)

;; allow ido usage in as many contexts as possible. see
;; customizations/navigation.el line 23 for a description
;; of ido
; Replaced by helm
;; (use-package ido-ubiquitous)

;; Enhances M-x to allow easier execution of commands. Provides
;; a filterable list of possible commands in the minibuffer
;; http://www.emacswiki.org/emacs/Smex
;; Switched to helm
;; (use-package smex)

(use-package projectile 
  :init
    (projectile-global-mode))

;; colorful parenthesis matching
(use-package rainbow-delimiters)

;; edit html tags like sexps
(use-package tagedit)

;; git integration
;;magit

;;aggressive-indent

(use-package which-key)

(use-package company)

(use-package puppet-mode)

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (use-package exec-path-from-shell))

(use-package parinfer
  :ensure t
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
             pretty-parens  ; different paren styles for different modes.
             paredit        ; Introduce some paredit commands.
             smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
             smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode)))

(use-package visual-regexp-steroids
  :ensure
  :demand
  :bind (("C-M-r" . vr/isearch-backward)
         ("C-M-s" . vr/isearch-forward)
         ("M-%" . vr/query-replace)))

(use-package yaml-mode
  :mode ("\\.\\(e?ya?\\|ra\\)ml\\'" . yaml-mode))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :config (setq markdown-command "multimarkdown"))


(use-package helm
  :bind (("M-x" . helm-M-x)
         ("M-<f5>" . helm-find-files)
         ("C-x C-b" . helm-buffers-list)
         ([S-f10] . helm-recentf)
         ("C-x C-f" . helm-find-files))

  :init
     (progn
       (setq helm-buffers-fuzzy-matching t 
             helm-buffer-max-length nil)))
       

(use-package helm-swoop)

(use-package helm-projectile
  :bind (("C-x C-b" . helm-projectile-switch-to-buffer))
  :init
    (helm-projectile-on))

(use-package yasnippet
  :config
    (yas-reload-all)
    (add-hook 'prog-mode-hook #'yas-minor-mode))

;; view only files in a project
;; hmmm seems to be broken
;; (use-package perspective
;;   :init 
;;     (persp-mode))

;;(use-package persp-projectile)

