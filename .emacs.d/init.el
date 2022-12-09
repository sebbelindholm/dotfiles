;;Loads in other config files
;;Loads general settings config
(load "~/.emacs.d/generalSettings.el")
;;Loads package config
(load "~/.emacs.d/packages.el")
;;Load alias config
(load "~/.emacs.d/aliases.el")
;;Load keybindings config
(load "~/.emacs.d/keybindings.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dashboard doom-themes all-the-icons all\.the-icons doom-modeline swiper ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
