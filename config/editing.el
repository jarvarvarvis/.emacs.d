;;; editing.el -- Configuration of editing features -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Bind C-S-k to kill-whole-line (C-k kills a line starting from the point)
(global-set-key (kbd "C-S-k") 'kill-whole-line)

;; Rebind C-x C-b to open ibuffer instead of buffer-list
;; Use this for managing (closing etc.) buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Enable narrow-to-region (bound to C-x n n)
(put 'narrow-to-region 'disabled nil)

(provide 'editing)
;;; editing.el ends here
