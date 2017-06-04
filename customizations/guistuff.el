
;; Only do this in graphics mode - random command line edits don't need it.
;; Keeps asking to save, clashes with main invocation of emacs
(desktop-save-mode 1)

;; Don't need toolbar
(tool-bar-mode -1)
(set-face-attribute 'default nil :height 140)

;; Nicer cursor
(setq-default cursor-type 'bar)
(setq default-frame-alist
      '((cursor-color . "white")))

;; Copy on select
(setq mouse-drag-copy-region t)

;; highlight line is reasonably subtle in gui
(global-hl-line-mode t)

;; Neo tree
(use-package neotree)
(global-set-key [f8] 'neotree-toggle)
;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow)) ;; fonts broken
(setq neo-theme 'arrow)
(setq neo-window-fixed-size nil)
