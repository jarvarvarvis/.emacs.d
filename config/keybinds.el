;;; keybinds.el -- Configuration of keybinds -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Rebind C-x C-b to open ibuffer instead of buffer-list
;; Use this for managing (closing etc.) buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Bind C-S-k to kill-whole-line (C-k kills a line starting from the point)
(global-set-key (kbd "C-S-k") 'kill-whole-line)

;; Enable narrow-to-region (bound to C-x n n)
(put 'narrow-to-region 'disabled nil)

(provide 'keybinds)
;;; keybinds.el ends here
