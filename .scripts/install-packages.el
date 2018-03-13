;; Package manager:
;; Initialise package and add Melpa repository
(require 'package)
(require 'cl)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t) ;; Melpa sources
(package-initialize)

;; Package list
(defvar required-packages
  '(ac-math
    autopair
    clang-format
    cmake-mode
    company
    cython-mode
    django-snippets
    emmet-mode
    flycheck
    flycheck-mypy
    google-translate
    helm
    helm-gtags
    helm-projectile
    iedit
    jedi
    latex-preview-pane
    lispy
    magit
    markdown-mode
    multiple-cursors
    nginx-mode
    popup-complete
    powerline
    pretty-symbols
    projectile
    rainbow-delimiters
    readline-complete
    rjsx-mode
    s
    sr-speedbar
    srefactor
    virtualenvwrapper
    web-mode
    yasnippet
    ))

(defun packages-installed-p ()
  "Check if pachages are installed"
  (interactive)
  (loop for package in required-packages
        unless (package-installed-p package)
        do (return nil)
        finally (return t)))

;; Auto-install packages
(unless (packages-installed-p)
  (message "%s" "Emacs is now refreshing it's package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  (dolist (package required-packages)
    (unless (package-installed-p package)
      (package-install package))))

(kill-emacs)


;; ac-math
;; auto-complete-clang
;; auto-complete-auto-complete-clang-async
;; autopair
;; clang-format
;; cmake-ide
;; cmake-mode
;; company
;; company-math
;; cuda-mode
;; django-snippets
;; ein
;; emmet-mode
;; flycheck
;; flycheck-mypy
;; google-translate
;; helm
;; helm-gtags
;; iedit
;; irony
;; jedi
;; latex-math-preview
;; latex-preview-pane
;; lispy
;; magit
;; markdown-mode
;; multiple-cursors
;; nginx-mode
;; php-mode
;; popup-complete
;; powerline
;; pretty-lambdada
;; projectile
;; rainbow-delimiters
;; readline-complete
;; rjsx-mode
;; rtags
;; s
;; smartrep
;; sr-speedbar
;; srefactor
;; web-mode
;; yasnippet
