;;; pkgs-ui.el -- Configuration of packages related to UI -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package treemacs
	:ensure t
	:config
	;; Configure treemacs for use with doom-themes
	
	;; Turn off file dialogs
	(setq use-dialog-box nil)

	(doom-themes-treemacs-config)

	;; Enable treemacs
	(treemacs))

(use-package doom-modeline
	:ensure t
	:config
	;; Enable the doom-modeline
	(doom-modeline-mode t))

(use-package dashboard
	:ensure t
	:init
	(add-hook 'after-init-hook 'dashboard-refresh-buffer)
	:config
	;; Dashboard items
	(setq dashboard-items '((recents . 5)
			        (projects . 5)))

	;; Change the banner logo title
	(setq dashboard-banner-logo-title "Welcome to Emacs")

	;; Nicer banner
	(setq dashboard-startup-banner 'logo)

	;; Center the dashboard contents
	(setq dashboard-center-content t)

	;; Icons
	(setq dashboard-set-heading-icons t)
	(setq dashboard-set-file-icons t)

	;; Add the dashboard startup hook
	(dashboard-setup-startup-hook)

	;; Add a custom startup hook that just deletes
	;; all others windows after the dashboard was intialized.
	(add-hook 'emacs-startup-hook (lambda ()
					      (delete-other-windows))))

(use-package beacon
	:ensure t
	:config
	(beacon-mode t))

(provide 'pkgs-ui)
;;; pkgs-ui.el ends here
