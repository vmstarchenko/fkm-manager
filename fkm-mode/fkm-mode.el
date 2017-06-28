;; set paths
(setq fkm:fkm-path (file-name-directory (locate-library "fkm-mode")))
(setq fkm:themes-directory (expand-file-name (concat fkm:fkm-path "themes/")))
(setq fkm:modes-directory (expand-file-name (concat fkm:fkm-path "modes/")))

(add-to-list 'load-path fkm:modes-directory)
(add-to-list 'custom-theme-load-path fkm:themes-directory)

;; Load modes
;; 0.8 +
(require 'fkm:utils) ;; 0 sec
(require 'fkm:modes) ;; 0.2 sec

;; custom functions
;; custom color-themes
(require 'fkm:themes) ;; 0.1 sec

;; custom settings
(require 'fkm:settings) ;; 0.1-0.2 sec

(require 'fkm:unset-hotkeys)
;; custom hotkeys
(require 'fkm:hotkeys) ;; 0 sec

;; (require 'fkm-theme) ;; 0.1-0.2 sec
(load-theme 'badwolf t)


(provide 'fkm-mode)
