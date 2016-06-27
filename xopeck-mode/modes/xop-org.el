(defvar xorg-mode-map (make-sparse-keymap)
	"Keymap for `xorg-mode'.")


(define-minor-mode xorg-mode
  "My first own minor-mode"      ;; docstring
  :group xorg-mode       ;; ?
  :init-value t                  ;; for enable
  :require 'xorg-mode    ;; ?
  :lighter ""                    ;; name in modeline
  nil                            ;; for disable
  :keymap xorg-mode-map  ;; keymap
  )

;; settings
(setq org-todo-keywords '((sequence "TODO" "|" "CANCELED" "DONE"))) ; "POSTPONED"
(defface org-canceled '() "face for canceled in org-mode")
(setq org-todo-keyword-faces
      '(("CANCELED" org-canceled)))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)

(provide 'xop-org)
