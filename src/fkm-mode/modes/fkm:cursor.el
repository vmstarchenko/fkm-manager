;; (defgroup fkm nil
;;   "Extension of `fkm'."
;;   :prefix "fkm-")

;;;;

(define-minor-mode fkm:cursor
  "docs"
;;  :group 'fkm
  :global t
  :init-value nil
  )
;;;;; cursor
;; (defface english-cursor-color
;;   `((t :background "#00ffff"))
;;   "Cursor face for english input method"
;;   ;;  :group 'fkm
;;   )

;; (defface russion-cursor-color
;;   `((t :background "#98fb98"))
;;   "Cursor face for english input method"
;;   ;;  :group 'fkm
;;   )
(setq english-cursor-color "#00ffff")
(setq russion-cursor-color "#98fb98")

(defvar english-input-method nil "Set english input method")
(defvar russion-input-method 'russian-computer "Set english input method")

(defun shift-input-method()
  (interactive)
  (if (equal current-input-method english-input-method)
      (set-russion-input-method)
    (set-english-input-method)))

(defun set-english-input-method()
  (interactive)
  (set-input-method english-input-method)
  (set-cursor-color english-cursor-color))

(defun set-russion-input-method()
  (interactive)
  (set-input-method russion-input-method)
  (set-cursor-color russion-cursor-color))

;;;###autoload
(progn
	(set-english-input-method))

(provide 'fkm:cursor)
