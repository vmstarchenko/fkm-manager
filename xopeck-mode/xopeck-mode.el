(add-to-list 'load-path "~/.emacs.d/xopeck-mode/modes")
;; (add-to-list 'load-path
;;              (concat (file-name-directory (buffer-file-name (current-buffer)))
;;                      "modes")) ;; doesnt work

;; Моды
(load "xop-modes")
; custom functions
(load "xop-functions")

; custom color-themes
(load "xop-themes")

; custom settings
(load "xop-settings")

; custom hotkeys
(load "xop-hotkeys")

;(require 'xopeck-light-theme)
(require 'xopeck-theme)


