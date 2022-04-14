;;; pkgs-code.el -- Configuration of packages related to code (programming languages) -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package rust-mode
	:ensure t)

(use-package haskell-mode
	:ensure t
	:hook
	(haskell-mode . interactive-haskell-mode)
	(haskell-mode . haskell-doc-mode))

(use-package php-mode
	:ensure t)

(use-package glsl-mode
	:ensure t)

(use-package cmake-mode
	:ensure t)

(use-package editorconfig
	:ensure t
	:config
	;; Enable editorconfig-mode (EditorConfig homepage: https://editorconfig.org/)
	(editorconfig-mode t))

(use-package smart-tab
	:ensure t
	:config
	(global-smart-tab-mode t))

(provide 'pkgs-code)
;;; pkgs-code.el ends here
