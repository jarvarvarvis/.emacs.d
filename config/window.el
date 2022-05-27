;;; window.el -- Configuration of window related features -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Rebind C-x C-b to open ibuffer instead of buffer-list
;; Use this for managing (closing etc.) buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'window)
;;; window.el ends here
