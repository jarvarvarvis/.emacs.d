;;; pkgs-theme.el -- Configuration of packages related to themes -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package doom-themes
	:ensure t
	:config
	;; Enable bold and italic styles for doom-themes themes
	(setq doom-themes-enable-bold t
		doom-themes-enable-italic t)

	;; Load the theme (doom-tomorrow-night)
	;; Keep in mind that each theme might have their own settings.
	;; Possible alternatives:
	;; - doom-horizon
	;; - doom-material
	;; - doom-spacegrey
	;; - doom-tomorrow-night
	(load-theme 'doom-tomorrow-night t)

	;; Corrects (and improves) org-mode's native fontification
	(doom-themes-org-config))

(use-package all-the-icons
	:ensure t)

(provide 'pkgs-theme)
;;; pkgs-theme.el ends here
