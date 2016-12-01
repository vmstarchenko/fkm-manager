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

;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)

(provide 'xop-org)
