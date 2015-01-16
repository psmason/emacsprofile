;; pretty colors
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;; block startup message (emacs 24)
(setq inhibit-startup-screen t)

;; spaces not tabs
(setq-default indent-tabs-mode nil)
;;(setq-default tab-width 4)
;;(setq indent-line-function 'insert-tab)

;; MELPA
(require 'package) 
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize) 

;; for iedit 
(require 'iedit)

;; for auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; for c headers
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/c++/4.8")
)
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook   'my:ac-c-header-init)

;; auto-complete-clang
(require 'auto-complete-clang)
(add-to-list 'load-path "~/.emacs.d/auto-complete-clang/")
(setq ac-quick-help-delay 0.5)
(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
 /usr/include/c++/4.8
 /usr/include/x86_64-linux-gnu/c++/4.8
 /usr/include/c++/4.8/backward
 /usr/lib/gcc/x86_64-linux-gnu/4.8/include
 /usr/local/include
 /usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed
 /usr/include/x86_64-linux-gnu
 /usr/include
"
               )))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang) ac-sources)))
(add-hook 'c++-mode-hook 'my-ac-cc-mode-setup)
(my-ac-config)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((eval progn (defun my-project-specific-function nil (setq ac-clang-flags (append ac-clang-flags (quote ("-I../messages")))) (setq achead:include-directories (append achead:include-directories (quote ("../messages"))))) (my-project-specific-function)) (eval progn (defun my-project-specific-function nil (setq ac-clang-flags (append ac-clang-flags (quote ("../messages")))) (setq achead:include-directories (append achead:include-directories (quote ("../messages"))))) (my-project-specific-function)) (eval progn (defun my-project-specific-function nil (setq ac-clang-flags (append ac-clang-flags (quote ("./messages"))))) (my-project-specific-function)) (eval progn (defun my-project-specific-function nil (setq ac-clang-flags (append ac-clang-flags (quote (""))))) (my-project-specific-function)) (eval progn (defun my-project-specific-function nil (setq ac-clang-flags (append ac-clang-flags (quote ("-I../messages"))))) (my-project-specific-function))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
