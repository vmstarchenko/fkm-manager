;; (add-to-list 'load-path "~/.emacs.d/fkm-mode/modes")
;; (add-to-list 'load-path
;;              (concat (file-name-directory (buffer-file-name (current-buffer)))
;;                      "modes")) ;; doesnt work
(setq fkm-path (file-name-directory (locate-library "fkm-mode")))
(add-to-list 'load-path
             (expand-file-name (concat fkm-path "modes")))
(add-to-list 'custom-theme-load-path
             (expand-file-name (concat fkm-path "themes/")))
(setq custom-theme-directory (expand-file-name (concat fkm-path "themes")))

;; Моды
;; 0.8 +
(require 'fkm:modes) ;; 0.2 sec

;; custom functions
(require 'fkm:utils) ;; 0 sec
;; custom color-themes
(require 'fkm:themes) ;; 0.1 sec

;; custom settings
(require 'fkm:settings) ;; 0.1-0.2 sec

;; custom hotkeys
(load "fkm:hotkeys") ;; 0 sec

;; (require 'fkm-light-theme)
;; (require 'fkm-theme) ;; 0.1-0.2 sec
(load-theme 'badwolf t)

(provide 'fkm-mode)
