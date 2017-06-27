;;; create absents keymaps
(fkm:define-keymap shell-mode-map)
(fkm:define-keymap emacs-shell-mode-map)
(fkm:define-keymap js-mode-map)
(fkm:define-keymap js2-mode-map)
(fkm:define-keymap js2-jsx-mode-map)
(fkm:define-keymap python-mode-map)
(fkm:define-keymap emmet-mode-keymap)
(fkm:define-keymap moz-controller-mode-map)
(fkm:define-keymap org-mode-map)
(fkm:define-keymap xorg-mode-map)
(fkm:define-keymap c++-mode-map)
(fkm:define-keymap c-mode-map)
(fkm:define-keymap yas-minor-mode-map)
(fkm:define-keymap scss-mode-map)
(fkm:define-keymap fkm:sphinx-mode-map)
(fkm:define-keymap company-active-map)

;;; inline modes
(require 'fkm:linum) ;; нумерация строк
(require 'fkm:alarm) ;; будильники
(require 'fkm:battery) ;; батарея
(require 'fkm:cursor) ;; colored cursor
;;(require 'fkm:abbrev") ;; abbrev
(require 'tr-mode)
(require 'fkm:asm-mode)

;; sphinx
(add-hook 'python-mode-hook '(lambda ()
                               (require 'fkm:sphinx-mode)
                               (fkm:sphinx-mode t)))

;; fill column
;; (require 'fill-column-indicator)
;; (define-globalized-minor-mode global-fci-mode fci-mode
;;   (lambda()
;;     (if (and
;;          (not (string-match "^\*.*\*$" (buffer-name)))
;;          (not (eq major-mode 'dired-mode)))
;;         (fci-mode 1))))
;; (setq fci-style 'rule)
;; (set-face-background 'fci-shading "light gray")
;; (setq fci-rule-width 8) ;; ?? kek: thin black line between symbols
;; (setq fci-rule-color "darkblue")
;; (setq-default fill-column 72)
;; (global-fci-mode 1)

;;; local modes
;; moz-controller (todo: need firefox plugin)
;; (defun load-moz-controller()
;;   (interactive)
;;   (require 'moz-controller)
;;   (moz-controller-mode 1))
;; (add-hook 'css-mode-hook 'load-moz-controller)
;; (add-hook 'js-mode-hook 'load-moz-controller)
;; (add-hook 'html-mode-hook 'load-moz-controller)
;; (add-hook 'web-mode-hook 'load-moz-controller)
;; (add-hook 'python-mode-hook 'load-moz-controller)
;; load the file

;; gnuplot
(require 'gnuplot-mode)
;; specify the gnuplot executable (if other than /usr/bin/gnuplot)
;; (setq gnuplot-program "/sw/bin/gnuplot")

;; automatically open files ending with .gp or .gnuplot in gnuplot mode
;; (setq auto-mode-alist
;;       (append '(("\\.\\(p\\|gp\\|gnuplot\\)$" . gnuplot-mode)) auto-mode-alist))

;; clang-format
(require 'clang-format)
;; sudo apt-get install clang-3.8 lldb-3.8 clang-format-3.8
;; sudo ln -s /usr/bin/clang-format-3.8 /usr/bin/clang-format

;; lisp format
;; (require 'srefactor) ;; TODO: rm
;; (require 'srefactor-lisp)

(require 'elisp-format)
(defadvice elisp-format-buffer ;; delete trailing whitespaces
    (after elisp-format-buffer-after activate)
  (delete-trailing-whitespace))
(setq elisp-format-column 70)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; cursor
(require 'multiple-cursors)

;; colors
(require 'color)

;; castomize dired
(require 'dired )

(define-key dired-mode-map (kbd "RET")
  'dired-find-alternate-file) ; was dired-advertised-find-file
(define-key dired-mode-map (kbd "^")
  (lambda () (interactive) (find-alternate-file "..")))  ; was dired-up-directory
(put 'dired-find-alternate-file 'disabled nil)

;; autopair
(require 'autopair)
(autopair-global-mode)
(add-hook 'web-mode-hook '(lambda() (autopair-mode -1)))

;; hs-mode
(defun setup-hs-mode()
  (interactive)
  (hs-minor-mode)
  (defvar hs-special-modes-alist
    (mapcar 'purecopy
            '(;;(c-mode "{" "}" "/[*/]" nil nil)
              ;;(c++-mode "{" "}" "/[*/]" nil nil)
              ;;(bibtex-mode ("@\\S(*\\(\\s(\\)" 1))
              ;;(java-mode "{" "}" "/[*/]" nil nil)
              (js-mode "{" "}" "/[*/]" nil))))
  (require 'hideshow-fringe)
  ;; (require 'hideshowvis)
  ;; (hideshowvis-enable)
  ;; (hideshowvis-symbols)
  (setq hide-string " [ %d ] ")
  )
(add-hook 'js-mode-hook 'setup-hs-mode)




;; scss-mode
(require 'scss-mode)
(setq scss-compile-at-save nil)

;; highlight-indentation
(require 'highlight-indentation)
(add-hook 'python-mode-hook '(lambda() (highlight-indentation-mode t)))

;; indentation
(electric-indent-mode 1)
;; (add-hook 'python-mode-hook
;;           '(lambda ()
;;              (defun newline (&optional ARG INTERACTIVE)
;;                (interactive)
;;                (insert "\n")
;;                (indent-for-tab-command))))

;; IDO
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
;; helm
;; (require 'helm-config)

;; Орг мод
(require 'org-install)
(add-hook 'org-mode-hook '(lambda() (require 'fkm:org))) ;; for my mode map
;; settings
(defface org-canceled '() "face for canceled in org-mode")
(defface org-wait '() "face for wait in org-mode")
(setq org-todo-keywords '((sequence "TODO" "WAIT" "|" "CANCELED" "DONE")))
(setq org-todo-keyword-faces '(("WAIT". org-wait)
                               ("CANCELED". org-canceled)))
(setq org-log-done t)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)


;; melpa modes
;; autocompletion
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
;; castomize ac-complete
(add-hook 'after-init-hook '(lambda() (require 'fkm:completion)))
;; (add-hook 'after-init-hook '(lambda() (require 'fkm:completion2)))

;; depandence: auto-complete
;; (require 'fkm:shell) ;; eshell

;; google translate
(add-hook 'after-init-hook
          (lambda()
            (require 'google-translate)
            (require 'google-translate-default-ui)
            ))

;; ;; rope
;; (defun ropemacs-setup ()
;;   (interactive)
;;   (require 'pymacs)
;;   (autoload 'pymacs-apply "pymacs")
;;   (autoload 'pymacs-call "pymacs")
;;   (autoload 'pymacs-eval "pymacs" nil t)
;;   (autoload 'pymacs-exec "pymacs" nil t)
;;   (autoload 'pymacs-load "pymacs" nil t)
;;   (ac-ropemacs-setup)
;;   (setq ropemacs-confirm-saving 'nil)
;;   (ropemacs-mode t)
;;   (pymacs-load "ropemacs" "rope-"))
;; (add-hook 'python-mode-hook 'ropemacs-setup)

;; start yasnippet with emacs
;; depandance: fkm:complete
(defun load-yasnippet()
  (interactive)
  (require 'yasnippet)
  (yas-global-mode 1)
  (yas/load-directory "~/.emacs.d/snippets") ;; folder
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/snippets"))
(add-hook 'after-init-hook 'load-yasnippet)


;; semantic
;; depandence: fkm:complete
(add-hook 'after-init-hook
          (lambda()
            (semantic-mode 1)
            (setq semanticdb-default-save-directory (format "%s/%s" fkm-tmp-dir ".semanticdb"))
            (shell-command (concat "mkdir -p " semanticdb-default-save-directory))))

(defun add-semantic-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'add-semantic-autocomplete)

;; emmet
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'scss-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)

;; web-mode settings
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-block-face t)
(setq web-mode-enable-part-face t)
(setq web-mode-enable-comment-keywords t)
(setq web-mode-enable-heredoc-fontification t)
(setq web-mode-engines-alist
      '(
        ("django"    . "\\.html\\'")
        ))
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)
;; (web-mode-use-tabs)

;; flycheck c/cpp
(defun flycheck-setup()
  (flycheck-mode)
  ;; google cpplint for style cheching
  (eval-after-load 'flycheck
    '(progn
       (require 'flycheck-google-cpplint)
       (flycheck-add-next-checker 'c/c++-cppcheck
                                  '(warning . c/c++-googlelint))))
  (executable-find "cpplint.py") ;; todo: rm maybe?
  (custom-set-variables
   '(flycheck-googlelint-verbose "3")
   '(flycheck-googlelint-filter "-legal/copyright,-runtime/explicit,-whitespace/indent,-whitespace/end_of_line")
   '(flycheck-googlelint-root "project/src")
   '(flycheck-googlelint-linelength "80"))
  (setq flycheck-check-syntax-automatically '(idle-change)))

(defun flycheck-cpp-setup()
  (flycheck-setup)
  (setq flycheck-gcc-language-standard "c++11"))

(defun flycheck-c-setup()
  (flycheck-setup)
  (setq flycheck-gcc-language-standard "gnu11"))

(add-hook 'c++-mode-hook #'flycheck-cpp-setup)
(add-hook 'c-mode-hook #'flycheck-c-setup)

;; flycheck javascript
;; (defun flycheck-js-setup()
;;   (flycheck-mode)
;;   ;; (setq flycheck-eslintrc "/home/vladimir/.eslintrc")
;;   ;; (setq flycheck-temp-prefix ".")
;;   ;; (setq flycheck-eslint-rules-directories '("~/"))
;;   ;; (flycheck-add-mode 'javascript-eslint 'js2-mode)
;;   ;; (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
;;   ;; (flycheck-add-mode 'javascript-eslint 'js-mode)
;;   (flycheck-add-mode 'javascript-eslint 'js2-mode)
;;   (flycheck-add-mode 'javascript-eslint 'js-mode)

;;   ;; (setq-default flycheck-disabled-checkers
;;   ;;               (append flycheck-disabled-checkers
;;   ;;                       '(javascript-jshint)))
;;   )

;; (add-hook 'js-mode-hook #'flycheck-js-setup)
;; (add-hook 'js2-mode-hook #'flycheck-js-setup)
;; (add-hook 'js2-jsx-mode-hook #'flycheck-js-setup)
;; (add-hook 'js3-mode-hook #'flycheck-js-setup)

;; flycheck for css
(defun flycheck-css-setup()
  (flycheck-mode)
  )
(add-hook 'css-mode-hook #'flycheck-css-setup)
(add-hook 'scss-mode-hook #'flycheck-css-setup)

;; flycheck python
(defun flycheck-python-setup ()
  (flycheck-mode)
  (require 'flycheck-mypy)
  (add-hook 'python-mode-hook 'flycheck-mode)
  (flycheck-add-next-checker 'python-pylint
                                  '(warning . python-mypy))
  (add-to-list 'flycheck-disabled-checkers 'python-flake8)
  (add-to-list 'flycheck-disabled-checkers 'python-pycompile))
(add-hook 'python-mode-hook #'flycheck-python-setup)

;; flycheck python
(defun flycheck-sh-setup ()
  (flycheck-mode))
(add-hook 'sh-mode-hook #'flycheck-sh-setup)


;; flycheck java
;; (defun flycheck-java-setup ()
;;   (flycheck-mode))
;; (add-hook 'java-mode-hook #'flycheck-java-setup)
;;; modes.el ends here

;; ;; LaTeX ;; its work
;; (add-hook 'TeX-mode-hook
;;          '(lambda()
;;             (message "load")
;;             (latex-preview-pane-mode t)))
;; ;; fix docview-mode keys
;; (defun set-docview-mode-keys()
;;  (define-key (current-local-map)
;;    [remap forward-paragraph]
;;    'doc-view-next-page)
;;  (define-key
;;    (current-local-map)
;;    [remap backward-paragraph]
;;    'doc-view-previous-page))
;; (add-hook 'doc-view-mode-hook 'set-docview-mode-keys)


;; js
;; (flycheck-mode)
;; (require 'nvm)
;; (nvm-use (caar (last (nvm--installed-versions))))

;; (add-hook 'projectile-after-switch-project-hook 'mjs/setup-local-eslint)

;; (defun mjs/setup-local-eslint ()
;;   "If ESLint found in node_modules directory - use that for flycheck.
;; Intended for use in PROJECTILE-AFTER-SWITCH-PROJECT-HOOK."
;;   (interactive)
;;   (let ((local-eslint (expand-file-name "./node_modules/.bin/eslint")))
;;     (setq flycheck-javascript-eslint-executable
;;           (and (file-exists-p local-eslint) local-eslint))))

;; (with-eval-after-load 'flycheck
;;     (push 'web-mode (flycheck-checker-get 'javascript-eslint 'modes)))

;; (custom-set-variables
;;  '(js2-allow-rhino-new-expr-initializer t)
;;  '(js2-highlight-level 3)
;;  '(js2-indent-switch-body t)
;;  '(js2-language-version 200))

;; hs
;; (add-hook 'c-mode-common-hook #'hs-minor-mode)
;; (add-hook 'c++-mode-common-hook #'hs-minor-mode)

;; colors
(add-hook 'css-mode-hook 'hex-color)
(add-hook 'html-mode-hook 'hex-color)
(add-hook 'emacs-lisp-mode-hook 'hex-color)


(provide 'fkm:modes)
