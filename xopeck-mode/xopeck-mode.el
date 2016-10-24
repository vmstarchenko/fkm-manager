(add-to-list 'load-path "~/.emacs.d/xopeck-mode/modes")
;; (add-to-list 'load-path
;;              (concat (file-name-directory (buffer-file-name (current-buffer)))
;;                      "modes")) ;; doesnt work

;; Моды
(require 'xop-modes)

;; custom functions
(require 'xop-functions)

;; custom color-themes
(require 'xop-themes)

;; custom settings
(require 'xop-settings)

;; custom hotkeys
(load "xop-hotkeys")

;; (require 'xopeck-light-theme)
(require 'xopeck-theme)

(provide 'xopeck-mode)
