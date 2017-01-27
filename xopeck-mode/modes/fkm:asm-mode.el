(defvar fkm:asm-mode-map
  (let ((map (make-sparse-keymap)))
    ;; (define-key map (kbd "SPC") 'tab-to-tab-stop)
    (define-key map (kbd "C-M-2") 'fkm:asm-indent-buffer)
    (define-key map (kbd "RET") 'fkm:newline-and-indent)
    map)
  "Keymap for `fkm:asm-mode'.")

;;;###autoload
(define-derived-mode fkm:asm-mode asm-mode "asm^"
  "A major mode for editing asm files."
  (local-unset-key (vector asm-comment-char))
  (message "hello asm")
  ;; (setq indent-tabs-mode t)
  (setq tab-width 8)
  ;; (setq tab-always-indent (default-value 'tab-always-indent))
  (setq-local indent-line-function 'fkm:asm-indent-line))


;;;;###autoload
(add-to-list 'auto-mode-alist '("\\.S\\'" . fkm:asm-mode))

(defun fkm:newline-and-indent ()
  "Insert \\n and indent line."
  (interactive)
  (insert "\n")
  (fkm:asm-indent-line))

(defun fkm:asm-indent-line ()
  "Auto-indent the current line."
  (interactive)
  (let* ((savep (point))
	 (indent (condition-case nil
		     (save-excursion
		       (forward-line 0)
		       (skip-chars-forward " \t")
		       (if (>= (point) savep) (setq savep nil))
		       (max (fkm:asm-calculate-indentation) 0))
		   (error 0))))
    (if savep
	(save-excursion (indent-line-to indent))
      (indent-line-to indent))))

(defun fkm:asm-calculate-indentation ()
  (or
   ;; Flush labels to the left margin.
   (and (looking-at "\\(\\sw\\|\\s_\\)+:") 0)
   ;; Same thing for `;;;' comments.
   (and (looking-at "\\s<\\s<\\s<") 0)
   ;; Simple `;' comments go to the comment-column.
   (and (looking-at "\\s<\\(\\S<\\|\\'\\)") comment-column)
   ;; The rest goes at the first tab stop.
   (or (indent-next-tab-stop 0))))


(defun fkm:asm-indent-buffer()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (do ((line 0 (+ 1 line))
         (lines-number (- (line-number-at-pos (point-max))
                          1)))
        ((eq line lines-number) 'done)
      (fkm:asm-indent-line)
      (next-line))
    (delete-trailing-whitespace (point-min) (point-max))))

;;; TODO: fix this
(defun setup-fkm:asm-mode()
  (interactive))

(add-hook 'fkm:asm-mode #'setup-fkm:asm-mode)

;;; formater
(defun fkm:asm-parse-string(str)
  (let ((chars (apply #'vector (split-string str "" t)))
        (atoms ())
        cur-atom cur-args
        start end
        (i 0)
        (len (length str)))
    (while (< i len)
      ;; skip spaces
      (setq start (or (string-match "[^ ]" str i)
                      len))
      (setq end (or (string-match "[ (]" str start)
                    len))
      ;; read atom
      ;; read brace in
      (setq cur-atom (cons (substring str start end) nil))
      (setq i end)
      (when (and (< i len)
                 (= (elt str end) ?\())
        (setq cur-args ()))
      (message (car cur-atom))
      (setq atoms (append atoms cur-atom))
      (incf i))
    atoms)
  )

(defun fkm:asm-format-string (start end str)
  (interactive)
  (let ((parsed (fkm:asm-parse-string (substring str start end))))
    parsed))

;; (substring "  asdf  a(s, d), (as)" 0 21)

;; (setq str "  asdf  a(s, d), (as)")
;; (fkm:asm-format-string 0 21 "  asdf  a(s, d), (as)")

(provide 'fkm:asm-mode)
;;; fkm:asm.el ends here
