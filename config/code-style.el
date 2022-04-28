;;; code-style.el -- Configuration related to code style -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'cc-vars)
(setq c-default-style "linux"
        c-basic-offset 8)

(c-set-offset 'substatement-open 0)

(provide 'code-style)
;;; code-style.el ends here
