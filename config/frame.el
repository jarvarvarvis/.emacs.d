;;; frame.el -- Configuration of the Emacs frame -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;; Window options

;; Disable the Menu Bar
(menu-bar-mode -1)

;; Disable scrollbars
(toggle-scroll-bar -1)

;; Disable the toolbar
(tool-bar-mode -1)

;; Try to flash the frame to represent a bell
(setq visible-bell 1)

;;; Transparency

;; Set transparency of the frame to 90% (active and inactive)
(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(add-to-list 'default-frame-alist '(alpha . (95 . 95)))

;;; Fonts

;; Set default font to Droid Sans Mono with size 12
;; (defvar custom-font-face "Droid Sans Mono-12")


(provide 'frame)
;;; frame.el ends here
