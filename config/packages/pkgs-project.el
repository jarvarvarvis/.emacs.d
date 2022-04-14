;;; pkgs-project.el -- Configuration of packages related to projects, project navigation etc. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package projectile
	:ensure t
	:config
	(projectile-mode)
	(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package helm-xref
	:ensure t)

(provide 'pkgs-project)
;;; pkgs-project.el ends here
