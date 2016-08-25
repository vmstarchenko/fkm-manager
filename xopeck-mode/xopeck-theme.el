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
       (default        `((,class (:background ,default-bg :foreground ,default-fg))))
       (cursor         `((,class (:background ,cursor-bg  :foreground ,cursor-fg ))))
       (hl             `((,class (:background "#000000"   :foreground ,default-fg))))
       (hl-active      `((,class (:background "#000000"   :foreground "#ff4400" :bold t))))
       (hl-info        `((,class (:background "#000000"   :foreground "#a681a6"  ))))
       (hl-warning     `((,class (:background "#000000"   :foreground "#ff8000"  ))))
       (hl-error       `((,class (:background "#000000"   :foreground "#ff0000"  ))))
       (fringe         `((,class (:background ,fringe-bg  :foreground ,fringe-fg ))))
       (fringe-border  `((,class (:background ,fringe-bg  :foreground ,fringe-bg ))))
       (builtin        `((,class (                        :foreground ,builtin-fg :bold t))))
       (fringe-info    `((,class (:background "#a681a6"   :foreground "#a681a6"  ))))
       (fringe-warning `((,class (:background "#ff8000"   :foreground "#000000"  ))))
       (fringe-error   `((,class (:background "#ff0000"   :foreground "#000000"  ))))
       (comment        `((,class (                        :foreground "#ffe500" :italic t ))))
       (comment-symbol `((,class (                        :foreground "#ff0000" :italic nil ))))
       (constant       `((,class (                        :foreground "#cc33ff" :bold t ))))        ;; цвет std в С
       (function-name  `((,class (                        :foreground "#ff6666" :bold t ))))        ;; имена функций
       (keyword        `((,class (                        :foreground "#ff80df" :bold t ))))        ;; ключевые слова
       (negation-char  `((,class (                        :foreground "#ff0000" :bold t ))))        ;; Символ отрицания
       (preprocessor   `((,class (                        :foreground "#ff3333"         ))))        ;; обращение к препроцессору
       (str            `((,class (                        :foreground "#ff8000"         ))))        ;; строковые литералы
       (regexp         str)
       (type           `((,class (                        :foreground "#ff4400"         ))))        ;; другие встроенные функции
       (variable-name  `((,class (                        :foreground "#ffc480" :bold t ))))        ;; переменные

       (directory      `((,class (                        :foreground "#ff8000" :bold t ))))
       (symlink        `((,class (                        :foreground "#008000" :bold t ))))
       (file           `((,class (                        :foreground ,default-fg :bold nil ))))
       (linum          `((,class (                        :foreground ,default-fg :bold nil :italic nil ))))

       (prompt         `((,class (                        :foreground "#ffc0cb" :bold t ))))
       (promptf        `((,class (                        :foreground "#80ffff" :bold t ))))

       (but            `((,class (                        :foreground "#ff6666" :bold t :box t))))

       (dummy          `((,class (:background "#fff000"   :foreground "#000000" :bold t ))))
       (empty          `((,class ())))
       )
  (custom-theme-set-faces
   'xopeck-theme
   ;; `(default ,a)

   `(default                              ,default)        ;; цвет фона и шрифта по умолчанию 303040 403030 304030 :family "DejaVu Sans Mono-11" ecdfff
   `(cursor                               ,cursor)        ;; курсор
   `(highlight                            ,hl)        ;; Фон при подсветке мышки
   `(region                               ,hl)        ;; фон при выделении региона
   `(fringe                               ,fringe)        ;; бортик
   `(button                               ,but)
   `(trailing-whitespace                  ,hl-warning)
   `(tooltip                              ,hl-info)        ;; совет
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
   `(popup-summary-face                   ((,class (:background "#252525" :foreground "#ff8000" :bold t             ))))        ;; Пояснения откуда дока
   `(popup-scroll-bar-background-face     ((,class (:background "#505050"                                           ))))        ;; скроллбар фон
   `(popup-scroll-bar-foreground-face     ((,class (:background "#202020"                                           ))))        ;; скроллбар ползунок
   `(popup-tip-face                       ((,class (:background "#eeeeee" :foreground "#202020"                     ))))        ;; совет,хелп,документация при ac

   ;; aux
   `(minibuffer-prompt                    ,prompt)
   `(linum                                ,linum)        ;; нумерация строк :inherit shadow
   `(bookmark-menu-heading                ((,class (                      :foreground "#80ffff" :bold t             ))))        ;; Заголовок заметок
   `(show-paren-match                     ((,class (:background "#330033"                                           ))))        ;; скобки
   `(highlight-indentation-face           ((,class (:background "#554545"                                           ))))        ;; indentation

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
   `(powerline-active1                    ((,class (:background "#505050" :foreground "#ffffff"                     ))))        ;; modeline активный нецентральный(2)
   `(powerline-active2                    ((,class (:background "#eeeeee" :foreground "#000000"                     ))))        ;; modeline активный центральный(1)
   `(mode-line-inactive                   ,fringe)         ;; modeline неактивный крайний(3)
   `(powerline-inactive1                  ,default)        ;; modeline неактивный нецентральный(2)
   `(powerline-inactive2                  ,default)        ;; modeline неактивный центральный(1)
   `(display-time-face                    ((,class (                                            :bold t             ))))        ;; часы

   ;; emmet
   `(emmet-preview-input                  ((,class (:background "#000000" :foreground "#ff8000" :bold t             ))))        ;; emmet preview input
   `(emmet-preview-output                 ((,class (:background "#000000" :foreground "#ababab" :bold t             ))))        ;; emmet preview output

   ;; org-mode
   `(org-todo                             ((,class (:background "#000000" :foreground "#ff0000" :bold t             ))))        ;; todo
   `(org-canceled                         ((,class (                      :foreground "#cc33ff" :bold t :strike-through t))))   ;; canceled
   `(org-done                             ((,class (                      :foreground "#00ff00" :bold t :strike-through t))))   ;; done
   `(org-checkbox-statistics-todo         ((,class (                      :foreground "#ff8000" :bold t             ))))        ;; checkbox statistic
   `(org-checkbox                         ((,class (                      :foreground "#ffffff" :bold t             ))))        ;; checkbox
   `(org-special-keyword                  ((,class (                      :foreground "#ffffff" :bold t             ))))        ;; ???
   `(org-date                             ((,class (                      :foreground "#ff4400" :bold nil           ))))        ;; date
   `(org-level-1                          ((,class (                      :foreground "#ff6666" :bold t             ))))        ;; levels
   `(org-level-2                          ((,class (                      :foreground "#ffc480" :bold t             ))))        ;; levels
   `(org-level-3                          ((,class (                      :foreground "#ff80df" :bold t             ))))        ;; levels
   `(org-level-4                          ((,class (                      :foreground "#ff8000" :bold t             ))))        ;; levels

   ;; undo-tree
   `(undo-tree-visualizer-default-face       ((,class (                      :foreground "#000000"                  ))))        ;; Face used to draw undo-tree in visualizer.
   `(undo-tree-visualizer-current-face       ((,class (                      :foreground "#ff6666" :bold t          ))))        ;; current undo-tree node in visualizer.
   `(undo-tree-visualizer-active-branch-face ((,class (                      :foreground "#ffffff" :bold nil        ))))        ;; active undo-tree branch in visualizer.
   `(undo-tree-visualizer-register-face      ((,class (:background "#000000" :foreground "#ffffff" :bold t          ))))        ;; undo-tree nodes saved to a register in visualizer.
   `(undo-tree-visualizer-unmodified-face    ,constant)        ;; nodes corresponding to unmodified buffers in visualizer.

   ;; ac
   `(ac-candidate-face                    ((,class (:background "#252525" :foreground "#ff8000" :bold nil           ))))        ;; "Face for candidate."
   `(ac-candidate-mouse-face              ((,class (:background "#000000" :foreground "#ff8000" :bold nil           ))))        ;; "Mouse face for candidate."
   `(ac-completion-face                   ((,class (                      :foreground "#eeeeee"                     ))))        ;; "Face for inline completion"
   `(ac-selection-face                    ((,class (:background "#000000" :foreground "#ff8000" :bold t             ))))        ;; "Face for selected candidate."

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
   `(hideshowvis-hidable-face             ((,class (                      :foreground "#ff8000" :bold t             ))))        ;; hideshow minus in fringe
   `(hs-face                              ((,class (:background "#202020" :foreground "#ffff00" :bold nil :italic t             ))))        ;; hideshow {(n)...} face

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
