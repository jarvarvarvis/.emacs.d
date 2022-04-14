;;; init.el --- Emacs initialization file, used for config -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;; Add the utils directory to the load path
(add-to-list 'load-path "~/.emacs.d/utils")

;;; Load configuration files
(require 'load-directory)
(load-directory "~/.emacs.d/config")

(provide 'init)
;;; init.el ends here
