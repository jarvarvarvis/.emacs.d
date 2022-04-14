;;; character-pairs.el -- Configuration related to character pairs -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Enable show-paren-mode (Matching pairs, e.g. parens are highlighted when point is over them)
(show-paren-mode t)

;; Enable show-paren-when-point-inside-paren -> if the point is next to a paren, also show the pair
(require 'paren)
(setq show-paren-when-point-inside-paren t)

;; Enable electric-pair-mode (autocompletion of character pairs)
(electric-pair-mode t)

;; Add some more electric pairs:
(require 'elec-pair)

;; Rust
(defvar rust-electric-pairs
	'((124 . 124)) ;; |
	)
(defun rust-add-electric-pairs ()
	"Add rust-electric-pairs to the electric-pair-pairs list."
	(setq electric-pair-pairs (append electric-pair-pairs rust-electric-pairs)))

;; Hooks
(add-hook 'rust-mode-hook #'rust-add-electric-pairs)

(provide 'character-pairs)
;;; character-pairs.el ends here
