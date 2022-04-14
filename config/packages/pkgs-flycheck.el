;;; pkgs-flycheck.el -- Configuration of packages related to flycheck -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package flycheck
	:ensure t)

(use-package flycheck-rust
	:ensure t)

;; Enable flycheck after initialization
(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'pkgs-flycheck)
;;; pkgs-flycheck.el ends here
