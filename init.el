;;; init.el --- Emacs initialization file, used for config -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;;;; Packages ;;;;;

;;; Setup

; Setup package repositories
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

; Install use-package for easier package configuration
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
 	use-package-expand-minimally t))


;;; Package list + configuration

; Themes
(use-package doom-themes
  :config
  ; Enable bold and italic styles for doom-themes themes
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)

  ; Load the theme (doom-one)
  ; Keep in mind that each theme might have their own settings.
  (load-theme 'doom-one t)

  ; Corrects (and improves) org-mode's native fontification
  (doom-themes-org-config))

(use-package all-the-icons)

; UI
(use-package treemacs
  :config
  ; Configure treemacs for use with doom-themes
  (doom-themes-treemacs-config)

  ; Enable treemacs
  (treemacs))

(use-package doom-modeline
  :config
  ; Enable the doom-modeline
  (doom-modeline-mode t))

; Autocompletion
(use-package company
  :config
  (require 'company)
  (setq company-idle-delay 0.0
	company-minimum-prefix-length 1))

(use-package company-box
  :init
  (add-hook 'company-mode #'company-box-mode))

(use-package helm
  :config
  ; Enable helm-mode (nicer menus)
  (helm-mode)

  ; Redefine some keybinds to the use the helm versions of
  ; some functions / utilities instead.
  (define-key global-map [remap find-file] 'helm-find-files)
  (define-key global-map [remap execute-extended-command] 'helm-M-x)
  (define-key global-map [remap switch-to-buffer] 'helm-mini)
)

; Programming languages + editor integration
(use-package rust-mode)

(use-package haskell-mode)

(use-package cmake-mode)

(use-package editorconfig
  :config
  ; Enable editorconfig-mode (EditorConfig homepage: https://editorconfig.org/)
  (editorconfig-mode t))

; lsp-mode related packages
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")

  :hook
  (c-mode . lsp)
  (rust-mode . lsp)
  (cmake-mode . lsp)
  (haskell-mode . lsp)
  (lsp-mode . lsp-enable-which-key-integration)

  :config
  ; Rebind the lsp-mode keymap prefix to C-c l
  (require 'lsp-mode)
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)

  ; Variables
  (setq lsp-idle-delay 0.1)

  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)

(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package helm-lsp :commands helm-lsp-workspace-symbol)

; Linting / Syntax checking
(use-package flycheck)

(use-package flycheck-rust)

; Keybinds
(use-package hydra)

(use-package which-key
  :config
  (which-key-mode))

; Project navigation
(use-package projectile)

(use-package helm-xref)


;;;;; Appearance ;;;;;

;;; Window options

; Don't show the startup screen
(setq inhibit-startup-screen t)

; Disable the Menu Bar
(menu-bar-mode -1)

; Disable scrollbars
(toggle-scroll-bar -1)

; Disable the toolbar
(tool-bar-mode -1)

; Set visible-bell instead of an audible bell
(setq visible-bell 1)


;;;;; Features ;;;;;

;;; Modes

; Enable line numbers in all modes, except:
; - shell-mode
; - term-mode
; - ansi-term-mode
(require 'display-line-numbers)

; Define some modes in which line numbers should not be displayed
(defcustom display-line-numbers-exempt-modes
  '(shell-mode term-mode ansi-term-mode)
  "Major modes in which to disable line numbers."
  :group 'display-line-numbers
  :type 'list
  :version "green"
)

; open display-line-numbers-mode unless any of the exempt mods is active
(defun display-line-numbers--turn-on ()
  "Turn on line numbers in all modes, except for certain major modes.  Exempt major modes are defined in `display-line-numbers-exempt-modes'."
  (unless (or (minibufferp)
	      (member major-mode display-line-numbers-exempt-modes))
    (display-line-numbers-mode)))

; Enable the modified mode display-line-numbers-mode globally
(global-display-line-numbers-mode)

; Enable show-paren-mode (Matching pairs, e.g. parens are highlighted when point is over them)
(show-paren-mode t)

; Enable show-paren-when-point-inside-paren -> if the point is next to a paren, also show the pair
(require 'paren)
(setq show-paren-when-point-inside-paren t)

; Enable electric-pair-mode (autocompletion of character pairs)
(electric-pair-mode t)

;; Add some more electric pairs:
(require 'elec-pair)

; Rust
(defvar rust-electric-pairs
  '((124 . 124)) ; |
  )
(defun rust-add-electric-pairs ()
  "Add rust-electric-pairs to the electric-pair-pairs list."
  (setq electric-pair-pairs (append electric-pair-pairs rust-electric-pairs)))

(add-hook 'rust-mode-hook #'rust-add-electric-pairs)

; Enable global-prettify-symbols-mode (Compact multiple characters into one without altering the original text)
(global-prettify-symbols-mode t)

;; Add some more symbols to the prettify-symbols-alist
; Emacs Lisp
(defun elisp-set-prettify-symbols-list ()
  "Set the `prettify-symbols-alist'."
  (setq prettify-symbols-alist
	'(("lambda" . ?λ))))
(add-hook 'emacs-lisp-mode-hook #'elisp-set-prettify-symbols-list)

; Rust
(defun rust-set-prettify-symbols-list ()
  "Set the `prettify-symbols-alist'."
  (setq prettify-symbols-alist
	'(("=>" . ?⇒)
	  ("->" . ?⟶)
	  (">=" . ?⩾)
	  ("<=" . ?⩽)
	  ("!=" . ?≠))))
(add-hook 'rust-mode-hook #'rust-set-prettify-symbols-list)

; Haskell
(defun haskell-set-prettify-symbols-list ()
  "Set the `prettify-symbols-alist'."
  (setq prettify-symbols-alist
	'(("=>" . ?⇒)
	  ("->" . ?⟶)
	  (">=" . ?⩾)
	  ("<=" . ?⩽)
	  ("!=" . ?≠))))

; C
(defun c-set-prettify-symbols-list ()
  "Set the `prettify-symbols-alist'."
  (setq prettify-symbols-alist
	'((">=" . ?⩾)
 	  ("<=" . ?⩽)
	  ("!=" . ?≠))))
(add-hook 'c-mode-hook #'c-set-prettify-symbols-list)



; Rebind C-x C-b to open ibuffer instead of buffer-list
; Use this for managing (closing etc.) buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

; Some keybinds for controlling Emacs windows:
; - resizing Emacs windows
; - using ace-window (switch between, delete and swap windows)
(defhydra hydra-window-control (global-map "C-c w")
  "window control"
  ("<left>" shrink-window-horizontally)
  ("<right>" enlarge-window-horizontally)
  ("<down>" shrink-window)
  ("<up>" enlarge-window)
  ("+" balance-windows)
  ("j" ace-window)                ; Jump
  ("d" ace-delete-window)         ; Delete
  ("s" ace-swap-window)           ; Swap
  ("v" split-window-vertically)   ; Vertical split
  ("h" split-window-horizontally) ; Horizontal split
)

; Bind C-S-k to kill-whole-line (C-k kills a line starting from the point)
(global-set-key (kbd "C-S-k") 'kill-whole-line)


;;; Hooks

; Enable flycheck after initialization
(add-hook 'after-init-hook #'global-flycheck-mode)

; Enable global company mode after initialization
(add-hook 'after-init-hook #'global-company-mode)


;;; Disabled features

; Enable narrow-to-region (bound to C-x n n)
(put 'narrow-to-region 'disabled nil)


;;; Other settings
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(haskell-mode cmake-mode doom-themes all-the-icons treemacs doom-modeline company company-box helm rust-mode editorconfig lsp-mode lsp-ui lsp-treemacs helm-lsp flycheck flycheck-rust hydra which-key projectile helm-xref)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

