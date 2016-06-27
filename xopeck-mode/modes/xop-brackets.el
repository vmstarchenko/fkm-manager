;; brackets

;; functions
(defun electric-pair ()
  "Вставляет скобку и соответствующую ей закрывающую скобку"
  (interactive)
  (if (eolp)
      (let (parens-require-spaces)
	(insert-pair))
    (self-insert-command 1)))

(defun newline-braces ()
  "Вставляет фигурную скобку и соответствующую ей закрывающую скобку.
Для с++ также может сделать отступ для нового блока."
  (interactive)
  (if (eolp)
      (let (parens-require-spaces)
	(progn (insert "{")
	       (newline-and-indent)
	       (save-excursion
		 (newline-and-indent)
		 (insert "}")
		 (indent-for-tab-command))
	       (indent-for-tab-command)))
    (self-insert-command 1)))

(defun insert-brace ()
  "Вставляет открывающую фигурную скобку"
  (interactive)
  (insert "{"))

;; Хуки
(add-hook 'c++-mode-hook
	  (lambda ()
	    (define-key c++-mode-map "\"" 'electric-pair)
	    (define-key c++-mode-map "\'" 'electric-pair)
	    (define-key c++-mode-map "(" 'electric-pair)
	    (define-key c++-mode-map "[" 'electric-pair)
			;; (define-key c++-mode-map "{" 'electric-pair) ;; normal
	    (define-key c++-mode-map "{" 'newline-braces) ;; my
			))
(add-hook 'js-mode-hook
	  (lambda ()
	    (define-key js-mode-map "\"" 'electric-pair)
	    (define-key js-mode-map "\'" 'electric-pair)
	    (define-key js-mode-map "(" 'electric-pair)
	    (define-key js-mode-map "[" 'electric-pair)
			;; (define-key c++-mode-map "{" 'electric-pair) ;; normal
	    (define-key js-mode-map "{" 'newline-braces) ;; my
			))
(add-hook 'java-mode-hook
	  (lambda ()
	    (define-key java-mode-map "\"" 'electric-pair)
	    (define-key java-mode-map "\'" 'electric-pair)
	    (define-key java-mode-map "(" 'electric-pair)
	    (define-key java-mode-map "[" 'electric-pair)
			;; (define-key java-mode-map "{" 'electric-pair) ;; normal
	    (define-key java-mode-map "{" 'newline-braces) ;; my
			))

(provide 'xop-brackets)
