;;; pkgs-lsp.el -- Configuration of packages related to LSP (the language server protocol) -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package lsp-mode
	:ensure t
	:init
	(setq lsp-keymap-prefix "C-c l")

	:hook
	(c-mode . lsp)
	(c++-mode . lsp)
	(rust-mode . lsp)
	;; (python-mode . lsp)
	(cmake-mode . lsp)
	(lsp-mode . lsp-enable-which-key-integration)

	:config
	;; Rebind the lsp-mode keymap prefix to C-c l
	(define-key lsp-mode-map (kbd "C-c l") lsp-command-map)

	;; Variables
	(setq lsp-idle-delay 0.1)

	:commands lsp)

(use-package lsp-ui
	:ensure t
	:commands lsp-ui-mode)

(use-package lsp-treemacs
	:ensure t
	:commands lsp-treemacs-errors-list)

(use-package helm-lsp
	:ensure t
	:commands helm-lsp-workspace-symbol)

(provide 'pkgs-lsp)
;;; pkgs-lsp.el ends here
