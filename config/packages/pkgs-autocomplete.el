;;; pkgs-autocomplete.el -- Configuration of packages related to autocompletion -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package company
	:ensure t
	:config
	(setq company-idle-delay 0.0
		company-minimum-prefix-length 1)

	;; Enable global company mode after initialization
	(add-hook 'after-init-hook #'global-company-mode))

(use-package company-box
	:ensure t
	:init
	(add-hook 'company-mode #'company-box-mode))

(use-package helm
	:ensure t
	:config
	;; Enable helm-mode (nicer menus)
	(helm-mode)

	;; Redefine some keybinds to the use the helm versions of
	;; some functions / utilities instead.
	(define-key global-map [remap find-file] 'helm-find-files)
	(define-key global-map [remap execute-extended-command] 'helm-M-x)
	(define-key global-map [remap switch-to-buffer] 'helm-mini))

(provide 'pkgs-autocomplete)
;;; pkgs-autocomplete.el ends here
