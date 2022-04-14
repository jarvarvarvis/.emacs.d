;;; pkgs-vc.el -- Configuration of packages related to VC (version control) -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package magit
	:ensure t
	:config
	(global-set-key (kbd "C-c d") 'magit-status)
	(global-set-key (kbd "C-c g") 'magit-dispatch)
	(global-set-key (kbd "C-c M-g") 'magit-file-dispatch)

	;;; Refresh Treemacs after a commit to show changed files.
	(require 'treemacs)
	(add-hook 'git-commit-post-finish-hook (lambda ()
						  (treemacs-refresh))))


(provide 'pkgs-vc)
;;; pkgs-vc.el ends here
