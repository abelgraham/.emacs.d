;; Evil mode
(evil-mode 1)
(setq evil-default-state 'emacs)
(evil-escape-mode)
(global-set-key (kbd "C-z") 'evil-escape)
;; Org mode
(setq org-log-done t)
(setq org-startup-truncated nil)
;; Hooks
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'common-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'eshell-mode-hook 'rainbow-delimiters-mode)
(add-hook 'eshell-mode-hook 'eshell-mode-hook-func)
(add-hook 'org-mode-hook #'toggle-word-wrap)
(add-hook 'nov-mode-hook 'visual-line-mode)
(add-hook 'nov-mode-hook 'visual-fill-column-mode)
;; File associations
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
;; SLIME
(setq inferior-lisp-program "/bin/sbcl")
(setq slime-contribs '(slime-fancy))
;; Novel
(setq nov-text-width t)
;; Auto-mode
(add-to-list 'auto-mode-alist '("\\.j2\\'" . jinja2-mode))
;; Set Python shell interpreter
(setq python-shell-interpreter "/usr/bin/python")
