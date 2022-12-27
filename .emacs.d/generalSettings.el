;;Adds theme path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;Loads theme
(load-theme 'dracula t)

;;Adds global absolute line number
(global-display-line-numbers-mode t)
;;Modes where no line numbers are used
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))
;;Removes bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
;;Sets font
(set-face-attribute 'default nil
		    :family "JetBrains mono"
		    :height 140
		    :weight 'normal
		    :width 'normal)

;;Dashboard Settings
;;Starts dashboard with client too
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
;;Centers content
(setq dashboard-center-content t)
;;Navigator
(setq dashboard-set-navigator t)
