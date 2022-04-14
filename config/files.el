;;; files.el -- Configuration of file paths etc. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;; Backup files

;; Create backup / auto save files in /tmp/ instead of the current directory
(setq backup-directory-alist
	`((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
	`((".*" ,temporary-file-directory t)))


;;; Change location of the custom file and load it at startup
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

;;; When terminating emacs, prompt the user about unsaved customisations
(add-hook 'kill-emacs-query-functions
        'custom-prompt-customize-unsaved-options)

(provide 'files)
;;; files.el ends here
