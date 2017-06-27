;;; Unset keys
;; Example:
;; (defun unset-elisp-mode-keys()
;;   (interactive)
;;   (define-key lisp-interaction-mode-map (kbd "C-M-i") nil)
;;   (define-key lisp-interaction-mode-map (kbd "C-M-x") nil)
;;   (define-key lisp-interaction-mode-map (kbd "C-M-q") nil))
;; (add-hook 'lisp-interaction-mode-hook 'unset-elisp-mode-keys)
;;
;; or just use fkm:unset-kbds macro
;; (fkm:unset-kbds lisp-interaction-mode-map
;;                 lisp-interaction-mode-hook
;;                 '("C-M-i" "C-M-x" "C-M-q"))
;;

(fkm:unset-kbds c++-mode-map c++-mode-hook '("C-d" "C-M-a" "C-M-e" "C-;" "C-M-q"))
(fkm:unset-kbds c-mode-map c-mode-hook '("C-d" "C-M-a" "C-M-e" "C-;" "C-M-q"))
(fkm:unset-kbds dired-mode-map dired-mode-hook '("M-s"))
(fkm:unset-kbds eshell-mode-map eshell-mode-hook '("M-p" "M-r" "C-m" "M-s"))
(fkm:unset-kbds helm-mode-map helm-mode-hook '("s-h"))
(fkm:unset-kbds help-mode-map help-mode-hook '("S-SPC"))
(fkm:unset-kbds ido-file-dir-completion-map ido-setup-hook '("M-p" "M-l"))
(fkm:unset-kbds inferior-python-mode-map inferior-python-hook '("M-p" "M-r"))
(fkm:unset-kbds js-mode-map js-mode-hook '("C-M-x" "M-."))
(fkm:unset-kbds js2-mode-map js2-mode-hook '("M-j" "C-c" "<backtab>"))
(fkm:unset-kbds makefile-mode-map makefile-mode-hook '("M-p"))
(fkm:unset-kbds markdown-mode-map markdown-mode-hook '("M-p" "M-n" "C-c" "C-m"))
(fkm:unset-kbds mc/keymap multiple-cursors-mode-hook '("<return>" "M-v"))
(fkm:unset-kbds org-mode-map org-mode-hook '("M-RET" "C-y" "M-h" "C-M-t" "M-e"))
(fkm:unset-kbds python-mode-map python-mode-hook '("C-M-x"))
(fkm:unset-kbds sh-mode-map sh-mode-hook '("C-M-x"))
(fkm:unset-kbds shell-mode-map shell-mode-hook '("M-p" "M-r" "C-d" "C-M-l"))
(fkm:unset-kbds slime-repl-mode-map slime-repl-mode-hook '("M-p" "M-s"))
(fkm:unset-kbds undo-tree-map undo-tree-mode-hook '("C-/"))
(fkm:unset-kbds web-mode-map web-mode-hook '("M-;" "C-c"))

(defun unset-elisp-mode-keys()
  (interactive)
  (define-key lisp-interaction-mode-map (kbd "C-M-i") nil)
  (define-key lisp-interaction-mode-map (kbd "C-M-x") nil)
  (define-key lisp-interaction-mode-map (kbd "C-M-q") nil)
  (define-key emacs-lisp-mode-map (kbd "C-M-i") nil)
  (define-key emacs-lisp-mode-map (kbd "C-M-x") nil)
  (define-key emacs-lisp-mode-map (kbd "C-M-q") nil))
(add-hook 'lisp-interaction-mode-hook 'unset-elisp-mode-keys)


;; TODO: write normal latex unset function (for LaTeX and preview-pane)
;;(defun preview-latex-setup()
;;  ;; (latex-preview-pane-mode 1)
;;  (define-key latex-preview-pane-mode-map (kbd "M-p") nil)
;;  (define-key latex-preview-pane-mode-map (kbd "s-p") nil)
;;  (define-key latex-preview-pane-mode-map (kbd "M-P") nil)
;;  (define-key latex-preview-pane-mode-map (kbd "s-P") nil)
;;  ;; (define-key latex-preview-pane-mode-map (kbd "C-M-a") nil)
;;  (define-key LaTeX-mode-map (kbd "C-M-a") nil)
;;  (latex-preview-update))
;;(add-hook 'LaTeX-mode-hook 'preview-latex-setup)

;; built-in emacs maps
(define-key special-mode-map (kbd "S-SPC") nil)
(define-key package-menu-mode-map (kbd "S-SPC") nil)

;; minibuffer (minibuffer-inactive-mode)
(define-key minibuffer-local-map (kbd "M-s") nil)
(define-key minibuffer-local-map (kbd "M-r") nil)
(define-key minibuffer-local-map (kbd "M-p") nil)

(provide 'fkm:unset-hotkeys)
