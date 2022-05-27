;;; editing.el -- Configuration of editing features -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Bind C-S-k to kill-whole-line (C-k kills a line starting from the point)
(global-set-key (kbd "C-S-k") 'kill-whole-line)

;; Enable narrow-to-region (bound to C-x n n)
(put 'narrow-to-region 'disabled nil)

(provide 'editing)
;;; editing.el ends here
