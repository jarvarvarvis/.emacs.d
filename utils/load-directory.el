;;; load-directory.el --- Load all Emacs Lisp files in a directory -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defun load-directory (dir)
	"Load all Emacs Lisp files from the directory DIR."
	(let ((load-it (lambda (f)
			       (load-file (concat (file-name-as-directory dir) f)))
		      ))
		(mapc load-it (directory-files dir nil "\\.el$"))))

(provide 'load-directory)
;;; load-directory.el ends here
