;;; line-numbers.el -- Configuration of line numbers -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Enable line numbers in all modes, except:
;; - shell-mode
;; - term-mode
;; - ansi-term-mode
;; - treemacs-mode
(require 'display-line-numbers)

;; Define some modes in which line numbers should not be displayed
(defcustom display-line-numbers-exempt-modes
	'(shell-mode
		 term-mode
		 ansi-term-mode
		 treemacs-mode)
	"Major modes in which to disable line numbers."
	:group 'display-line-numbers
	:type 'list
	:version "green"
	)

;; open display-line-numbers-mode unless any of the exempt mods is active
(defun display-line-numbers--turn-on ()
	"Turn on line numbers in all modes, except for certain major modes.  Exempt major modes are defined in `display-line-numbers-exempt-modes'."
	(unless (or (minibufferp)
			(member major-mode display-line-numbers-exempt-modes))
		(display-line-numbers-mode)))

;; Enable the modified mode display-line-numbers-mode globally
(global-display-line-numbers-mode)

(provide 'line-numbers)
;;; line-numbers.el ends here
