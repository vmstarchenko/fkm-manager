(defvar fkm:asm-mode-map
  (let ((map (make-sparse-keymap)))
    ;; (define-key map (kbd "SPC") 'tab-to-tab-stop)
    (define-key map (kbd "C-M-2") 'fkm:asm-indent-buffer)
    map)
  "Keymap for `fkm:asm-mode'.")

;;;###autoload
(define-derived-mode fkm:asm-mode asm-mode "asm^"
  "A major mode for editing asm files."
  (local-unset-key (vector asm-comment-char))
  (message "hello asm")
  ;; (setq indent-tabs-mode t)
  ;; (setq tab-width 6)
  ;; (setq tab-always-indent (default-value 'tab-always-indent))
  (setq-local indent-line-function 'asm-indent-line))

;;;;###autoload
;; (add-to-list 'auto-mode-alist '("\\.S\\'" . fkm:asm-mode))

(defun fkm:asm-indent-buffer()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (do ((line 0 (+ 1 line))
         (lines-number (- (line-number-at-pos (point-max))
                          1)))
        ((eq line lines-number) 'done)
      (asm-indent-line)
      (next-line))
    (delete-trailing-whitespace (point-min) (point-max))))

;;; TODO: fix this
(defun setup-fkm:asm-mode()
  (interactive))

(add-hook 'fkm:asm-mode #'setup-fkm:asm-mode)

(provide 'fkm:asm-mode)
;;; fkm:asm.el ends here
