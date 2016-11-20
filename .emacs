;;;; подключаем плагины
;; добавляем в список закрузки плагинов папку .emacs.d

(add-to-list 'load-path "~/.emacs.d/xopeck-mode")
(add-to-list 'load-path "~/.emacs.d/xopeck-mode/modes/auctex")

;; start package.el with emacs
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
(require 'cl)

;;; new
;; (defun system-is-linux ()
;;     "Linux system checking."
;;     (interactive)
;;     (string-equal system-type "gnu/linux"))
;; (defun system-is-mac ()
;;     "Mac OS X system checking."
;;     (interactive)
;;     (string-equal system-type "darwin"))
;; (defun system-is-windows ()
;;     "MS Windows system checking."
;;     (interactive)
;;     (string-equal system-type "windows-nt"))
;; ;; Paths (for Common Lisp compiler - SBCL)
;; (setq unix-sbcl-bin    "/usr/bin/sbcl")
;; (setq windows-sbcl-bin "C:/sbcl/sbcl.exe")

;; ;; Package manager:
;; ;; Initialise package and add Melpa repository
;; (require 'package)
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.org/packages/") t) ;; Добавляем ресурс Melpa
;; (package-initialize) ;; Инициализируем пакетный менеджер

;; ;; Package list
;; (defvar required-packages
;;   '(slime           ;; Slime - IDE для Common Lisp, интегрированная с Emacs
;;     projectile      ;; Удобный менеджер проектов
;;     auto-complete   ;; Автодополнение
;; 		;; my
;; 		auto-complete
;;     auto-complete-c-headers
;;     ac-math
;;     flycheck
;;     google-translate
;;     iedit
;;     latex-preview-pane
;;     powerline
;;     yasnippet))
;; (require 'cl)
;; ;; Функция реализет проверку факта установки перечисленных выше пакетов:
;; (defun packages-installed-p ()
;;     "Packages availability checking."
;;     (interactive)
;;     (loop for package in required-packages
;;           unless (package-installed-p package)
;;             do (return nil)
;;           finally (return t)))
;; ;; Автоматическая установка пакетов при первом запуске Emacs
;; ;; Auto-install packages
;; (unless (packages-installed-p)
;;     (message "%s" "Emacs is now refreshing it's package database...")
;;     (package-refresh-contents)
;;     (message "%s" " done.")
;;     (dolist (package required-packages)
;;         (unless (package-installed-p package)
;;             (package-install package))))
;; ;;;
;; (when (packages-installed-p)
;;     ;; Auto-complete
;;     (require 'auto-complete)
;;     (require 'auto-complete-config)
;;     (ac-config-default)
;;     (setq ac-auto-start        t)
;;     (setq ac-auto-show-manu    t)
;;     (global-auto-complete-mode t)
;;     (add-to-list 'ac-modes 'lisp-mode)
;;     ;; SLIME
;;     (require 'slime)
;;     (require 'slime-autoloads)
;;     (setq slime-net-coding-system 'utf-8-unix)
;;     (slime-setup '(slime-fancy slime-asdf slime-indentation))
;;     (if (or (file-exists-p unix-sbcl-bin) (file-exists-p windows-sbcl-bin))
;;         (if (system-is-windows)
;;             (setq inferior-lisp-program windows-sbcl-bin)
;;             (setq inferior-lisp-program unix-sbcl-bin))
;;         (message "%s" "SBCL not found..."))
;;     (add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
;;     ;; Projectile
;;     (require 'projectile)
;;     (projectile-global-mode))
;; ;;; settings
;; (setq-default lisp-body-indent 4)
;; (setq lisp-indent-function 'common-lisp-indent-function)

;;;
;; Пользовательские пакеты
(load "xopeck-mode")
