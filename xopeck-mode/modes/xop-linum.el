;; load linum just for choosen modes

(require 'linum)
(setq linum-format " %d ")
(global-linum-mode)

(defcustom linum-disabled-modes-list '(dired-mode doc-view-mode org-mode text-mode eshell-mode fundamental-mode) ;; eshell-mode wl-summary-mode compilation-mode org-mode text-mode
  "* List of modes disabled when global linum mode is on"
  :type '(repeat (sexp :tag "Major mode"))
  :tag " Major modes where linum is disabled: "
  :group 'linum
  )
(defcustom linum-disable-starred-buffers 't
  "* Disable buffers that have stars in them like *Gnu Emacs*"
  :type 'boolean
  :group 'linum)

(defun linum-on ()
  "* When linum is running globally, disable line number in modes defined in `linum-disabled-modes-list'. Changed by linum-off. Also turns off numbering in starred modes like *scratch*"

  (unless (or (minibufferp) (member major-mode linum-disabled-modes-list)
              (and linum-disable-starred-buffers (string-match "*" (buffer-name)))
              )
    (linum-mode 1)))

(provide 'xop-linum)
