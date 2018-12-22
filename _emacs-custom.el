(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#000000"))
 '(auto-revert-remote-files t)
 '(coffee-tab-width 2)
 '(company-backends
   (quote
    (company-bbdb company-nxml company-css company-semantic company-clang company-xcode company-cmake company-capf
                  (company-dabbrev-code company-keywords)
                  company-oddmuse company-dabbrev)))
 '(custom-safe-themes
   (quote
    ("52588047a0fe3727e3cd8a90e76d7f078c9bd62c0b246324e557dfa5112e0d0c" "cf08ae4c26cacce2eebff39d129ea0a21c9d7bf70ea9b945588c1c66392578d1" "1157a4055504672be1df1232bed784ba575c60ab44d8e6c7b3800ae76b42f8bd" "9e54a6ac0051987b4296e9276eecc5dfb67fdcd620191ee553f40a9b6d943e78" "5ee12d8250b0952deefc88814cf0672327d7ee70b16344372db9460e9a0e3ffc" default)))
 '(fci-rule-color "#2a2a2a")
 '(global-rainbow-delimiters-mode t)
 '(org-contacts-address-property "CITY" t)
 '(org-contacts-birthday-property "BORN" t)
 '(org-contacts-files "~/share/all/org-mode/contacts.org" t)
 '(org-contacts-icon-property "PHOTOGRAPH" t)
 '(package-selected-packages
   (quote
    (highlight-indent-guides editorconfig git-gutter-fringe git-gutter arduino-mode highlight-symbol web-mode beacon hlinum kibit-helper spaceline spacemacs-theme real-auto-save esup clj-refactor smartparens-config smartparens aggressive-indent yasnippet projectile org-bullets helm-org-rifle auto-yasnippet clojure-snippets persp-projectile perspective helm-projectile paredit parinfer exec-path-from-shell clojure-mode helm-ack helm-swoop ivy helm markdown-mode flycheck smart-shift visual-regexp-steroids yaml-mode font-lock+-0 all-the-icons neotree puppet-mod puppet-mode org-autolist foo use-package which-key-mode org aa-edit-mode org-ac 0blayout which-key tagedit swiper smex rainbow-delimiters magit iedit hydra company clojure-mode-extra-font-locking cider ace-window)))
 '(safe-local-variable-values
   (quote
    ((eval ispell-change-dictionary "en_US")
     (TeX-master . "misc")
     (TeX-master . "references")
     (eval org-expiry-deinsinuate))))
 '(send-mail-function nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-ff-directory ((t (:underline t :slant italic :weight bold))))
 '(org-document-title ((t (:inherit default :font "Lucida Grande" :height 1.5 :underline nil))))
 '(org-done ((t (:foreground "PaleGreen" :weight normal :strike-through t))))
 '(org-headline-done ((((class color) (min-colors 16) (background dark)) (:foreground "LightSalmon" :strike-through t))))
 '(org-level-1 ((t (:inherit default :font "Lucida Grande" :height 1.2))))
 '(org-level-2 ((t (:inherit default :font "Lucida Grande" :height 1.2))))
 '(org-level-3 ((t (:inherit default :font "Lucida Grande" :height 1.1))))
 '(org-level-4 ((t (:inherit default :font "Lucida Grande" :height 1.05))))
 '(org-level-5 ((t (:inherit default :font "Lucida Grande"))))
 '(org-level-6 ((t (:foreground "#7fafaf"))))
 '(org-level-7 ((t (:foreground "dark gray"))))
 '(org-level-8 ((t (:foreground "#cc9073")))))
