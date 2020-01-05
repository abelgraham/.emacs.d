(require 'package)

(setq evil-toggle-key "C-x C-z")

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
    ("6145e62774a589c074a31a05dfa5efdf8789cf869104e905956f0cbd7eda9d0e" "840db7f67ce92c39deb38f38fbc5a990b8f89b0f47b77b96d98e4bf400ee590a" "a62f0662e6aa7b05d0b4493a8e245ab31492765561b08192df61c9d1c7e1ddee" "8cf1002c7f805360115700144c0031b9cfa4d03edc6a0f38718cef7b7cabe382" "12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "8c1dd3d6fdfb2bee6b8f05d13d167f200befe1712d0abfdc47bb6d3b706c3434" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "68fb87a1805393d7a00ba5064d28b8277de5a75addf0d34094012408cfcf2eea" "59ba50f24540958f33699a5247255d10f34dd812f3975837e3eddccdc4caa32e" "ed36f8e30f02520ec09be9d74fe2a49f99ce85a3dfdb3a182ccd5f182909f3ab" "50b64810ed1c36dfb72d74a61ae08e5869edc554102f20e078b21f84209c08d1" "5b8eccff13d79fc9b26c544ee20e1b0c499587d6c4bfc38cabe34beaf2c2fc77" "cbd8e65d2452dfaed789f79c92d230aa8bdf413601b261dbb1291fb88605110c" "cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "a85e40c7d2df4a5e993742929dfd903899b66a667547f740872797198778d7b5" "3de3f36a398d2c8a4796360bfce1fa515292e9f76b655bb9a377289a6a80a132" "7a2ac0611ded83cdd60fc4de55ba57d36600eae261f55a551b380606345ee922" "73ad471d5ae9355a7fa28675014ae45a0589c14492f52c32a4e9b393fcc333fd" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "7bef2d39bac784626f1635bd83693fae091f04ccac6b362e0405abf16a32230c" "8be07a2c1b3a7300860c7a65c0ad148be6d127671be04d3d2120f1ac541ac103" "1025e775a6d93981454680ddef169b6c51cc14cea8cb02d1872f9d3ce7a1da66" "808b47c5c5583b5e439d8532da736b5e6b0552f6e89f8dafaab5631aace601dd" "2277b74ae6f5aa018aa0057ef89752163e34fcb09ab6242f169c1740a72ca27a" "fa2af0c40576f3bde32290d7f4e7aa865eb6bf7ebe31eb9e37c32aa6f4ae8d10" "85d1dbf2fc0e5d30f236712b831fb24faf6052f3114964fdeadede8e1b329832" "3e83abe75cebf5621e34ce1cbe6e12e4d80766bed0755033febed5794d0c69bf" "10461a3c8ca61c52dfbbdedd974319b7f7fd720b091996481c8fb1dded6c6116" "80365dd15f97396bdc38490390c23337063c8965c4556b8f50937e63b5e9a65c" "6778eecfa231e177f2d4c0a72f4792ceffdfb96bf1bdfd73dcb210a4a619d13f" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "ec5f697561eaf87b1d3b087dd28e61a2fc9860e4c862ea8e6b0b77bd4967d0ba" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "0bff60fb779498e69ea705825a2ca1a5497a4fccef93bf3275705c2d27528f2f" "8dc7f4a05c53572d03f161d82158728618fb306636ddeec4cce204578432a06d" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" default)))
 '(package-selected-packages
   (quote
    (cider base16-theme go-mode weechat doom-modeline evil-escape evil jinja2-mode rust-mode markdown-mode slime all-the-icons parrot rainbow-delimiters emojify yaml-mode wc-mode python-mode htmlize org-plus-contrib dired-filter dired-icon dired-launch dashboard brief org)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/elisp/")
(load-library "functions")
(load-library "style")
(load-library "keys")
(load-library "modes")

