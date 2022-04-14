;;; packages.el --- Package configuration  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;;;; Package Setup ;;;;;

;; Disable automatic loading of packages after the init file
(setq package-enable-at-startup nil)

;; Load them explicitly instead
(package-initialize)

;; Refresh package descriptions
(unless package-archive-contents
	(package-refresh-contents))

;; Setup package repositories
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Install use-package for easier package configuration
(eval-and-compile
	(unless (package-installed-p 'use-package)
		(package-refresh-contents)
		(package-install 'use-package))
	(require 'use-package))

;; Load files that contain package configurations
(require 'load-directory)
(load-directory "~/.emacs.d/config/packages")

(provide 'packages)
;;; packages.el ends here
