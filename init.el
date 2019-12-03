(add-to-list 'load-path "~/.emacs.d/lisp/")
(package-initialize)
(require 'package)
(require 'workgroups)
;; Loading workgroup config
(workgroups-mode 1)
(wg-load "~/.emacs.d/workgroups")
;; Disabling menubar and scrollbar
(menu-bar-mode -1)
(menu-bar-showhide-tool-bar-menu-customize-disable)
(scroll-bar-mode -1)
;; Package manager
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2277b74ae6f5aa018aa0057ef89752163e34fcb09ab6242f169c1740a72ca27a" "fa2af0c40576f3bde32290d7f4e7aa865eb6bf7ebe31eb9e37c32aa6f4ae8d10" "85d1dbf2fc0e5d30f236712b831fb24faf6052f3114964fdeadede8e1b329832" "3e83abe75cebf5621e34ce1cbe6e12e4d80766bed0755033febed5794d0c69bf" "10461a3c8ca61c52dfbbdedd974319b7f7fd720b091996481c8fb1dded6c6116" "80365dd15f97396bdc38490390c23337063c8965c4556b8f50937e63b5e9a65c" "6778eecfa231e177f2d4c0a72f4792ceffdfb96bf1bdfd73dcb210a4a619d13f" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "ec5f697561eaf87b1d3b087dd28e61a2fc9860e4c862ea8e6b0b77bd4967d0ba" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "0bff60fb779498e69ea705825a2ca1a5497a4fccef93bf3275705c2d27528f2f" "8dc7f4a05c53572d03f161d82158728618fb306636ddeec4cce204578432a06d" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" default)))
 '(package-selected-packages
   (quote
    (evil-escape evil haskell-mode jinja2-mode cider rust-mode chocolate-theme doom-modeline markdown-mode slime all-the-icons parrot rainbow-delimiters emojify yaml-mode wc-mode python-mode htmlize org-plus-contrib dired-filter dired-icon dired-launch dashboard brief org)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Evil mode
(evil-mode 1)
(setq evil-default-state 'emacs)
(evil-escape-mode)
(global-set-key (kbd "M-s") 'evil-escape)
;; Theme and modeline
(load-theme 'chocolate t)
(doom-modeline-mode)
;; Enable transparency
(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))
;; Custom functions
(defun sudo-edit (&optional arg)
  "Edit a file as root"
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
(defun zsh (buffer-name)
  "Start a terminal and rename buffer."
  (interactive "sbuffer name: ")
  (term "/bin/zsh")
  (rename-buffer buffer-name t))
(defun eshell-mode-hook-func ()
  (setq eshell-path-env (concat "/usr/local/bin:" eshell-path-env))
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (define-key eshell-mode-map (kbd "M-s") 'other-window-or-split))
;; Config shortcuts
(global-set-key (kbd "H-i") (lambda() (interactive)(find-file "~/.emacs.d/init.el")))
;; Command shortcuts
(global-set-key (kbd "H-s") 'save-buffer)
(global-set-key (kbd "H-z") 'zsh)
(global-set-key (kbd "H-h") 'eshell)
(global-set-key (kbd "H-j")
		(lambda ()
		  (interactive)
		  (if (string-equal (message "%s" major-mode) "eshell-mode")
		      (funcall 'eshell/clear))
		  (if (string-equal (message "%s" major-mode) "slime-repl-mode")
		      (funcall 'slime-repl-clear-buffer))
		  (if (string-equal (message "%s" major-mode) "cider-mode")
		      (funcall 'cider-repl-clear-buffer))))
(global-set-key (kbd "H-k") 'kill-buffer)
(global-set-key (kbd "H-x") 'kill-region)
(global-set-key (kbd "H-c") 'kill-ring-save)
(global-set-key (kbd "H-v") 'yank)
(global-set-key (kbd "H-e") 'sudo-edit)
(global-set-key (kbd "H-q") 'split-window-horizontally)
(global-set-key (kbd "H-w") 'split-window-vertically)
(global-set-key (kbd "H-a") 'balance-windows)
(global-set-key (kbd "H-b") 'buffer-menu)
(global-set-key (kbd "H-=") 'text-scale-increase)
(global-set-key (kbd "H--") 'text-scale-decrease)
(global-set-key (kbd "H-o") 'other-window)
(global-set-key (kbd "H-p") 'previous-multiframe-window)
(global-set-key (kbd "H-f") 'maximize-window)
;; Dashboard config
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "*internal screaming*")
(setq dashboard-startup-banner "~/.emacs.d/images/dashboard_logo.png")
;; Org config
(setq org-log-done t)
(setq org-startup-truncated nil)
;; Fix frame resizing
(setq frame-resize-pixelwise t)
;; Hooks
;; You can write better code than this you goof
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'common-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode 'rainbow-delimiters-mode)
(add-hook 'eshell-mode-hook 'rainbow-delimiters-mode)
(add-hook 'eshell-mode-hook 'eshell-mode-hook-func)
(add-hook 'org-mode-hook #'toggle-word-wrap)
(add-hook 'nov-mode-hook 'visual-line-mode)
(add-hook 'nov-mode-hook 'visual-fill-column-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;; File associations
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
;; Friendly modeline companion
(parrot-mode)
;; SLIME config
(setq inferior-lisp-program "/bin/sbcl")
(setq slime-contribs '(slime-fancy))
;; Novel config
(setq nov-text-width t)
;; Auto-mode
(add-to-list 'auto-mode-alist '("\\.j2\\'" . jinja2-mode))
;; Set Python shell interpreter
(setq python-shell-interpreter "/usr/bin/python")
