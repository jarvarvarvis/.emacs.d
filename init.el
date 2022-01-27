;;; init.el --- Emacs initialization file, used for config -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;;;; Packages ;;;;;

;;; Setup

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


;;; Package list + configuration

;; Themes
(use-package doom-themes
	:ensure t
	:config
	;; Enable bold and italic styles for doom-themes themes
	(setq doom-themes-enable-bold t
		doom-themes-enable-italic t)

	;; Load the theme (doom-tomorrow-night)
	;; Keep in mind that each theme might have their own settings.
	;; Possible alternatives:
	;; - doom-horizon
	;; - doom-material
	;; - doom-spacegrey
	;; - doom-tomorrow-night
	(load-theme 'doom-tomorrow-night t)

	;; Corrects (and improves) org-mode's native fontification
	(doom-themes-org-config))

(use-package all-the-icons
	:ensure t)

;; UI
(use-package treemacs
	:ensure t
	:config
	;; Configure treemacs for use with doom-themes
	(doom-themes-treemacs-config)

	;; Enable treemacs
	(treemacs))

(use-package doom-modeline
	:ensure t
	:config
	;; Enable the doom-modeline
	(doom-modeline-mode t))

(use-package dashboard
	:ensure t
	:init
	(add-hook 'after-init-hook 'dashboard-refresh-buffer)
	:config
	;; Dashboard items
	(setq dashboard-items '((recents . 5)
							   (projects . 5)))

	;; Change the banner logo title
	(setq dashboard-banner-logo-title "Welcome to Emacs")

	;; Nicer banner
	(setq dashboard-startup-banner 'logo)

	;; Center the dashboard contents
	(setq dashboard-center-content t)

	;; Icons
	(setq dashboard-set-heading-icons t)
	(setq dashboard-set-file-icons t)

	;; Add the dashboard startup hook
	(dashboard-setup-startup-hook)

	;; Add a custom startup hook that just delete
	;; all others windows after the dashboard was intialized.
	(add-hook 'emacs-startup-hook (lambda ()
									  (delete-other-windows))))

;; Autocompletion
(use-package company
	:ensure t
	:config
	(setq company-idle-delay 0.0
		company-minimum-prefix-length 1))

(use-package company-box
	:ensure t
	:init
	(add-hook 'company-mode #'company-box-mode))

(use-package helm
	:ensure t
	:config
	;; Enable helm-mode (nicer menus)
	(helm-mode)

	;; Redefine some keybinds to the use the helm versions of
	;; some functions / utilities instead.
	(define-key global-map [remap find-file] 'helm-find-files)
	(define-key global-map [remap execute-extended-command] 'helm-M-x)
	(define-key global-map [remap switch-to-buffer] 'helm-mini)
	)

;; Programming languages + editor integration
(use-package rust-mode
	:ensure t)

(use-package haskell-mode
	:ensure t
	:hook
	(haskell-mode . interactive-haskell-mode)
	(haskell-mode . haskell-doc-mode))

(use-package php-mode
	:ensure t)

(use-package glsl-mode
	:ensure t)

(use-package cmake-mode
	:ensure t)

(use-package editorconfig
	:ensure t
	:config
	;; Enable editorconfig-mode (EditorConfig homepage: https://editorconfig.org/)
	(editorconfig-mode t))

;; LSP
(use-package lsp-mode
	:ensure t
	:init
	(setq lsp-keymap-prefix "C-c l")

	:hook
	(c-mode . lsp)
	(c++-mode . lsp)
	(rust-mode . lsp)
	(python-mode . lsp)
	(cmake-mode . lsp)
	(lsp-mode . lsp-enable-which-key-integration)

	:config
	;; Rebind the lsp-mode keymap prefix to C-c l
	(define-key lsp-mode-map (kbd "C-c l") lsp-command-map)

	;; Variables
	(setq lsp-idle-delay 0.1)

	:commands lsp)

(use-package lsp-jedi
	:ensure t
	:config
	(with-eval-after-load "lsp-mode"
		(add-to-list 'lsp-disabled-clients 'pyls) ;; Don't use the PyLS language server in lsp-mode
		(add-to-list 'lsp-enabled-clients 'jedi)  ;; Use Jedi instead.
		))

(use-package lsp-ui
	:ensure t
	:commands lsp-ui-mode)

(use-package lsp-treemacs
	:ensure t
	:commands lsp-treemacs-errors-list)

(use-package helm-lsp
	:ensure t
	:commands helm-lsp-workspace-symbol)

;; Linting / Syntax checking
(use-package flycheck
	:ensure t)

(use-package flycheck-rust
	:ensure t)

;; Keybinds
(use-package hydra
	:ensure t)

(use-package which-key
	:ensure t
	:config
	(which-key-mode))

;; Project navigation
(use-package projectile
	:ensure t
	:config
	(projectile-mode)
	(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package helm-xref
	:ensure t)

;; Version Control
(use-package magit
	:ensure t
	:config
	(global-set-key (kbd "C-c d") 'magit-status)
	(global-set-key (kbd "C-c g") 'magit-dispatch)
	(global-set-key (kbd "C-c M-g") 'magit-file-dispatch))


;;;;; Appearance ;;;;;

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

;; Set transparency of the frame to 99% (active and inactive)
(set-frame-parameter (selected-frame) 'alpha '(98 . 98))
(add-to-list 'default-frame-alist '(alpha . (98 . 98)))

;;; Fonts

;; Set default font to Droid Sans Mono with size 12
;; (defvar custom-font-face "Droid Sans Mono-12")



;;;;; Features ;;;;;

;;; Backup files

;; Create backup / auto save files in /tmp/ instead of the current directory
(setq backup-directory-alist
	`((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
	`((".*" ,temporary-file-directory t)))

;;; Modes

;; Enable line numbers in all modes, except:
;; - shell-mode
;; - term-mode
;; - ansi-term-mode
;; - treemacs-mode
(require 'display-line-numbers)

;; Define some modes in which line numbers should not be displayed
(defcustom display-line-numbers-exempt-modes
	'(shell-mode
		 term-mode
		 ansi-term-mode
		 treemacs-mode)
	"Major modes in which to disable line numbers."
	:group 'display-line-numbers
	:type 'list
	:version "green"
	)

;; open display-line-numbers-mode unless any of the exempt mods is active
(defun display-line-numbers--turn-on ()
	"Turn on line numbers in all modes, except for certain major modes.  Exempt major modes are defined in `display-line-numbers-exempt-modes'."
	(unless (or (minibufferp)
				(member major-mode display-line-numbers-exempt-modes))
		(display-line-numbers-mode)))

;; Enable the modified mode display-line-numbers-mode globally
(global-display-line-numbers-mode)

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

;; Rebind C-x C-b to open ibuffer instead of buffer-list
;; Use this for managing (closing etc.) buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Some keybinds for controlling Emacs windows:
;; - creating new windows
;; - resizing windows
;; - killing a window and associated buffer
;; - using ace-window (switching between, deleting and swapping windows)
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

;; Bind C-S-k to kill-whole-line (C-k kills a line starting from the point)
(global-set-key (kbd "C-S-k") 'kill-whole-line)


;;; Hooks

;; Enable flycheck after initialization
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Enable global company mode after initialization
(add-hook 'after-init-hook #'global-company-mode)


;;; Disabled features

;; Enable narrow-to-region (bound to C-x n n)
(put 'narrow-to-region 'disabled nil)


;;; Other settings
(setq gc-cons-threshold (* 100 1024 1024)
    read-process-output-max (* 1024 1024))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
	'(package-selected-packages
		 '(glsl-mode php-mode haskell-mode cmake-mode doom-themes all-the-icons treemacs doom-modeline company company-box helm rust-mode editorconfig lsp-mode lsp-ui lsp-treemacs helm-lsp flycheck flycheck-rust hydra which-key projectile helm-xref)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

