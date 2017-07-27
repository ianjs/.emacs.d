;;; Org mode customisation

;; Nice bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-return-follows-link 1)

(setq org-hide-leading-stars t)
(setq org-startup-indented t)

;; Don't let M-Ret split lines - why would you?
(setq org-M-RET-may-split-line '((item . nil)))

;; allow helm to rifle through org buffers
(use-package helm-org-rifle)
