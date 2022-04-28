;;; visual-line.el -- Configuration of the visual-line-mode -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Define some modes in which visual line mode should not be enabled
(defcustom visual-line-mode-exempt-modes
	'(ibuffer-mode treemacs-mode dashboard-mode package-menu-mode)
	"Major modes in which to disable `visual-line-mode'."
	:group 'visual-line
	:type 'list
	:version "green"
	)

(defun turn-on-visual-line-mode ()
	"Turn on visual line mode in all modes except for certain major modes.  Exempt major modes are defined in `visual-line-mode-exempt-modes'."
	(unless (or (minibufferp) (member major-mode visual-line-mode-exempt-modes))
		(visual-line-mode 1)))

;; Enable global visual line mode
;; Instead of wrapping text on a per-character basis, Emacs now tries to wrap on a per-word basis.
;; If this is not possible, it will fall back to the per-character wrapping
(global-visual-line-mode)

(provide 'visual-line)
;;; visual-line.el ends here
