;;;;  Настройка внешнего вида

;; цвета
(defun orange-theme()
  (interactive)
  (custom-set-faces
   '(default                              ((t (:background "#303030" :foreground "#ecdfff"                     ))))        ;; цвет фона и шрифта по умолчанию 303040 403030 304030 :family "DejaVu Sans Mono-11" ecdfff
   '(cursor                               ((t (:background "#00ffff" :foreground "#000000"                     ))))        ;; курсор
   '(highlight                            ((t (:background "#000000"                       :bold t             ))))        ;; Фон при подсветке мышки
   '(region                               ((t (:background "#000000"                       :bold t             ))))        ;; фон при выделении региона
   '(fringe                               ((t (:background "#000000" :foreground "#ecdfff"                     ))))        ;; бортик
   '(button                               ((t (                      :foreground "#80ffff" :bold t :underline nil ))))     ;; кнопки по умолчанию
   '(trailing-whitespace                  ((t (:background "#ff0000"                       :bold t             ))))        ;; нелегальные пробелы в конце строки
   '(tooltip                              ((t (:background "#ecdfff" :foreground "#000000"                     ))))        ;; совет
   '(lazy-highlight                       ((t (:background "#ecdfff" :foreground "#000000"                     ))))        ;; подсветить найденные части
   '(vertical-border                      ((t (                      :foreground "#000000"                     ))))        ;; вертикальный бордер на границе буферов
   '(match                                ((t (:background "#000000" :foreground "#ff4400" :bold t             ))))        ;; подсветить текущую найденную

   ;; isearch
   '(isearch                              ((t (:background "#000000" :foreground "#ff4400" :bold t             ))))        ;; подсветить текущую найденную
   '(isearch-fail                         ((t (:background "#000000" :foreground "#ff0000"                     ))))        ;; подсветить зафейленую часть

   ;; default
   '(font-lock-builtin-face               ((t (                      :foreground "#ff80df" :bold t             ))))        ;; цвет встроенных  функций
   '(font-lock-comment-delimiter-face     ((t (:foreground "#ff0000"                       :bold t             ))))        ;; Разделитель комментария
   '(font-lock-comment-face               ((t (                      :foreground "#ffe500" :italic t           ))))        ;; цвет комментария
   '(font-lock-constant-face              ((t (                      :foreground "#cc33ff" :bold t             ))))        ;; цвет std в С
   '(font-lock-doc-face                   ((t (                      :foreground "#ffe500"                     ))))        ;; Строка документации
   '(font-lock-doc-string-face            ((t (:background "#000000" :foreground "#ffffff"                     ))))        ;; ???
   '(font-lock-function-name-face         ((t (                      :foreground "#ff6666" :bold t             ))))        ;; имена функций
   '(font-lock-keyword-face               ((t (                      :foreground "#ff80df" :bold t             ))))        ;; ключевые слова
   '(font-lock-negation-char-face         ((t (                      :foreground "#ff0000" :bold t             ))))        ;; Символ отрицания
   '(font-lock-preprocessor-face          ((t (                      :foreground "#ff3333"                     ))))        ;; обращение к препроцессору
   '(font-lock-reference-face             ((t (:background "#000000" :foreground "#ffffff"                     ))))        ;; ???
   '(font-lock-string-face                ((t (                      :foreground "#ff8000"                     ))))        ;; строковые литералы
   '(font-lock-type-face                  ((t (                      :foreground "#ff4400"                     ))))        ;; другие встроенные функции
   '(font-lock-variable-name-face         ((t (                      :foreground "#ffc480" :bold t             ))))        ;; переменные
   '(font-lock-warning-face               ((t (:background "#000000" :foreground "#ffffff"                     ))))        ;; ???

   ;; popup - окно автодополнения
   '(popup-face                           ((t (:background "#ff0000" :foreground "#ff0000"                     ))))        ;; ???
   '(popup-isearch-match                  ((t (:background "#00ff00" :foreground "#00ff00"                     ))))        ;; ???
   '(popup-menu-face                      ((t (:background "#0000ff" :foreground "#0000ff"                     ))))        ;; ???
   '(popup-menu-mouse-face                ((t (:background "#00ffff" :foreground "#00ffff"                     ))))        ;; ???
   '(popup-menu-selection-face            ((t (:background "#ffff00" :foreground "#ffff00"                     ))))        ;; ???
   '(popup-summary-face                   ((t (:background "#252525" :foreground "#ff8000" :bold t             ))))        ;; Пояснения откуда дока
   '(popup-scroll-bar-background-face     ((t (:background "#505050"                                           ))))        ;; скроллбар фон
   '(popup-scroll-bar-foreground-face     ((t (:background "#202020"                                           ))))        ;; скроллбар ползунок
   '(popup-menu-summary-face              ((t (:background "#ff80ff" :foreground "#ff80ff"                     ))))        ;; ???
   '(popup-tip-face                       ((t (:background "#eeeeee" :foreground "#202020"                     ))))        ;; совет,хелп,документация при ac

   ;; aux
   '(minibuffer-prompt                    ((t (                      :foreground "#80ff80" :bold t             ))))        ;; надпись в минибуфере
   '(linum                                ((t (:background "#303030" :foreground "#afafaf" :bold   nil         ))))        ;; нумерация строк :inherit shadow
   '(bookmark-menu-heading                ((t (                      :foreground "#80ffff" :bold t             ))))        ;; Заголовок заметок
   '(show-paren-match                     ((t (:background "#330033"                                           ))))        ;; скобки
   '(highlight-indentation-face           ((t (:background "#554545"                                           ))))        ;; indentation

   ;; eshell
   '(eshell-prompt                        ((t (                      :foreground "#ffc0cb" :bold t             ))))        ;; Приглашение в eshell
   '(eshell-ls-directory                  ((t (                      :foreground "#ff8000" :bold t             ))))        ;; Папка в eshell
   '(comint-highlight-prompt              ((t (                      :foreground "#80ffff" :bold t             ))))        ;; надпись в shell-е

   ;; dired
   '(dired-directory                      ((t (                      :foreground "#ff8000" :bold t             ))))        ;; Папка
   '(dired-header                         ((t (                      :foreground "#80ffff" :bold t             ))))        ;; Путь в диспетчере задач
   '(dired-flagged                        ((t (:background "#000000" :foreground "#ffffff"                     ))))
   '(dired-ignored                        ((t (                      :foreground "#ffffff" :bold t             ))))        ;; Временные файлы?
   '(dired-mark                           ((t (:background "#ffd700" :foreground "#000000" :bold t             ))))        ;; Пометка
   '(dired-marked                         ((t (                      :foreground "#ff0000" :bold t             ))))        ;; Помеченый файл
   '(dired-perm-write                     ((t (:background "#000000" :foreground "#ffffff"                     ))))
   '(dired-symlink                        ((t (:background "#000000" :foreground "#ffffff"                     ))))
   '(dired-warning                        ((t (:background "#000000" :foreground "#ffffff"                     ))))

   ;; speedbar
   '(speedbar-button-face                 ((t (                      :foreground "#ff6666" :bold nil           ))))        ;; цвет кнопок +-
   '(speedbar-directory-face              ((t (                      :foreground "#ff8000" :bold t             ))))        ;; Папка в списке директорий
   '(speedbar-file-face                   ((t (                      :foreground "#ecdfff" :bold nil           ))))        ;; Файлы в списке директорий
   '(speedbar-highlight-face              ((t (:background "#000000" :foreground "#ffffff" :bold t :italic nil ))))        ;; цвет функции при переходе на неё из "функций в файлах"
   '(speedbar-selected-face               ((t (                      :foreground "#cc33ff" :bold t             ))))        ;; Текущий файл в списке директорий
   '(speedbar-separator-face              ((t (:background "#000000" :foreground "#ffffff" :overline "gray"    ))))
   '(speedbar-tag-face                    ((t (                      :foreground "#ffff00" :bold nil :italic t ))))        ;; цвет функций в файлах

   ;; ido
   '(ido-subdir                           ((t (                      :foreground "#ff8000" :bold t             ))))        ;; Папки в альтернативе
   '(ido-first-match                      ((t (                      :foreground "#ffffff" :bold t             ))))        ;; first match.
   '(ido-only-match                       ((t (:background "#000000" :foreground "#ffffff"                     ))))        ;; only match.
   '(ido-indicator                        ((t (:background "#000000" :foreground "#ffffff"                     ))))        ;; its indicators (don't actually use this)
   '(ido-incomplete-regexp                ((t (:background "#000000" :foreground "#ffffff"                     ))))        ;; Ido face for indicating incomplete regexps. (don't use this eithe…

   ;; flycheck
   '(flycheck-info                        ((t (:background "#202020"                                           ))))        ;; flycheck информация
   '(flycheck-warning                     ((t (:background "#202020"                                           ))))        ;; flycheck предупреждение
   '(flycheck-error                       ((t (:background "#202020"                                           ))))        ;; flycheck ошибка
   '(flycheck-fringe-info                 ((t (:background "#a681a6" :foreground "#a681a6"                     ))))        ;; flycheck информация на бортике
   '(flycheck-fringe-warning              ((t (:background "#ff8000" :foreground "#000000"                     ))))        ;; flycheck предупреждение на бортике
   '(flycheck-fringe-error                ((t (:background "#ff0000" :foreground "#000000"                     ))))        ;; flycheck ошибка на бортике

   ;; latex
   '(font-latex-doctex-documentation-face ((t (                      :foreground "#ffff00" :bold t             ))))        ;; ???
   '(font-latex-doctex-preprocessor-face  ((t (                      :foreground "#ffff00" :bold t             ))))        ;; ???
   '(font-latex-math-face                 ((t (                      :foreground "#ff8000"                     ))))        ;; latex между $ and $
   '(font-latex-italic-face               ((t (                      :foreground "#ecdfff" :italic t           ))))        ;; ???
   '(font-latex-bold-face                 ((t (                      :foreground "#ecdfff" :bold t             ))))        ;; ???
   '(font-latex-sedate-face               ((t (                      :foreground "#ecdfff" :bold t             ))))        ;; latex maketitle (some commands)
   '(font-latex-sectioning-0-face         ((t (                      :foreground "#ecdfff"                     ))))        ;; ???
   '(font-latex-sectioning-1-face         ((t (                      :foreground "#ecdfff"                     ))))        ;; ???
   '(font-latex-sectioning-2-face         ((t (                      :foreground "#ecdfff"                     ))))        ;; ???
   '(font-latex-sectioning-3-face         ((t (                      :foreground "#ecdfff"                     ))))        ;; ???
   '(font-latex-sectioning-4-face         ((t (                      :foreground "#ecdfff"                     ))))        ;; ???
   '(font-latex-sectioning-5-face         ((t (                      :foreground "#ecdfff"                     ))))        ;; ???
   '(font-latex-slide-title-face          ((t (                      :foreground "#ffe5ff"                     ))))        ;; ???
   '(font-latex-string-face               ((t (                      :foreground "#ffe5ff"                     ))))        ;; ???
   '(font-latex-subscript-face            ((t (                      :foreground "#ffe5ff"                     ))))        ;; ???
   '(font-latex-superscript-face          ((t (                      :foreground "#ffe5ff"                     ))))        ;; ???
   '(font-latex-verbatim-face             ((t (                      :foreground "#ffe5ff" :bold t             ))))        ;; ???
   '(font-latex-warning-face              ((t (                      :foreground "#ff0000" :bold t             ))))        ;; ???

   ;; modeline
   '(mode-line                            ((t (:background "#000000" :foreground "#ffffff" :box nil            ))))        ;; modeline активный крайний(3)
   '(powerline-active1                    ((t (:background "#505050" :foreground "#ffffff"                     ))))        ;; modeline активный нецентральный(2)
   '(powerline-active2                    ((t (:background "#eeeeee" :foreground "#000000"                     ))))        ;; modeline активный центральный(1)
   '(mode-line-inactive                   ((t (:background "#000000" :foreground "#ffffff" :box nil            ))))        ;; modeline неактивный крайний(3)
   '(powerline-inactive1                  ((t (:background "#303030" :foreground "#ffffff"                     ))))        ;; modeline неактивный нецентральный(2)
   '(powerline-inactive2                  ((t (:background "#252525" :foreground "#ffffff"                     ))))        ;; modeline неактивный центральный(1)
   '(display-time-face                    ((t (                                            :bold t             ))))        ;; часы

   ;; emmet
   '(emmet-preview-input                  ((t (:background "#000000" :foreground "#ff8000" :bold t             ))))        ;; emmet preview input
   '(emmet-preview-output                 ((t (:background "#000000" :foreground "#ababab" :bold t             ))))        ;; emmet preview output

   ;; org-mode
   '(org-todo                             ((t (:background "#000000" :foreground "#ff0000" :bold t             ))))        ;; todo
   '(org-canceled                         ((t (                      :foreground "#cc33ff" :bold t :strike-through t))))   ;; canceled
   '(org-done                             ((t (                      :foreground "#00ff00" :bold t :strike-through t))))   ;; done
   '(org-checkbox-statistics-todo         ((t (                      :foreground "#ff8000" :bold t             ))))        ;; checkbox statistic
   '(org-checkbox                         ((t (                      :foreground "#ffffff" :bold t             ))))        ;; checkbox
   '(org-special-keyword                  ((t (                      :foreground "#ffffff" :bold t             ))))        ;; ???
   '(org-date                             ((t (                      :foreground "#ff4400" :bold nil           ))))        ;; date
   '(org-level-1                          ((t (                      :foreground "#ff6666" :bold t             ))))        ;; levels
   '(org-level-2                          ((t (                      :foreground "#ffc480" :bold t             ))))        ;; levels
   '(org-level-3                          ((t (                      :foreground "#ff80df" :bold t             ))))        ;; levels
   '(org-level-4                          ((t (                      :foreground "#ff8000" :bold t             ))))        ;; levels

   ;; undo-tree
   '(undo-tree-visualizer-default-face       ((t (                      :foreground "#000000"                  ))))        ;; Face used to draw undo-tree in visualizer.
   '(undo-tree-visualizer-current-face       ((t (                      :foreground "#ff6666" :bold t          ))))        ;; current undo-tree node in visualizer.
   '(undo-tree-visualizer-active-branch-face ((t (                      :foreground "#ffffff" :bold nil        ))))        ;; active undo-tree branch in visualizer.
   '(undo-tree-visualizer-register-face      ((t (:background "#000000" :foreground "#ffffff" :bold t          ))))        ;; undo-tree nodes saved to a register in visualizer.
   '(undo-tree-visualizer-unmodified-face    ((t (                      :foreground "#cc33ff" :bold t          ))))        ;; nodes corresponding to unmodified buffers in visualizer.

   ;; ac
   '(ac-candidate-face                    ((t (:background "#252525" :foreground "#ff8000" :bold nil           ))))        ;; "Face for candidate."
   '(ac-candidate-mouse-face              ((t (:background "#000000" :foreground "#ff8000" :bold nil           ))))        ;; "Mouse face for candidate."
   '(ac-completion-face                   ((t (                      :foreground "#eeeeee"                     ))))        ;; "Face for inline completion"
   '(ac-selection-face                    ((t (:background "#000000" :foreground "#ff8000" :bold t             ))))        ;; "Face for selected candidate."

   ;; hide show
   '(hs-fringe-face                       ((t (                      :foreground "#ff8000" :bold t             ))))        ;; hideshow plus in fringe
   '(hideshowvis-hidable-face             ((t (                      :foreground "#ff8000" :bold t             ))))        ;; hideshow minus in fringe
   '(hs-face                              ((t (:background "#202020" :foreground "#ffff00" :bold nil :italic t             ))))        ;; hideshow {(n)...} face

   ;; tr
   '(tr-default-font-face                 default)        ;; hideshow {(n)...} face

   ;; variables
   '(variable-pitch ((t (:height 0.9)))) ;; height

   ;;    '(whitespace-space            ((t (:background "#0000ff" :bold t))))
   ;;    '(whitespace-indentation      ((t (:foreground "#000000" :bold t))))
   ;;    '(whitespace-newline          ((t (:foreground "#000000" :bold nil :italic nil))))
   ;;    '(whitespace-tab              ((t (:background "#fff":foreground "#000000" :bold t))))
   ;;    '(whitespace-hspace           ((t (:foreground "#0000ff"))))
   ;;    '(whitespace-line             ((t (:bold t))))
   ;;    '(whitespace-space-before-tab ((t (:foreground "#ff00ff"))))
   ;;    '(whitespace-empty            ((t (:foreground "#00ff00"))))
   ;;    '(whitespace-space-after-tab  ((t (:background "#ff0000":foreground "#000000")))) ;пробел после таба
   ;;    '(whitespace-trailing         ((t (:background "#ff0000":foreground "#000000" :bold t)))) ; лишние пробелы в конце строки

   ))

(defun python-green-theme()
  (interactive)
  (custom-set-faces
   '(default ((t (:background "#00291d" :foreground "#f8f8f8"))))
   '(cursor ((t (:foreground "#336442"))))
   '(region ((t (:foreground "#f8f8f8" :background "#245032"))))
   '(highlight ((t (:background "#245032"))))
   '(match ((t (:background "#96dd3b" :foreground "#000000"))))
   '(fringe ((t (:background "#001a10"))))
   '(linum ((t (:background "#001a10" :foreground "#245032"))))
   '(vertical-border ((t (:foreground "#001a10"))))
   '(lazy-highlight ((t (:background "#497958" :foreground "#f8f8f8"))))
   '(ido-first-match ((t (:foreground "#ffc557"))))
   '(ido-subdir ((t (:foreground "#3b7c55"))))
   '(hl-line ((t (:background "#001a10"))))
   '(flycheck-error    ((t (:foreground "#002116" :background "#ff6800" :weight bold :underline nil))))
   '(flycheck-warning  ((t (:foreground "#002116" :background "#084eb9" :weight bold :underline nil))))
   '(flymake-errline  ((t (:foreground "#002116" :background "#ff6800" :weight bold :underline nil))))
   '(flymake-warnline ((t (:foreground "#002116" :background "#084eb9" :weight bold :underline nil))))
   '(minibuffer-prompt ((t (:foreground "#f8f8f8" :weight bold))))
   '(font-lock-builtin-face ((t (:foreground "#96dd3b"))))
   '(font-lock-comment-face ((t (:slant italic :foreground "#245032"))))
   '(font-lock-constant-face ((t (:foreground "#497958"))))
   '(font-lock-function-name-face ((t (:foreground "#fec758"))))
   '(font-lock-keyword-face ((t (:foreground "#96dd3b"))))
   '(font-lock-string-face ((t (:foreground "#91bb9e"))))
   '(font-lock-type-face ((t (:foreground "#ead47a"))))
   '(font-lock-variable-name-face ((t (:foreground "#497958"))))
   '(font-lock-warning-face ((t (:foreground "#ff6800" :weight bold))))
   '(font-lock-doc-string-face ((t (:foreground "#91bb9e"))))
   '(font-lock-preprocessor-face ((t (:foreground "#497958"))))
   '(link ((t (:underline t :foreground "#245032"))))
   '(link-visited ((t (:underline t :foreground "#245032"))))
   '(button ((t (:underline t))))
   '(dired-directory ((t (:foreground "#245032"))))
   '(dired-header ((t (:foreground "#91bb9e"))))
   '(nxml-attribute-local-name ((t (:foreground "#497958"))))
   '(nxml-element-local-name ((t (:foreground "#497958"))))
   '(nxml-tag-delimiter ((t (:foreground "#497958"))))
   '(nxml-prolog-keyword ((t (:foreground "#497958"))))
   '(nxml-markup-declaration-delimiter ((t (:foreground "#497958"))))
   '(mumamo-border-face-in ((t (:italic nil :underline nil :foreground "#497958"))))
   '(mumamo-border-face-out ((t (:italic nil :underline nil :foreground "#497958"))))
   '(mumamo-background-chunk-major ((t (:background "#002116"))))
   '(mumamo-background-chunk-submode1 ((t (:background "#002116"))))
   '(whitespace-space ((t (:background "#002116" :slant italic :foreground "#001a10"))))
   '(whitespace-hspace ((t (:background "#002116" :slant italic :foreground "#001a10"))))
   '(whitespace-tab ((t (:background "#002116" :slant italic :foreground "#001a10"))))
   '(whitespace-newline ((t (:background "#002116" :slant italic :foreground "#001a10"))))
   '(whitespace-trailing ((t (:background "#ff6800" :slant italic :foreground "#001a10"))))
   '(whitespace-line ((t (:background "#001a10" :slant italic :foreground "#ff6800"))))
   '(whitespace-space-before-tab ((t (:background "#ff6800" :slant italic :foreground "#001a10"))))
   '(whitespace-indentation ((t (:background "#ff6800" :slant italic :foreground "#001a10"))))
   '(whitespace-empty ((t (:background "#ff6800" :slant italic :foreground "#001a10"))))
   '(whitespace-space-after-tab ((t (:background "#ff6800" :slant italic :foreground "#001a10"))))
   '(magit-section-title ((t (:background "#002116" :foreground "#497958" :box nil))))
   '(magit-item-highlight ((t (:background nil :foreground nil :inherit nil))))
   '(magit-branch ((t (:background "#002116" :foreground "#497958" :box nil))))
   '(magit-diff-add ((t (:foreground "#f8f8f8" :background "#084eb9" :weight bold :underline nil))))
   '(magit-diff-del ((t (:foreground "#f8f8f8" :background "#ff6800" :weight bold :underline nil))))
   '(magit-diff-none ((t (:foreground "#497958" :background "#002116" :inherit nil))))
   '(header-line ((t (:background "#1c482b" :foreground "#000000" :box nil))))
   '(sp-show-pair-match-face ((t (:background "#1c482b" :box nil))))
   '(sp-pair-overlay-face ((t (:background "#1c482b" :box nil))))
   '(compilation-info ((t (:foreground "#91bb9e"))))
   '(anzu-mode-line ((t (:foreground "#91bb9e"))))
   '(which-func ((t (:foreground "#91bb9e"))))
   ))

(orange-theme)

;; шрифты
;;     "DejaVu Sans Mono-12")
(set-face-attribute 'default nil :height 110)


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
(set-default-font "DejaVu Sans Mono-11")      ;; 42,  81
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

;; (set-default-font "fixed")
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

;; (deftheme moe-dark
;;   "Face colors for 256 colors terminal (dark background).
;; Moe, moe, kyun!")

;; (let ((class '((class color) (min-colors 89)))
;;       ;; Palette colors.
;;       (yellow-1 "#fce94f") (yellow-2 "#ffd700") (yellow-3 "#c4a000") (yellow-3-5 "#aaaa11") (yellow-4 "#875f00")
;;       (orange-1 "#ffaf5f") (orange-2 "#ff8700") (orange-3 "#ff5d17") (orange-4 "#d75f00") (orange-5 "#af5f00")
;;       (magenta-1 "#ff7bbb") (magenta-2 "#ff4ea3") (magenta-3 "#ff1f8b")
;;       (green-1 "#afff00") (green-2 "#a1db00") (green-3 "#5faf00") (green-4 "#008700") (green-5 "#005f00")
;;       (cyan-1 "#87ffff") (cyan-2 "#87d7af") (cyan-3 "#00d7af") (cyan-4 "#00ac8a") (cyan-5 "#5faf87") (cyan-6 "#005f5f") (cyan-7 "#236f73")
;;       (blue-1 "#5fafd7") (blue-2 "#1f5bff") (blue-3 "#005f87") (blue-4 "#005faf") (blue-5 "#0000af") (blue-6 "#00005f")
;;       (purple-1 "#d18aff") (purple-2 "#af5fff") (purple-3 "#9a08ff") (purple-4 "#6c0099")
;;       (red-1 "#ef2929")  (red-2 "#dd0000")  (red-3 "#a40000") (red-4 "#5f0000")
;;       (white-1 "#c6c6c6") (white-2 "#c6c6c6") (white-3 "#b2b2b2") (black-1 "#a8a8a8") (black-2 "#8a8a8a")
;;       (black-2-5 "#6c6c6c") (black-3 "#4e4e4e") (black-4 "#3a3a3a") (black-5 "#303030") (black-6 "#000000")
;;       (LIGHT_BG "#fdfde7") (white-0 "#ffffff")
;;       (green-02 "#5fd700") (green-01 "#d7ff00") (green-0 "#d7ff5f") (green-00 "#d7ff87")
;;       (cyan-0 "#d7ffd7")
;;       (blue-01 "#c3c9f8") (blue-0 "#afd7ff") (blue-00 "#d7d7ff")
;;       (yellow-0 "#ffff87") (yellow-00 "#ffffaf")
;;       (purple-0 "#af87ff") (purple-00 "#e6a8df")
;;       (red-0 "#ff4b4b") (red-00 "#ffafaf")
;;       (magenta-0 "#ffafd7") (magenta-00 "#ffd7ff")
;;       (orange-0 "#ffaf87") (orange-00 "#ffd787") (orange-000 "#ffd7af")
;;       (linum-dark "#87875f") (linum-light "#d7d7af")
;;       )

;;   (custom-theme-set-faces
;;    'moe-dark
;;    ;; Ensure sufficient contrast on low-color terminals.
;;    `(default ((((class color) (min-colors 4096))
;; 	       (:foreground ,white-1 :background ,black-5))
;; 	      (((class color) (min-colors 256))
;; 	       (:foreground ,white-1 :background ,black-5))
;; 	      (,class
;; 	       (:foreground ,white-1 :background ,black-5))))
;;    `(cursor ((,class (:background ,white-1))))

;;    ;; Highlighting faces
;;    `(fringe ((,class (:foreground ,black-1 :background ,black-3))))
;;    `(linum ((,class (:foreground ,white-3 :background ,black-3))))
;;    `(linum-highlight-face ((,class (:background ,green-0 :foreground ,black-4))))
;;    `(highlight ((,class (:background ,black-3))))
;;    `(hl-line ((,class (:background ,black-3))))
;;    `(highlight-symbol-face ((,class (:background ,black-3))))
;;    `(region ((,class (:foreground ,black-3 :background ,green-0))))
;;    `(secondary-selection ((,class (:background ,blue-3 :foreground ,white-0))))
;;    `(isearch ((,class (:foreground ,white-1 :background ,orange-3))))
;;    `(lazy-highlight ((,class (:background ,magenta-3 :foreground ,white-1))))
;;    `(trailing-whitespace ((,class (:background ,red-3))))
;;    `(show-paren-match ((,class (:background ,blue-3 :foreground nil))))
;;    `(header-line ((,class (:background ,blue-3 :foreground ,white-0))))
;;    `(help-argument-name ((,class (:foreground ,magenta-1 :italic t))))

;;    ;; Mode line & frames' faces

;;    ;; ;; Escape and prompt faces
;;    ;; `(minibuffer-prompt ((,class (:foreground ,black-3 :background ,green-2))))
;;    ;; `(escape-glyph ((,class (:foreground ,yellow-3))))
;;    ;; `(error ((,class (:foreground ,red-0))))
;;    ;; `(warning ((,class (:foreground ,orange-1))))
;;    ;; `(success ((,class (:foreground ,green-1))))

;;    ;; ;; Font lock faces
;;    ;; `(font-lock-builtin-face ((,class (:foreground ,purple-1))))
;;    ;; `(font-lock-comment-delimiter-face ((,class (:foreground ,black-2-5 :slant italic))))
;;    ;; `(font-lock-comment-face ((,class (:foreground ,black-2-5 :slant italic))))
;;    ;; `(font-lock-constant-face ((,class (:foreground ,blue-1))))
;;    ;; `(font-lock-doc-face ((,class (:foreground ,red-0))))
;;    ;; `(font-lock-doc-string-face ((,class (:foreground ,yellow-3))))
;;    ;; `(font-lock-function-name-face ((,class (:foreground ,yellow-2))))
;;    ;; `(font-lock-keyword-face ((,class (:foreground ,green-2))))
;;    ;; `(font-lock-negation-char-face ((,class (:foreground ,red-0))))
;;    ;; `(font-lock-preprocessor-face ((,class (:foreground ,purple-1))))
;;    ;; `(font-lock-regexp-grouping-backslash ((,class (:foreground ,yellow-1))))
;;    ;; `(font-lock-regexp-grouping-construct ((,class (:foreground ,purple-1))))
;;    ;; `(font-lock-string-face ((,class (:foreground ,magenta-2))))
;;    ;; `(font-lock-type-face ((,class (:foreground ,cyan-3))))
;;    ;; `(font-lock-variable-name-face ((,class (:foreground ,orange-2))))
;;    ;; `(font-lock-warning-face ((,class (:weight bold :foreground ,red-2))))

;;    ;; Completions
;;    `(completions-annotations ((,class (:foreground ,green-2))))
;;    `(completions-common-part ((,class (:foreground ,black-2-5))))
;;    `(completions-first-difference ((,class (:weight bold :foreground ,orange-2))))
;; ;;; stop
;;    ;; Custom
;;    `(custom-button ((,class (:background ,blue-0 :foreground ,blue-3
;; 					 :box (:line-width 1 :style released-button)))))
;;    `(custom-button-mouse ((,class (:background ,blue-00 :foreground ,black-3
;; 					       :box (:line-width 1 :style released-button)))))
;;    `(custom-button-pressed ((,class (:foreground ,black-3 :background ,white-1
;; 						 :box (:line-width 1 :style pressed-button)))))
;;    ;; Hydra
;;    `(hydra-face-red ((,class (:foreground ,red-0))))
;;    `(hydra-face-blue ((,class (:foreground ,blue-1))))
;;    `(hydra-face-amaranth ((,class (:foreground ,magenta-2)))))
;;   (custom-theme-set-variables
;;    'moe-dark
;;    `(ansi-color-names-vector [,black-5 ,red-0 ,green-0 ,yellow-1
;;                                        ,blue-1 ,purple-1 ,blue-0 ,white-1]))
;;   )

;; ;; fix wrong default face under GUI version Emacs
;; (if window-system
;;     (progn
;;       (set-background-color "#303030")
;;       (set-foreground-color "#c6c6c6")))

;; (setq moe-theme-which-enabled 'dark)

;; (provide-theme 'moe-dark)

;; (face-list)
