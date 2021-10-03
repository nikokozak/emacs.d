;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
	'("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

;; Download Use-Package
(unless (package-installed-p 'use-package)
	(package-install 'use-package))

(eval-when-compile
	(require 'use-package))

;; Undo functionality for Evil Mode
(use-package undo-fu)

;; g; g, . for Evil Mode
(use-package goto-chg)

;; SmartParens for lisps
(require 'smartparens-config)

(use-package evil
	:init
	(setq evil-undo-system 'undo-fu))
(evil-mode 1)

(define-key evil-normal-state-map "u" 'undo-fu-only-undo)
(define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo)

;; Parens modes
(add-hook 'lisp-mode-hook #'smartparens-strict-mode)
(add-hook 'lisp-mode-hook #'evil-cleverparens-mode)

;; Evil navigation
(global-unset-key (kbd "C-k")) ;; unmap kill line
(global-unset-key (kbd "C-l")) ;; unmap kill line
(global-unset-key (kbd "C-j")) ;; unmap kill line
(global-unset-key (kbd "C-h")) ;; unmap kill line
(global-set-key (kbd "C-x C-h") 'help-command)
(define-key evil-normal-state-map "\C-j" 'evil-window-down)
(define-key evil-normal-state-map "\C-k" 'evil-window-up)
(define-key evil-normal-state-map "\C-l" 'evil-window-right)
(define-key evil-normal-state-map "\C-h" 'evil-window-left)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit evil-cleverparens smartparens evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
