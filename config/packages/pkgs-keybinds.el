;;; pkgs-keybinds.el -- Configuration of packages related to keybinds -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package hydra
	:ensure t
	:config
	;; Some keybinds for controlling Emacs windows:
	;; - creating new windows
	;; - resizing windows
	;; - killing a window and associated buffer
	;; - using ace-window (switching between, deleting and swapping windows)
	(require 'hydra)
	(defhydra hydra-window-control (global-map "C-c w")
		"window control"
		("<left>" shrink-window-horizontally)
		("<right>" enlarge-window-horizontally)
		("<down>" shrink-window)
		("<up>" enlarge-window)
		("+" balance-windows)
		("j" ace-window)                ;; Jump
		("d" ace-delete-window)         ;; Delete a window (the buffer is kept)
		("k" kill-buffer-and-window)    ;; Kill the current buffer and window
		("s" ace-swap-window)           ;; Swap windows
		("v" split-window-vertically)   ;; Vertical window split
		("h" split-window-horizontally) ;; Horizontal window split
		("t" treemacs)                  ;; toggle Treemacs
		)
	)

(use-package which-key
	:ensure t
	:config
	(which-key-mode))

(use-package god-mode
	:ensure t
	:config
	(god-mode)
	(global-set-key (kbd "C-S-i") 'god-mode))

(provide 'pkgs-keybinds)
;;; pkgs-keybinds.el ends here
