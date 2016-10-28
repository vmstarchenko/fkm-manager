;; Package manager:
;; Initialise package and add Melpa repository
(require 'package)
(require 'cl)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t) ;; Melpa sources
(package-initialize)

;; Package list
(defvar required-packages
  '(;; slime
    auto-complete
    projectile
		;; my
    ;; auto-complete-c-headers
    flycheck
    google-translate
    iedit

    auctex
    latex-preview-pane
    ac-math

    yasnippet

    ;; other
    js2-mode ;; not checked
    powerline
    emmet-mode
    jedi
    sr-speedbar
    web-mode
    clang-format
    helm
    helm-gtags
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
