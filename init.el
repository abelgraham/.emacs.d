(menu-bar-mode -1) 
(menu-bar-showhide-tool-bar-menu-customize-disable)
(scroll-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'package)
(require 'workgroups)

(workgroups-mode 1)
(wg-load "~/.emacs.d/workgroups")

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
    ("6778eecfa231e177f2d4c0a72f4792ceffdfb96bf1bdfd73dcb210a4a619d13f" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "ec5f697561eaf87b1d3b087dd28e61a2fc9860e4c862ea8e6b0b77bd4967d0ba" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "0bff60fb779498e69ea705825a2ca1a5497a4fccef93bf3275705c2d27528f2f" "8dc7f4a05c53572d03f161d82158728618fb306636ddeec4cce204578432a06d" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" default)))
 '(package-selected-packages
   (quote
    (all-the-icons doom-modeline parrot org-brain nyan-mode cider rainbow-delimiters emojify yaml-mode wc-mode python-mode htmlize org-plus-contrib dired-filter dired-icon dired-launch dashboard doom-themes brief org)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'doom-dracula t)
(doom-modeline-mode)


(defun zsh (buffer-name)
  "Start a terminal and rename buffer."
  (interactive "sbuffer name: ")
  (term "/bin/zsh")
  (rename-buffer buffer-name t))

(defun sudo-edit (&optional arg)
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; File shortcuts
(global-set-key (kbd "H-n") (lambda() (interactive)(find-file "~/notebook/")))
(global-set-key (kbd "H-r") (lambda() (interactive)(find-file "~/repos/")))
(global-set-key (kbd "H-i") (lambda() (interactive)(find-file "~/.emacs.d/init.el")))
;; Command shortcuts
(global-set-key (kbd "H-s") 'save-buffer)
(global-set-key (kbd "H-z") 'zsh)
(global-set-key (kbd "H-k") 'kill-buffer)
(global-set-key (kbd "H-x") 'kill-region)
(global-set-key (kbd "H-c") 'kill-ring-save)
(global-set-key (kbd "H-v") 'yank)
(global-set-key (kbd "H-e") 'sudo-edit)
(global-set-key (kbd "H-q") 'split-window-horizontally)
(global-set-key (kbd "H-w") 'split-window-vertically)
(global-set-key (kbd "H-b") 'buffer-menu)
(global-set-key (kbd "H-=") 'text-scale-increase)
(global-set-key (kbd "H--") 'text-scale-decrease)
(global-set-key (kbd "H-1") 'cider-jack-in)
(global-set-key (kbd "H-2") 'cider-jack-in-cljs)

(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "I GNU you'd come back")
(setq dashboard-startup-banner "~/.emacs.d/images/dashboard_logo.png")

(setq org-log-done t)

(add-hook 'org-mode-hook #'toggle-word-wrap)
(setq org-startup-truncated nil)

(setq frame-resize-pixelwise t)

(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(nyan-mode)
(parrot-mode)
