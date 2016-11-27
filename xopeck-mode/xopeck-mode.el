;; (add-to-list 'load-path "~/.emacs.d/xopeck-mode/modes")
;; (add-to-list 'load-path
;;              (concat (file-name-directory (buffer-file-name (current-buffer)))
;;                      "modes")) ;; doesnt work
(add-to-list 'load-path (expand-file-name (concat (file-name-directory
                                                   (locate-library
                                                    "xopeck-mode"))
                                                  ;; or (file-truename "xopeck-mode")
                                                  "/modes")))

;; Моды
;; 0.8 +
(require 'xop-modes) ;; 0.2 sec

;; custom functions
(require 'xop-functions) ;; 0 sec
;; custom color-themes
(require 'xop-themes) ;; 0.1 sec

;; custom settings
(require 'xop-settings) ;; 0.1-0.2 sec

;; custom hotkeys
(load "xop-hotkeys") ;; 0 sec

;; (require 'xopeck-light-theme)
(require 'xopeck-theme) ;; 0.1-0.2 sec

(provide 'xopeck-mode)
