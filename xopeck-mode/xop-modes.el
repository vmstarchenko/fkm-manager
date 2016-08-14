;;; create absents keymaps
(defvar shell-mode-map (make-sparse-keymap)
	"Keymap for `shell-mode'.")
(defvar emacs-shell-mode-map (make-sparse-keymap)
	"Keymap for `eshell-mode'.")
(defvar js-mode-map (make-sparse-keymap)
	"Keymap for `js-mode'.")
(defvar python-mode-map (make-sparse-keymap)
	"Keymap for `python-mode'.")
(defvar emmet-mode-keymap (make-sparse-keymap)
	"Keymap for `emmet-mode'.")
(defvar moz-controller-mode-map (make-sparse-keymap)
	"Keymap for `moz-controller-mode'.")
(defvar org-mode-map (make-sparse-keymap)
	"Keymap for `org-mode'.")
(defvar xorg-mode-map (make-sparse-keymap)
	"Keymap for `xorg-mode'.")

;;; inline modes
(require 'xop-linum) ;; нумерация строк
(require 'xop-alarm) ;; будильники
(require 'xop-battery) ;; батарея
(require 'xop-cursor) ;; colored cursor
(require 'xop-brackets) ;; brackets
;;(require 'xop-abbrev") ;; abbrev
(require 'tr-mode)

;;; local modes
;; moz-controller (todo: need firefox plugin)
(defun load-moz-controller()
  (interactive)
  (require 'moz-controller)
  (moz-controller-mode 1))
(add-hook 'css-mode-hook 'load-moz-controller)
(add-hook 'js-mode-hook 'load-moz-controller)
(add-hook 'html-mode-hook 'load-moz-controller)
(add-hook 'jinja2-mode-hook 'load-moz-controller)
(add-hook 'python-mode-hook 'load-moz-controller)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

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
(add-hook 'python-mode-hook
          '(lambda ()
             (defun newline ()
               (interactive)
               (insert "\n")
               (indent-for-tab-command))))

;; подсказки при открытии файы
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Орг мод
(require 'org-install)
(add-hook 'org-mode-hook
          '(lambda ()
             (require 'xop-org))) ;; for my mode map

;; melpa modes
;; autocompletion
;; todo: in xop-completion
(require 'xop-completion)

;; depandence: auto-complete
(require 'xop-eshell) ;; eshell

;; google translate
(require 'google-translate)
(require 'google-translate-default-ui)

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
;; depandance: xop-complete
(defun load-yasnippet()
  (interactive)
	(require 'yasnippet)
	(yas-global-mode 1)
	(yas/load-directory "~/.emacs.d/snippets") ;; folder
	(add-to-list 'ac-dictionary-directories "~/.emacs.d/snippets"))
(load-yasnippet)

;; semantic
;; depandence: xop-complete
(semantic-mode 1)
(defun add-semantic-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-common-hook 'add-semantic-autocomplete)

;; emmet
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'scss-mode-hook  'emmet-mode)
(add-hook 'jinja2-mode-hook  'emmet-mode)

;; flycheck cpp
(defun flycheck-cpp-setup()
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
   '(flycheck-googlelint-linelength "120"))
  (setq flycheck-gcc-language-standard "c++11")
  (setq flycheck-check-syntax-automatically '(idle-change))
  )
(add-hook 'c++-mode-hook #'flycheck-cpp-setup)

;; flycheck javascript
(defun flycheck-js-setup()
	(flycheck-mode)
  )
(add-hook 'js-mode-hook #'flycheck-js-setup)
(add-hook 'js2-mode-hook #'flycheck-js-setup)
(add-hook 'js3-mode-hook #'flycheck-js-setup)

;; flycheck for css
(defun flycheck-css-setup()
  (flycheck-mode)
  )
(add-hook 'css-mode-hook #'flycheck-css-setup)
(add-hook 'scss-mode-hook #'flycheck-css-setup)

;; flycheck python
(defun flycheck-python-setup ()
  (flycheck-mode))
(add-hook 'python-mode-hook #'flycheck-python-setup)

;; flycheck java
;; (defun flycheck-java-setup ()
;;   (flycheck-mode))
;; (add-hook 'java-mode-hook #'flycheck-java-setup)
;;; modes.el ends here

;; LaTeX
;;(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)
;;(defun set-docview-mode-keys()
;;  (define-key (current-local-map)
;;    [remap forward-paragraph]
;;    'doc-view-next-page)
;;  (define-key
;;    (current-local-map)
;;    [remap backward-paragraph]
;;    'doc-view-previous-page))
;;(add-hook 'doc-view-mode-hook 'set-docview-mode-keys)

;; hs
;; (add-hook 'c-mode-common-hook #'hs-minor-mode)
;; (add-hook 'c++-mode-common-hook #'hs-minor-mode)

;; unset keys
(defun unset-elisp-mode-keys()
  (interactive)
  (define-key lisp-interaction-mode-map (kbd "C-M-i") nil)
  (define-key lisp-interaction-mode-map (kbd "C-M-x") nil)
  (define-key emacs-lisp-mode-map (kbd "C-M-i") nil)
  (define-key emacs-lisp-mode-map (kbd "C-M-x") nil))
(add-hook 'lisp-interaction-mode-hook 'unset-elisp-mode-keys)

(defun unset-js-mode-keys()
  (interactive)
  (define-key js-mode-map (kbd "C-M-x") nil)
  (define-key js-mode-map (kbd "M-.") nil))
(add-hook 'js-mode-hook 'unset-js-mode-keys)

(defun unset-js2-mode-keys()
  (interactive)
  (define-key js2-mode-map (kbd "M-j") nil)
  (define-key js2-mode-map (kbd "C-c") nil)
  (define-key js2-mode-map "\t" nil)
  (define-key js2-mode-map (kbd "<backtab>") nil)
  )
(add-hook 'js2-mode-hook 'unset-js2-mode-keys)

(defun unset-c++-mode-keys()
  (interactive)
  (define-key c++-mode-map (kbd "C-d") nil)
  (define-key c++-mode-map (kbd "C-M-e") nil)
  (define-key c++-mode-map (kbd "C-;") nil)
  (define-key c++-mode-map (kbd "C-M-q") nil))
(add-hook 'c++-mode-hook 'unset-c++-mode-keys)

(defun unset-python-mode-keys()
  (interactive)
  (define-key python-mode-map (kbd "C-M-x") nil))
(add-hook 'python-mode-hook 'unset-python-mode-keys)

(defun unset-makefile-mode-keys()
  (interactive)
  (define-key makefile-mode-map (kbd "M-p") nil))
(add-hook 'makefile-mode-hook 'unset-makefile-mode-keys)

(defun unset-slime-repl-mode-keys()
  (interactive)
  (define-key slime-repl-mode-map (kbd "M-p") nil)
  (define-key slime-repl-mode-map (kbd "M-s") nil))
(add-hook 'slime-repl-mode-hook 'unset-slime-repl-mode-keys)

(defun unset-shell-mode-keys()
  (interactive)
  (define-key shell-mode-map (kbd "C-M-l") nil)
  (define-key shell-mode-map (kbd "M-p") nil)
  (define-key shell-mode-map (kbd "C-d") nil)
  (define-key shell-mode-map (kbd "M-r") nil))
(add-hook 'shell-mode-hook 'unset-shell-mode-keys)

(defun unset-eshell-mode-keys()
  (interactive)
  (use-local-map emacs-shell-mode-map)
  (define-key eshell-mode-map (kbd "M-p") nil)
  (define-key eshell-mode-map (kbd "C-m") nil)
  (define-key eshell-mode-map (kbd "M-s") nil)
  (define-key eshell-mode-map (kbd "M-r") nil)
  (define-key shell-mode-map (kbd "C-M-l") nil))
(add-hook 'eshell-mode-hook 'unset-eshell-mode-keys)

(defun unset-python-shell-mode-keys()
  (interactive)
  (define-key inferior-python-mode-map (kbd "M-p") nil) ;; dot't work
  (define-key inferior-python-mode-map (kbd "M-r") nil))
(add-hook 'inferior-python-mode-hook 'unset-python-mode-keys)

(defun unset-ido-mode-keys()
  (interactive)
  (define-key ido-file-dir-completion-map (kbd "M-p") nil)
  (define-key ido-file-dir-completion-map (kbd "M-l") nil)
  )
(add-hook 'ido-setup-hook 'unset-ido-mode-keys)

(defun unset-dired-mode-keys()
  (interactive)
  (define-key dired-mode-map (kbd "M-s") nil))
(add-hook 'dired-mode-hook 'unset-dired-mode-keys)

;;(defun preview-latex-setup()
;;  (latex-preview-pane-mode 1)
;;  (define-key latex-preview-pane-mode-map (kbd "M-p") nil) ; unset key
;;  (define-key latex-preview-pane-mode-map (kbd "s-p") nil) ; unset key
;;  (define-key latex-preview-pane-mode-map (kbd "M-P") nil) ; unset key
;;  (define-key latex-preview-pane-mode-map (kbd "s-P") nil) ; unset key
;;  (latex-preview-update))
;;(add-hook 'LaTeX-mode-hook #'preview-latex-setup)

(defun unset-org-mode-keys()
  (define-key org-mode-map (kbd "C-y") nil)
  (define-key org-mode-map (kbd "M-RET") nil)
  (define-key org-mode-map (kbd "M-h") nil)
  (define-key org-mode-map (kbd "C-M-t") nil)
  (define-key org-mode-map (kbd "M-e") nil)
  )
(add-hook 'org-mode-hook 'unset-org-mode-keys)

(defun unset-jinja2-mode-keys()
  (interactive)
  (define-key jinja2-mode-map (kbd "C-M-i") nil))
(add-hook 'jinja2-mode-hook 'unset-jinja2-mode-keys)

(defun unset-undo-tree-mode-keys()
  (define-key undo-tree-map (kbd "C-/") nil)
  )
(add-hook 'undo-tree-mode-hook 'unset-undo-tree-mode-keys)

(defun unset-bash-mode-keys()
  (define-key sh-mode-map (kbd "C-M-x") nil)
  )
(add-hook 'sh-mode-hook 'unset-bash-mode-keys)


;; minibuffer
;; minibuffer-inactive-mode
(define-key minibuffer-local-map (kbd "M-s") nil)
(define-key minibuffer-local-map (kbd "M-r") nil)
(define-key minibuffer-local-map (kbd "M-p") nil)


;; colors
(add-hook 'css-mode-hook 'hex-color)
(add-hook 'html-mode-hook 'hex-color)
(add-hook 'emacs-lisp-mode-hook 'hex-color)