;;; Code:
(defgroup tr nil
  "Major mode for editing traslation code."
  :prefix "tr-"
  :group 'languages)

(defvar tr-mode-hook nil)
(defvar tr-mode-map
  (let ((tr-mode-map (make-keymap)))
    tr-mode-map)
  "Keymap for TR major mode")

(add-to-list 'auto-mode-alist '("\\.tr\\'" . tr-mode))

(defconst tr-font-lock-keywords-1
  (list
   '("\\[ *\\(\\(\\w+=\\w*\\)\\( +\\w+=\\w*\\)*\\)* *\\]" . font-lock-variable-name-face)
   '("{" . font-lock-variable-name-face)
   '("}" . font-lock-variable-name-face)
   '(".*" . tr-default-font-face))
  "Minimal highlighting expressions for WPDL mode")

(defvar tr-font-lock-keywords tr-font-lock-keywords-1
  "Default highlighting expressions for TR mode.")

(defun tr-indent-line()
  "Indent current line as TR code."
  (interactive)
  (indent-line-to 0))

(defvar tr-mode-syntax-table
  (let ((tr-mode-syntax-table (make-syntax-table)))
    ;; This is added so entity names with underscores can be more easily parsed
    (modify-syntax-entry ?_ "w" tr-mode-syntax-table)
    ;; Comment styles are same as C++
    (modify-syntax-entry ?/ ". 124b" tr-mode-syntax-table)
    (modify-syntax-entry ?* ". 23" tr-mode-syntax-table)
    (modify-syntax-entry ?\n "> b" tr-mode-syntax-table)
    tr-mode-syntax-table)
  "Syntax table for tr-mode")

(defun setup-tr-mode()
  )

;;;###autoload
(define-derived-mode tr-mode html-mode  "Tr"
  "Major mode for editing tr files"
  :group 'tr
  (set (make-local-variable 'comment-start) "/*")
  (set (make-local-variable 'comment-start-skip) "/*")
  ;; (set (make-local-variable 'comment-end) "*/")
  ;; (set (make-local-variable 'comment-end-skip) "*/")
  (set (make-local-variable 'font-lock-defaults) '(tr-font-lock-keywords))
  )

;;;###autoload
(setup-tr-mode)

(provide 'tr-mode)
;;; tr-mode.el ends here
