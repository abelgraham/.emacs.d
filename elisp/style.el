;; Disabling menubar and scrollbar
(menu-bar-mode -1)
(menu-bar-showhide-tool-bar-menu-customize-disable)
(scroll-bar-mode -1)
;; Theme and modeline
(load-theme 'base16-onedark t)
(doom-modeline-mode)
;; Enable transparency
(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))
;; Fix frame resizing
(setq frame-resize-pixelwise t)
;; Dashboard config
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "Green Is My Pepper")
(setq dashboard-startup-banner "~/.emacs.d/images/dashboard_logo.png")
;; Friendly modeline companion
(parrot-mode)
;; Line numbers
(add-hook 'find-file-hook 'display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
