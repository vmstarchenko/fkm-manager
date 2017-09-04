;;;;  Настройка внешнего вида

;; font
(add-hook 'after-init-hook
          '(lambda()
             (set-face-attribute 'default nil :height 110)
             (set-default-font "DejaVu Sans Mono-11")))
;; (add-hook 'after-init-hook
;;           '(lambda()
;;              (set-face-attribute 'default nil :height 110)
;;              (set-default-font "Noto Sans")))

;; (set-face-attribute 'default nil :height 110)
;; (set-default-font "DejaVu Sans Mono-11")

;; (color-theme-da-normal)
;; (set-english-input-method)
;; (set-face-background 'default "black") same for bg?

;; шрифты
;; (add-to-list 'default-frame-alist '(font . "Courier 10 Pitch"))
;; (set-frame-font
;;     "DejaVu Sans Mono-12")
;; (set-face-attribute 'default nil :height 110)

;; Fonts
;;(set-default-font "Ubuntu Mono-13")           ;; 45,  81
;; (set-default-font "Droid Sans Mono-11")       ;; 45,  81
;; 42,  81
;; (set-default-font "Tlwg Typist")              ;; 40,  81
;;(set-default-font "WenQuanYi Micro Hei Mono") ;; 42,  81
;; (set-default-font "TlwgMono")                 ;; 40.5,81
;; (set-default-font "TlwgTypewriter")           ;; 39,  81
;; (set-default-font "Courier 10 Pitch-13")      ;; 44,  81
;; (set-default-font "Liberation Mono")          ;; 45,  81
;; (set-default-font "Nimbus Mono L")            ;; 45,  81
;; (set-default-font "Courier")                  ;; 45,  81
;; (set-default-font "Tlwg Typo")                ;; 40,  81
;; (set-default-font "FreeMono")                 ;; 55,  81

;; (set-default-font "NotoMono")
;; (set-default-font "clean")
;; (set-default-font "bitstream charter")
;; (set-default-font "Padauk Book")
;; (set-default-font "Century Schoolbook L")
;; (set-default-font "Khmer OS System")
;; (set-default-font "Noto Serif")
;; (set-default-font "Ubuntu")
;; (set-default-font "Meera")
;; (set-default-font "Tibetan Machine Uni")
;; (set-default-font "Umpush")
;; (set-default-font "Purisa")
;; (set-default-font "Norasi")
;; (set-default-font "Loma")
;; (set-default-font "URW Palladio L")
;; (set-default-font "Phetsarath OT")
;; (set-default-font "Sawasdee")
;; (set-default-font "URW Chancery L")
;; (set-default-font "FreeSerif")
;; (set-default-font "Ubuntu Condensed")
;; (set-default-font "DejaVu Sans")
;; (set-default-font "DejaVu Serif")
;; (set-default-font "Kinnari")

(provide 'fkm:themes)
