(setq fkm:kbds-config-header '("Kbd" "Command" "Mode map" "Description"))
(setq
 fkm:kbds-config
 '(("Навигация"
    ("M-i"    previous-line                    nil                        "Вверх на одну строку")
    ("M-k"    next-line                        nil                        "Вниз на строку")
    ("M-j"    backward-char                    nil                        "Назад на один символ")
    ("M-l"    forward-char                     nil                        "Вперёд на один символ")
    ("M-u"    subword-backward                 nil                        "Назад на одно слово")
    ("M-o"    subword-forward                  nil                        "Вперёд на одно слово")
    ("M-y"    beginning-of-line                nil                        "Начало строки")
    ("M-p"    end-of-line                      nil                        "Конец строки")
    ("M-h"    backward-paragraph               nil                        "Начало параграфр")
    ("M-s-j"  ido-prev-match                   ido-common-completion-map  "При открытии и сохранении файла проматать варианты назад (можно ido-file-dir-completion-map?)")
    ("M-;"    forward-paragraph                nil                        "Конец параграфа")
    ("M-s-l"  ido-next-match                   ido-common-completion-map  "При открытии и сохранении файла проматать варианты вперёд")
    ("M-m"    beginning-of-buffer              nil                        "В начало буфера")
    ("M-,"    goto-line                        nil                        "Переход на заданную строку")
    ("M-."    end-of-buffer                    nil                        "В конец буфера")
    ("M-["    bookmark-set                     nil                        "Установить закладку. Полезно при поиске")
    ("M-]"    bookmark-jump                    nil                        "Перейти к закладке")
    ("M-c"    isearch-backward                 nil                        "Поиск назад")
    ("M-v"    isearch-forward                  nil                        "Поиск вперед")
    ("C-c"    isearch-backward-regexp          nil                        "Поиск назад по регулярному выражению")
    ("C-v"    isearch-forward-regexp           nil                        "Поиск вперед по регулярному выражению")
    ("M-s-i"  isearch-repeat-backward          isearch-mode-map           "Повторить поиск назад")
    ("M-s-k"  isearch-repeat-forward           isearch-mode-map           "Повторить поиск вперед")
    ("M-s-i"  helm-previous-line               helm-map                   "up")
    ("M-s-k"  helm-next-line                   helm-map                   "down")
    ("C-g"    helm-keyboard-quit               helm-map                   "exit")
    ("M-a j"  jedi:goto-definition             python-mode-map            "goto defenition")
    ("M-a l"  jedi:goto-definition-pop-marker  python-mode-map            "return from defenition"))

   ("Форматирование"
    ("C-j"    backward-delete-char         nil                        "Удаление символа или отступа перед точкой")
    ("C-j"    ido-delete-backward-updir    ido-common-completion-map  "Удалить предыдущий символ или директорию")
    ("C-j"    isearch-delete-char          isearch-mode-map           "Удаление символа")
    ("C-l"    delete-char                  nil                        "Удаление символа после точки")
    ("C-u"    kb-backward-kill-word        nil                        "Удалить предыдущее слово")
    ("C-o"    kb-kill-word                 nil                        "Удалить следующее слово")
    ("C-y"    kb-backward-kill-line        nil                        "Удалить текст до начала строки")
    ("C-p"    kb-kill-line                 nil                        "Удалить текст до конца строки")
    ("C-h"    kb-backward-kill-paragraph   nil                        "Удалить текст до начала параграфа")
    ("C-;"    kb-kill-paragraph            nil                        "Удалить текст до конца параграфа")
    ("C-m"    kb-kill-beginning-of-buffer  nil                        "Удалить текст до начыала буфера")
    ("C-."    kb-kill-end-of-buffer        nil                        "Удалить текст до конца буфера")
    ("C-,"    delete-horizontal-space      nil                        "Удалить все пробелы и знаки табуляции вокруг точки")
    (""       fill-paragraph               nil                        "Выравнивает текст в текущем параграфе")
    ("M-b"    query-replace                nil                        "Поиск с заменой")
    ("C-b"    replace-regexp               nil                        "Поиск с заменой по регулярному выражению")
    ("C-SPC"  just-one-space               nil                        "Оставляет один пробел"))

   ("Другие операции с текстом"
    ("C-M-q"      quoted-insert                     nil                       "Ввод неклавиатурного символа")
    ("C-M-`"      insert-character                  nil                       "Ввод неклавиатурного символа")
    ("C-M-3"      comment-dwim                      nil                       "Закомментировать/Раскомментировать регион")
    ("C-M-f"      move-region-right                 nil                       "Сдвинуть регион на 1 уровень вправо")
    ("C-M-d"      move-region                       nil                       "Сдвинуть регион на (-)n пробелов")
    ("C-M-s"      move-region-left                  nil                       "Сдвинуть регион на 1 уровень влево")
    ("C-M-t e"    translate-to-english              nil                       "Слово под курсором на английский")
    ("C-M-t r"    translate-to-russian              nil                       "Слово под курсором на русский")
    ("C-M-t t r"  turn-in-russian                   nil                       "Перевести побуквенно регион в русский текст")
    ("C-M-t t e"  turn-in-english                   nil                       "Перевести побуквенно регион в английский текст")
    ("C-M-t q"    google-translate-query-translate  nil                       "Перевести введённый текст")
    ("C-M-["      insert-brace                      nil                       "Вставляет одиночную фигурную скобку (актуально для c++-mode)")
    ("C-M-'"      docs-string                       nil                       "Вставляет заготовку для документации кода")
    ("C-M-'"      fkm:sphinx-update-doc             fkm:sphinx-mode-map       "Вставляет заготовку для документации кода sphinx")
    ("C-M-p f"    switch-flycheck                   python-mode-map           "Включить/выключить flycheck")
    ("C-M-1"      clang-format-auto                 c++-mode-map              "Пересчитать стиль в регионе или во всем буфере")
    ("C-M-1"      clang-format-auto                 c-mode-map                "Пересчитать стиль в регионе или во всем буфере")
    ("C-M-1"      clang-format-auto                 js2-mode-map              "Пересчитать стиль в регионе или во всем буфере")
    ("C-M-1"      pyformat                          python-mode-map           "Пересчитать стиль в регионе или во всем буфере")
    ("C-M-1"      scssformat                        scss-mode-map             "Пересчитать стиль в регионе или во всем буфере")
    ("C-M-1"      fkm:elformat                      emacs-lisp-mode-map       "Пересчитать стиль в регионе или во всем буфере")
    ("C-M-1"      fkm:elformat                      lisp-interaction-mode-map "Пересчитать стиль в регионе или во всем буфере")
    ("C-M-2"      indent                            nil                       "Пересчитать отступы в регионе или во всем буфере")
    ("C-M-a d o"  downcase-word                     nil                       "Перевести следующее в нижний регистр")
    ("C-M-a d r"  downcase-region                   nil                       "Перевести регион в нижний регистр")
    ("C-M-a d u"  downcase-previous-word            nil                       "Перевести предыдущее в нижний регистр")
    ("C-M-a e o"  upcase-word                       nil                       "Перевести следующее слово в верхний регистр")
    ("C-M-a e r"  upcase-region                     nil                       "Перевести регион в верхний регистр")
    ("C-M-a e u"  upcase-previous-word              nil                       "Перевести предыдущее слово в верхний регистр")
    ("C-M-a s"    sort-lines                        nil                       "Отсортировать регион")
    ("C-M-a c"    count-words                       nil                       "Посчитать статистику строк, слов, символов.")
    ("C-M-a v"    occur                             nil                       "Мультипоиск по буферу")
    ("C-M-a b"    iedit-mode                        nil                       "Изменить название переменной в файле")
    ("C-M-a SPC"  delete-trailing-whitespace        nil                       "Удалить конечные пробелы"))

   ("Макросы"
    ("C-M-c"    start-kbd-macro              nil  "Начать запись макроса")
    ("C-M-v"    end-kbd-macro                nil  "Закончтиь запись макроса")
    ("C-M-b"    call-last-kbd-macro          nil  "Вызов последнего макроса")
    ("C-M-z a"  apply-macro-to-region-lines  nil  "Выполнить последний макрос для всех целых строк заданного региона")
    ("C-M-z q"  kbd-macro-query              nil  "Создать запрос о подтверждении")
    ("C-M-z l"  insert-kbd-macro             nil  "Вставить в буфер определение макроса, как код на лиспе")
    ("C-M-z e"  edit-kbd-macro               nil  "Отредактировать ранее определенный макрос")
    ("C-M-z n"  name-last-kbd-macro          nil  "Задать имя для последнего макроса на время текущего сеанса"))

   ("Работа с буфером обмена"
    ("S-SPC"    set-mark-command          nil               "Установить пометку в точке")
    ("M-SPC s"  exchange-point-and-mark   nil               "Поменять местами точку и начало пометки")
    ("M-SPC a"  mark-whole-buffer         nil               "Пометить весь буфер")
    ("M-e"      kill-region               nil               "Удаление выделенной области в список удалений")
    ("M-r"      kill-ring-save            nil               "Копирование выделенной области в список удалений")
    ("C-r"      copy-to-register          nil               "Копировать отмеченный текст в регистр N")
    ("M-t"      yank                      nil               "Вставка текста из списка удалений в текущую позицию")
    ("M-t"      isearch-yank-x-selection  isearch-mode-map  "Вставка текста из списка удалений в текущую позицию")
    ("C-t"      helm-show-kill-ring       nil               "Вставляет в точку содержимое регистра N")
    ("S-C-t"    yank-pop                  nil               "Последовательная вставка текста из списка удалений"))

   ("Работа с буферами"
    ("C-s"    previous-buffer    nil  "Переключиться в предыдущий буфер в текущем окне")
    ("C-f"    next-buffer        nil  "Переключиться в следующий буфер в текущем окне")
    ("C-d f"  helm-buffers-list  nil  "Отобразить список открытых буферов в новом окне")
    ("C-d d"  kill-buffer        nil  "Закрыть буфер")
    ("C-d i"  insert-file        nil  "Вставить содержимое файла в буфер в текущую позицию"))

   ("Работа с окнами"
    ("M-s"      previous-multiframe-window  nil  "Переход в предыдущее окно")
    ("M-f"      other-window                nil  "Переход в следующее окно")
    ("M-d t"    split-window-horizontally   nil  "Разделить окно по вертикали")
    ("M-d r"    split-window-vertically     nil  "Разделить окно по горизонтали")
    ("M-d d"    delete-window               nil  "Закрыть текущее окно (при этом буфер не удаляется)")
    ("M-d a"    delete-other-windows        nil  "Закрыть все окна кроме текущего")
    ("M-d f"    sr-speedbar-toggle          nil  "Навигация по дереву файлов")
    ("M-d s 1"  xscreen                     nil  "Window confuguration 1"))

   ("Работа с файлами"
    ("s-f"  fkm:find-file                  nil  "Открыть файл в проекте или на диске")
    ("s-e"  helm-find-files                nil  "Открыть файл на диске")
    ("s-r"  find-file-read-only            nil  "Открыть файл в режиме чтения")
    ("s-s"  save-buffer                    nil  "Сохранить буфер на диске")
    ("s-q"  rename-file                    nil  "Сохранить буфер в файле с новым именем")
    ("s-w"  helm-projectile-switch-project nil  "Переименовать файл")
    ("s-d"  dired                          nil  "Открыть файловый менеджер")
    ("s-n"  helm-bookmarks                 nil  "Открыть закладки")
    ("s-m"  magit-status                   nil  "Open git status"))

   ("Сниппеты и обертки"
    ("C-M-y"    yas-expand              nil                 "Дополнить")
    ("C-M-h"    yas-exit-snippet        yas-minor-mode-map  "Окончить набор сниппета")
    ("C-M-w w"  emmet-wrap-with-markup  emmet-mode-keymap   "Обернуть в тэг")
    ("C-M-w e"  emmet-expand-line       emmet-mode-keymap   "Дополнить emmet запись")
    ("C-M-w q"  emmet-turn-on-preview   emmet-mode-keymap   "Предпросмотр emmet записи"))

   ("Помощь"
    ("s-h ?"  help-for-help              nil                "Информация об использовании справочной системы")
    ("s-h t"  help-with-tutorial         nil                "Использовать интерактивный учебник")
    ("s-h f"  describe-function          nil                "Показать справку по функции")
    ("s-h t"  describe-text-properties   nil                "Показать параметры текста")
    ("s-h v"  describe-variable          nil                "Показать справку по переменной")
    ("s-h m"  describe-mode              nil                "Показать справку по моду")
    ("s-h k"  describe-key               nil                "Показать данные, о том, что делает последовательность клавиш")
    ("s-h a"  apropos                    nil                "Поиск в справке по строке/регулярному выражению")
    ("s-h e"  view-emacs-FAQ             nil                "Показать Emacs FAQ")
    ("s-h i"  info                       nil                "Показать документацию по Emacs (Info)")
    ("s-h d"  jedi:show-doc              python-mode-map    "Показать Python документацию")
    ("s-h d"  show-c++-docs              c++-mode-map       "Показать документацию по C++ по слову под курсором")
    ("s-h d"  ac-help                    ac-completing-map  "ac-help")
    ("s-h s"  jedi:get-in-function-call  python-mode-map    "show function signature")
    ("s-h h"  fkm:show-hotkeys           nil                "Показать горячие клавиши emacs"))

   ("Дополнительные сочетания"
    ("s-i"         shrink-window                nil                            "Уменьшить окно по вертикали")
    ("s-k"         enlarge-window               nil                            "Увеличить окно по вертикали")
    ("s-j"         shrink-window-horizontally   nil                            "Уменьшить окно по горизонтали")
    ("s-l"         enlarge-window-horizontally  nil                            "Уменьшить окно по горизонтали")
    ("s--"         zoom-                        nil                            "Zoom -")
    ("s-="         zoom+                        nil                            "Zoom +")
    ("C-g"         keyboard-quit                nil                            "Закончить (прервать) текущую операцию")
    ("s-'"         eval-last-sexp               lisp-interaction-mode-map      "Обновить функцию, выполнить (в lisp-mode)")
    ("s-'"         eval-last-sexp               emacs-lisp-mode-map            "Обновить функцию, выполнить (в emacs-lisp-mode)")
    ("s-'"         eval-last-sexp               lisp-mode-map                  "Обновить функцию, выполнить (в lisp-mode)")
    ("s-'"         js-eval                      js-mode-map                    "Обновить функцию, выполнить (в js-mode)")
    ("s-<return>"  shift-input-method           nil                            "Сменить язак")
    ("s-u"         universal-argument           nil                            "Послать аргумент функции")
    ("s-t"         change-truncate-lines        nil                            "Изменить отображение линий")
    ("C-/"         undo-tree-undo               nil                            "Отменить последнюю операцию")
    ("M-/"         undo-tree-redo               nil                            "Вернуть последнюю отмененную операцию")
    ("s-/"         undo-tree-visualize          nil                            "Визуализатор undo-tree")
    ("C-g"         undo-tree-visualizer-quit    undo-tree-visualizer-mode-map  "выход из визуализатора")
    ("M-s-k"       ac-next                      ac-completing-map              "следующая строка в ac")
    ("M-s-i"       ac-previous                  ac-completing-map              "предыдущая строка в ac")
    ("M-s-k"       company-select-next          company-active-map             "следующая строка в ac")
    ("M-s-i"       company-select-previous      company-active-map             "предыдущая строка в ac")
    ("C-g"         company-abort                company-active-map             "предыдущая строка в ac")
    ("<tab>"       ac-start                     nil                            "start show auto completion")
    ("<tab>"       company-complete             shell-mode-map                 "start show auto completion")
    ("<tab>"       minibuffer-complete          minibuffer-local-map           "auto completion in minibuffer")
    ("<tab>"       jedi:complete                python-mode-map                "auto completion for python mode"))

   ("Firefox"
    ("C-M-u"  moz-controller-page-refresh  moz-controller-mode-map  "Обновить страницу"))

   ("Org-mode"
    ("M-="           show-subtree        xorg-mode-map  "показать поддерево")
    ("M--"           hide-subtree        xorg-mode-map  "скрыть поддерево")
    ("C-M-="         show-all            xorg-mode-map  "показать всё")
    ("C-M--"         hide-sublevels      xorg-mode-map  "скрыть всё")
    ("C-M-l"         org-shiftright      xorg-mode-map  "прокрутить todo цикл влево")
    ("C-M-j"         org-shiftleft       xorg-mode-map  "прокрутить todo цикл вправо")
    ("C-M-i"         org-metaup          xorg-mode-map  "передвинуть ветку  на 1 вверх")
    ("C-M-k"         org-metadown        xorg-mode-map  "передвинуть ветку  на 1 вниз")
    ("<C-M-return>"  org-shiftmetaleft   xorg-mode-map  "изменить уровень задания на 1 вверх")
    ("M-RET"         org-shiftmetaleft   xorg-mode-map  "изменить уровень задания на 1 вверх")
    ("C-M-,"         org-meta-return     xorg-mode-map  "новое задание")
    ("C-M-."         org-shiftmetaright  xorg-mode-map  "изменить уровень задания на 1 вниз")
    ("C-M-n c"       org-ctrl-c-ctrl-c   xorg-mode-map  "работать with smth (tag, checkbox)")
    ("C-M-n d"       org-deadline        xorg-mode-map  "set deadline")
    ("C-M-n s"       org-schedule        xorg-mode-map  "set schedule"))

   ("Projectile-mode"
    ("C-M-p v"  projectile-grep     nil  "Поиск по проекту")
    ("C-M-p b"  projectile-replace  nil  "Поиск по проекту"))

   ("Projectile-mode"
    ("C-M-a m"  mc/mark-next-like-this      nil        "x")
    ("M-s-i"    mc/mark-previous-like-this  mc/keymap  "x")
    ("M-s-k"    mc/mark-next-like-this      mc/keymap  "x"))

   ("Hide-show-mode"
    ("M-="    hs-show-block  nil  "показать блок")
    ("M--"    hs-hide-block  nil  "скрыть блок")
    ("C-="    hs-show-all    nil  "показать всё (замена уровню)")
    ("C--"    hs-hide-level  nil  "скрыть уровень")
    ("C-M-="  hs-show-all    nil  "показать всё")
    ("C-M--"  hs-hide-all    nil  "скрыть всё"))

   ("Artist-mode"
    ("C-M-\\ a"    artist-mode                          nil  "Запустить Artist-mode")
    ("C-M-\\ b"    artist-submit-bug-report             nil  "Отправить баг репорт")
    ("C-M-\\ j"    artist-select-op-erase-char          nil  "операция удаления символов")
    ("C-M-\\ C-j"  artist-select-erase-char             nil  "удалить смивол")
    ("C-M-\\ C-f"  artist-select-fill-char              nil  "artist-select-fill-char")
    ("C-M-\\ M-e"  artist-select-op-cut-rectangle       nil  "artist-select-op-cut-rectangle")
    ("C-M-\\ M-y"  artist-select-op-paste               nil  "artist-select-op-paste")
    ("C-M-\\ M-r"  artist-select-op-copy-rectangle      nil  "artist-select-op-copy-rectangle")
    ("C-M-\\ C-l"  artist-select-line-char              nil  "artist-select-line-char")
    ("C-M-\\ o"    artist-select-operation              nil  "artist-select-operation")
    ("C-M-\\ C-r"  artist-toggle-rubber-banding         nil  "artist-toggle-rubber-banding")
    ("C-M-\\ C-s"  artist-toggle-borderless-shapes      nil  "artist-toggle-borderless-shapes")
    ("C-M-\\ C-t"  artist-toggle-trim-line-endings      nil  "artist-toggle-trim-line-endings")
    ("C-M-\\ E"    artist-select-op-erase-rectangle     nil  "artist-select-op-erase-rectangle")
    ("C-M-\\ L"    artist-select-op-straight-line       nil  "artist-select-op-straight-line")
    ("C-M-\\ P"    artist-select-op-straight-poly-line  nil  "artist-select-op-straight-poly-line")
    ("C-M-\\ R"    artist-select-op-square              nil  "artist-select-op-square")
    ("C-M-\\ S"    artist-select-op-spray-can           nil  "artist-select-op-spray-can")
    ("C-M-\\ T"    artist-select-op-text-overwrite      nil  "artist-select-op-text-overwrite")
    ("C-M-\\ V"    artist-select-op-vaporize-lines      nil  "artist-select-op-vaporize-lines")
    ("C-M-\\ c"    artist-select-op-circle              nil  "artist-select-op-circle")
    ("C-M-\\ e"    artist-select-op-ellipse             nil  "artist-select-op-ellipse")
    ("C-M-\\ f"    artist-select-op-flood-fill          nil  "artist-select-op-flood-fill")
    ("C-M-\\ l"    artist-select-op-line                nil  "artist-select-op-line")
    ("C-M-\\ p"    artist-select-op-poly-line           nil  "artist-select-op-poly-line")
    ("C-M-\\ r"    artist-select-op-rectangle           nil  "artist-select-op-rectangle")
    ("C-M-\\ s"    artist-select-op-square              nil  "artist-select-op-square")
    ("C-M-\\ t"    artist-select-op-text-see-thru       nil  "artist-select-op-text-see-thru")
    ("C-M-\\ v"    artist-select-op-vaporize-line       nil  "artist-select-op-vaporize-line")
    ("C-M-\\ z"    artist-select-op-spray-set-size      nil  "artist-select-op-spray-set-size"))

   ("Оболочки"
    ("C-M-x s e"  open-shell                     nil                   "Открывает terminal")
    ("C-M-x s r"  open-shell-in-hwindow          nil                   "Открывает terminal в горизонтальном окне")
    ("C-M-x s t"  open-shell-in-vwindow          nil                   "Открывает terminal в вертикальном окне")
    ("M-s-j"      previous-shell-command         shell-mode-map        "Следующая команда")
    ("M-s-l"      next-shell-command             shell-mode-map        "Предыдующая команда")
    ("M-s-k"      comint-next-prompt             shell-mode-map        "Переместить точку к следующей команде")
    ("M-s-i"      comint-previous-prompt         shell-mode-map        "Переместить точку к предыдущей команде")
    ("C-M-x \\"   comint-quit-subjob             shell-mode-map        "Послать ^\ сигнал")
    ("C-M-x c"    comint-interrupt-subjob        shell-mode-map        "Послать ^c сигнал")
    ("C-M-x d"    comint-delchar-or-maybe-eof    shell-mode-map        "Послать ^d сигнал")
    ("C-M-x d"    eshell-send-eof-to-process     emacs-shell-mode-map  "Послать ^d сигнал")
    ("C-M-x u"    comint-kill-input              shell-mode-map        "Послать ^u сигнал")
    ("C-M-x w"    backward-kill-word             shell-mode-map        "Послать ^w сигнал")
    ("C-M-x z"    comint-stop-subjob             shell-mode-map        "Послать ^z сигнал")
    ("C-M-x e e"  open-eshell                    nil                   "Открывает terminal")
    ("C-M-x e r"  open-eshell-in-hwindow         nil                   "Открывает terminal в горизонтальном окне")
    ("C-M-x e t"  open-eshell-in-vwindow         nil                   "Открывает terminal в вертикальном окне")
    ("<return>"   eshell-send-input              emacs-shell-mode-map  "Выполнить команду")
    ("C-M-x k"    eshell-kill-process            emacs-shell-mode-map  "Убить процесс")
    ("C-M-x c"    eshell-clear                   emacs-shell-mode-map  "очистить вывод")
    ("M-s-j"      eshell-previous-input          emacs-shell-mode-map  "Следующая команда")
    ("M-s-l"      eshell-next-input              emacs-shell-mode-map  "Предыдующая команда")
    ("M-s-k"      eshell-next-prompt             emacs-shell-mode-map  "Переместить точку к следующей команде")
    ("M-s-i"      eshell-previous-prompt         emacs-shell-mode-map  "Переместить точку к предыдущей команде")
    ("<tab>"      pcomplete-expand-and-complete  emacs-shell-mode-map  "дополнение комманды")
    ("C-M-x p e"  open-python-shell              nil                   "Открывает интерактивную оболочку Python")
    ("C-M-x p r"  open-python-shell-in-hwindow   nil                   "Открывает интерактивную оболочку Python в горизонтальном окне")
    ("C-M-x p t"  open-python-shell-in-vwindow   nil                   "Открывает интерактивную оболочку Python в вертикальном окне")
    ("C-M-x m"    python-shell-send-buffer       nil                   "Запустить буффер в интерактивной оболочке Python")
    ("C-M-x n"    python-shell-send-region       nil                   "Запустить регион в интерактивной оболочке Python")
    ("C-M-x u t"  latex-preview-pane-mode        nil                   "Запустить режим отображения latex в горизонтальном окне")
    ("s-'"        latex-preview-pane-update      tex-mode-map          "Обновить отображенный документ"))

   ("Jupyter notebook"
    ("C-M-j l"   ein:notebooklist-login              nil                              "Login")
    ("C-M-j d"   ein:notebooklist-open               nil                              "Открыть")
    ("s-s"       ein:notebook-save-notebook-command  ein:notebook-multilang-mode-map  "Сохранить")
    ("s-'"       ein:worksheet-execute-cell          ein:notebook-multilang-mode-map  "Выполнить ячейку")
    ("C-M-j '"   ein:worksheet-execute-all-cell      ein:notebook-multilang-mode-map  "Выполнить все ячейки")
    ;; ("C-M j p a" ein-preview-latex-everywhere        ein:notebook-multilang-mode-map  "preview all")
    ;; ("C-M j p p" ein-preview-latex-at-point          ein:notebook-multilang-mode-map  "preview at point")
    ;; ("C-M j p g" ein-preview-latex-disable-at-point  ein:notebook-multilang-mode-map  "disable preview at point")
    ("M-;"       ein:worksheet-goto-next-input       ein:notebook-multilang-mode-map  "Следующая клетка")
    ("M-h"       ein:worksheet-goto-prev-input       ein:notebook-multilang-mode-map  "Предыдущая клетка"))

   ("Emacs"
    ("M-x"    helm-M-x                 nil  "выполнить комманду")
    ("s-z"    suspend-frame            nil  "Свернуть Emacs")
    ("s-c"    save-buffers-kill-emacs  nil  "Всё сохранить и выйти из")
    ("s-x"    reload-fkm-mode          nil  "Всё сохранить и выйти из")
    ("s-p"    package-list-packages    nil  "Список пакетов")
    ("C-<f1>" fkm:about-emacs          nil  "Show fkm mode help"))
   ))

(setq fkm:extra-leader-keys '("C-q" "M-q" "C-M-q" "C-w" "M-w" "C-M-w" "C-e" "M-e" "C-M-e" "C-r" "M-r" "C-M-r" "C-t" "M-t" "C-M-t" "C-y" "M-y" "C-M-y" "C-u" "M-u" "C-M-u" "C-i" "M-i" "C-M-i" "C-o" "M-o" "C-M-o" "C-p" "M-p" "C-M-p" "M-[" "C-]" "M-]" "C-M-]" "C-\\" "M-\\" "C-M-\\" "C-a" "M-a" "C-M-a" "C-s" "M-s" "C-M-s" "C-d" "M-d" "C-M-d" "C-f" "M-f" "C-M-f" "C-g" "M-g" "C-M-g" "C-h" "M-h" "C-M-h" "C-j" "M-j" "C-M-j" "C-k" "M-k" "C-M-k" "C-l" "M-l" "C-M-l" "C-;" "M-;" "C-M-;" "C-'" "M-'" "C-M-'" "C-z" "M-z" "C-M-z" "C-x" "C-c" "M-c" "C-M-c" "C-v" "M-v" "C-M-v" "C-b" "M-b" "C-M-b" "C-n" "M-n" "C-M-n" "M-m" "C-," "M-," "C-M-," "C-." "M-." "C-M-." "C-/" "M-/" "C-M-/" "C-{" "M-{" "C-M-{" "C-}" "M-}" "C-M-}" "C-|" "M-|" "C-M-|" "C-:" "M-:" "C-M-:" "C-\"" "M-\"" "C-M-\"" "C->" "M->" "C-M->" "C-?" "M-?" "C-M-?" "C-<" "M-<" "C-M-<" "C-`" "M-`" "C-M-`" "C-~" "M-~" "C-M-~" "C-1" "M-1" "C-M-1" "C-2" "M-2" "C-M-2" "C-3" "M-3" "C-M-3" "C-4" "M-4" "C-M-4" "C-5" "M-5" "C-M-5" "C-6" "M-6" "C-M-6" "C-7" "M-7" "C-M-7" "C-8" "M-8" "C-M-8" "C-9" "M-9" "C-M-9" "C-0" "M-0" "C-M-0" "C--" "M--" "C-M--" "C-=" "M-=" "C-M-=" "C-!" "M-!" "C-M-!" "C-@" "M-@" "C-M-@" "C-#" "M-#" "C-M-#" "C-$" "M-$" "C-M-$" "C-%" "M-%" "C-M-%" "C-^" "M-^" "C-M-^" "C-&" "M-&" "C-M-&" "C-*" "M-*" "C-M-*" "C-(" "M-(" "C-M-(" "C-)" "M-)" "C-M-)" "C-_" "M-_" "C-M-_" "C-+" "M-+" "C-M-+" "C-SPC" "M-SPC"))

(setq fkm:hotkeys-decoded-leader-keys (make-hash-table :size 3 :test 'equal))
(puthash "C-j" [\?C-256] fkm:hotkeys-decoded-leader-keys)
(puthash "C-l" [\?C-257] fkm:hotkeys-decoded-leader-keys)
(puthash "C-m" [\?C-258] fkm:hotkeys-decoded-leader-keys)

(defun fkm:define-input-decode-map(decoded-leader-keys)
  (maphash #'(lambda (key value)
               (define-key input-decode-map (kbd key) value))
           decoded-leader-keys))

(defun fkm:global-unset-keys (leader-keys)
  (dolist (key leader-keys)
    (global-unset-key (kbd key))))

(defun fkm:set-keys (config)
  (dolist (section config)
    (dolist (hotkey section)
      (unless (stringp hotkey)
        (destructuring-bind (key func mode-map comment) hotkey
          (setq key (gethash key
                             fkm:hotkeys-decoded-leader-keys
                             (kbd key)))
          (if (null mode-map)
              (global-set-key key func)
            (define-key (symbol-value mode-map) key func)))))))




(defun fkm:get-kbds-config-table()
  "Build kbds table from fkm:kbds-config list"
  (let* ((table nil))
    (dolist (section fkm:kbds-config)
      (setq table (cons (vector (car section) "" "" "") table))
      (dolist (section-line (cdr section))
        (destructuring-bind (key func mode-map comment) section-line
          (setq mode-map (if (null mode-map) "" (symbol-name mode-map)))
          (setq table (cons (vector key (symbol-name func) mode-map comment)
                            table))))
      (setq table (cons ["" "" "" ""] table)))
    (reverse table)))
;;;

(fkm:global-unset-keys fkm:extra-leader-keys)
(fkm:define-input-decode-map fkm:hotkeys-decoded-leader-keys)
(fkm:set-keys fkm:kbds-config)

(provide 'fkm:hotkeys)
