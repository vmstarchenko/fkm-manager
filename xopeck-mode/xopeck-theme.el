;;; xopeck-theme.el --- Dark low contrast theme with soft and muted colors.

;;; Code:

(deftheme xopeck-theme)
(let* ((class '((class color) (min-colors 89)))
       ;; colors
       (default-bg "#303030")
       (default-fg "#ecdfff")
       (cursor-bg  "#00ffff")
       (cursor-fg  "#000000")
       (fringe-bg  "#000000")
       (fringe-fg default-fg)

       (builtin-fg "#ff80df")

       ;; faces
       (default          `((,class (:background ,default-bg :foreground ,default-fg))))
       (default2         `((,class (:background "#252525"   :foreground "#ff8000"))))
       (cursor           `((,class (:background ,cursor-bg  :foreground ,cursor-fg ))))
       (default-active   `((,class (                        :foreground ,builtin-fg))))
       (default-inactive `((,class (                        :foreground "#000000"  ))))
       (hl               `((,class (:background "#000000"   :foreground ,default-fg))))
       (hl-active        `((,class (:background "#000000"   :foreground "#ff4400" :bold t))))
       (hl-info          `((,class (:background "#000000"   :foreground "#a681a6"  ))))
       (hl-warning       `((,class (:background "#000000"   :foreground "#ff8000"  ))))
       (hl-error         `((,class (:background "#000000"   :foreground "#ff0000"  ))))
       (fringe           `((,class (:background ,fringe-bg  :foreground ,fringe-fg ))))
       (fringe-border    `((,class (:background ,fringe-bg  :foreground ,fringe-bg ))))
       (builtin          `((,class (                        :foreground ,builtin-fg :bold t))))
       (fringe-info      `((,class (:background "#a681a6"   :foreground ,fringe-bg ))))
       (fringe-warning   `((,class (:background "#ff8000"   :foreground ,fringe-bg ))))
       (fringe-error     `((,class (:background "#ff0000"   :foreground ,fringe-bg ))))
       (comment          `((,class (                        :foreground "#ffe500" :italic t ))))
       (comment-symbol   `((,class (                        :foreground "#ff0000" :italic nil ))))
       (constant         `((,class (                        :foreground "#cc33ff" :bold t ))))        ;; цвет std в С
       (function-name    `((,class (                        :foreground "#ff6666" :bold t ))))        ;; имена функций
       (keyword          `((,class (                        :foreground "#ff80df" :bold t ))))        ;; ключевые слова
       (negation-char    `((,class (                        :foreground "#ff0000" :bold t ))))        ;; Символ отрицания
       (preprocessor     `((,class (                        :foreground "#ff3333"         ))))        ;; обращение к препроцессору
       (str              `((,class (                        :foreground "#ff8000"         ))))        ;; строковые литералы
       (regexp           str)
       (type             `((,class (                        :foreground "#ff4400"         ))))        ;; другие встроенные функции
       (variable-name    `((,class (                        :foreground "#ffc480" :bold t ))))        ;; переменные
       (tip              `((,class (:background "#eeeeee"   :foreground "#202020"         ))))        ;; совет,хелп,документация

       (directory        `((,class (                        :foreground "#ff8000" :bold t ))))
       (symlink          `((,class (                        :foreground "#008000" :bold t ))))
       (file             `((,class (                        :foreground ,default-fg :bold nil ))))
       (linum            `((,class (                        :foreground ,default-fg :bold nil :italic nil ))))
       (header           `((,class (                        :foreground "#ff4400" ))))

       (prompt           `((,class (                        :foreground "#ffc0cb" :bold t ))))
       (promptf          `((,class (                        :foreground "#80ffff" :bold t ))))

       (but              `((,class (                        :foreground "#ff6666" :bold t :box t))))

       (dummy            `((,class (:background "#fff000"   :foreground "#000000" :bold t ))))
       (empty            `((,class ())))
       )
  (custom-theme-set-faces
   'xopeck-theme
   `(default                              ,default)        ;; цвет фона и шрифта по умолчанию 303040 403030 304030 :family "DejaVu Sans Mono-11" ecdfff
   `(cursor                               ,cursor)        ;; курсор
   `(highlight                            ,hl)        ;; Фон при подсветке мышки
   `(region                               ,hl)        ;; фон при выделении региона
   `(fringe                               ,fringe)        ;; бортик
   `(button                               ,but)
   `(trailing-whitespace                  ,hl-warning)
   `(tooltip                              ,tip)        ;; совет
   `(lazy-highlight                       ,hl)        ;; подсветить найденные части
   `(vertical-border                      ,fringe-border)        ;; вертикальный бордер на границе буферов
   `(match                                ,hl-active)        ;; подсветить текущую найденную

   ;; isearch
   `(isearch                              ,hl-active)        ;; подсветить текущую найденную
   `(isearch-fail                         ,hl-error)        ;; подсветить зафейленую часть

   ;; default
   `(font-lock-builtin-face               ,builtin)        ;; цвет встроенных  функций
   `(font-lock-comment-delimiter-face     ,comment-symbol)        ;; Разделитель комментария
   `(font-lock-comment-face               ,comment)        ;; цвет комментария
   `(font-lock-constant-face              ,constant)        ;; цвет std в С
   `(font-lock-doc-face                   ,comment)        ;; Строка документации
   `(font-lock-doc-string-face            ,dummy)        ;; ???
   `(font-lock-function-name-face         ,function-name)        ;; имена функций
   `(font-lock-keyword-face               ,keyword)        ;; ключевые слова
   `(font-lock-negation-char-face         ,negation-char)        ;; Символ отрицания
   `(font-lock-preprocessor-face          ,preprocessor)        ;; обращение к препроцессору
   `(font-lock-string-face                ,str)        ;; строковые литералы
   `(font-lock-type-face                  ,type)        ;; другие встроенные функции
   `(font-lock-variable-name-face         ,variable-name)        ;; переменные
   `(font-lock-warning-face               ,dummy)        ;; ???

   ;; popup - окно автодополнения
   `(popup-summary-face                   ,default2)        ;; Пояснения откуда дока
   `(popup-scroll-bar-background-face     ,default)        ;; скроллбар фон
   `(popup-scroll-bar-foreground-face     ,default2)        ;; скроллбар ползунок
   `(popup-tip-face                       ,tip)        ;; совет,хелп,документация при ac

   ;; aux
   `(minibuffer-prompt                    ,prompt)
   `(linum                                ,linum)        ;; нумерация строк :inherit shadow
   `(bookmark-menu-heading                ,header)        ;; Заголовок заметок
   `(show-paren-match                     ,hl-active)        ;; скобки

   ;; eshell
   `(eshell-prompt                        ,prompt)
   `(eshell-ls-directory                  ,directory)
   `(comint-highlight-prompt              ,promptf)

   ;; dired
   `(dired-directory                      ,directory)
   `(dired-header                         ,directory)        ;; Путь в диспетчере задач
   `(dired-mark                           ,hl)
   `(dired-marked                         ,hl-warning)
   `(dired-symlink                        ,symlink)
   `(dired-warning                        ,dummy)

   ;; speedbar
   `(speedbar-button-face                 ,but)        ;; цвет кнопок +-
   `(speedbar-directory-face              ,directory)        ;; Папка в списке директорий
   `(speedbar-file-face                   ,file)
   `(speedbar-highlight-face              ,hl)        ;; цвет функции при переходе на неё из "функций в файлах"
   `(speedbar-selected-face               ,hl-active)        ;; Текущий файл в списке директорий
   `(speedbar-tag-face                    ,function-name)        ;; цвет функций в файлах

   ;; ido
   `(ido-subdir                           ,directory)        ;; Папки в альтернативе
   `(ido-first-match                      ,hl-active)
   `(ido-only-match                       ,hl)        ;; only match.

   ;; flycheck
   `(flycheck-info                        ,hl-info)        ;; flycheck информация
   `(flycheck-warning                     ,hl-warning)        ;; flycheck предупреждение
   `(flycheck-error                       ,hl-error)        ;; flycheck ошибка
   `(flycheck-fringe-info                 ,fringe-info)        ;; flycheck информация на бортике
   `(flycheck-fringe-warning              ,fringe-warning)        ;; flycheck предупреждение на бортике
   `(flycheck-fringe-error                ,fringe-error)        ;; flycheck ошибка на бортике

   ;; modeline
   `(mode-line                            ,fringe)        ;; modeline активный крайний(3)
   `(powerline-active1                    ,default2)        ;; modeline активный нецентральный(2)
   `(powerline-active2                    ,hl-active)        ;; modeline активный центральный(1)
   `(mode-line-inactive                   ,fringe)         ;; modeline неактивный крайний(3)
   `(powerline-inactive1                  ,default)        ;; modeline неактивный нецентральный(2)
   `(powerline-inactive2                  ,default)        ;; modeline неактивный центральный(1)
   `(display-time-face                    ,empty)        ;; часы

   ;; emmet
   `(emmet-preview-input                  ,hl-active)        ;; emmet preview input
   `(emmet-preview-output                 ,default2)        ;; emmet preview output

   ;; undo-tree
   `(undo-tree-visualizer-default-face       ,default-inactive)        ;; current undo-tree node in visualizer.
   `(undo-tree-visualizer-current-face       ,variable-name)        ;; current undo-tree node in visualizer.
   `(undo-tree-visualizer-active-branch-face ,default-active)        ;; active undo-tree branch in visualizer.
   `(undo-tree-visualizer-unmodified-face    ,constant)        ;; nodes corresponding to unmodified buffers in visualizer.

   ;; ac
   `(ac-candidate-face                    ,default2)        ;; "Face for candidate."
   `(ac-candidate-mouse-face              ,hl-active)        ;; "Mouse face for candidate."
   `(ac-completion-face                   ,default2)        ;; "Face for inline completion"
   `(ac-selection-face                    ,hl-active)        ;; "Face for selected candidate."

   ;; js2-mode
   `(js2-function-param                   ,variable-name)       ;; переменные
   `(js2-warning                          ,empty)
   `(js2-error                            ,empty)
   `(js2-external-variable                ,hl-warning)
   `(js2-jsdoc-tag                        ,function-name)
   `(js2-jsdoc-type                       ,type)
   `(js2-jsdoc-value                      ,variable-name)

   ;; hide show
   `(hs-fringe-face                       ,fringe-info)        ;; hideshow plus in fringe
   `(hideshowvis-hidable-face             ,fringe-info)        ;; hideshow minus in fringe
   `(hs-face                              ,hl)        ;; hideshow {(n)...} face

   ;; tr
   `(tr-default-font-face                 default)        ;; hideshow {(n)...} face

   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'xopeck-theme)
(provide 'xopeck-theme)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; xopeck-theme.el ends here
