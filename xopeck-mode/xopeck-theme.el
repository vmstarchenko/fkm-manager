;;; xopeck-theme.el --- Dark low contrast theme with soft and muted colors.

;;; Code:

(deftheme xopeck-theme)
(let*
    ((class '((class color) (min-colors 89)))
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
     (hl-success       `((,class (:background "#000000"   :foreground "#80ff00"  ))))
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
     (link-face        `((,class (                        :foreground "#008000" :bold t ))))
     (file             `((,class (                        :foreground ,default-fg :bold nil ))))
     (linum            `((,class (:background ,default-bg :foreground ,default-fg :bold nil :italic nil ))))
     (header           `((,class (                        :foreground "#ff4400" ))))

     (prompt           `((,class (                        :foreground "#ffc0cb" :bold t ))))
     (promptf          `((,class (                        :foreground "#80ffff" :bold t ))))

     (but              `((,class (                        :foreground "#ff6666" :bold t :box t))))

     (dummy            `((,class (:background "#fff000"   :foreground "#000000" :bold t ))))
     (empty            `((,class ()))))
  (custom-theme-set-faces
   'xopeck-theme
   ;; Ensure sufficient contrast on low-color terminals.
   `(cursor  ,cursor ) ;; курсор
   `(default ,default) ;; цвет фона и шрифта по умолчанию 303040 403030 304030 :family "DejaVu Sans Mono-11" ecdfff

   ;; Highlighting faces
   `(fringe                ,fringe    ) ;; бортик
   `(header-line           ,header    )
   `(help-argument-name    ,builtin   )
   `(highlight             ,hl        ) ;; Фон при подсветке мышки
   `(highlight-symbol-face ,dummy     )
   `(hl-line               ,dummy     )
   `(isearch               ,hl-active ) ;; подсветить текущую найденную
   `(lazy-highlight        ,hl        ) ;; подсветить найденные части
   `(linum                 ,linum     ) ;; нумерация строк :inherit shadow
   `(linum-highlight-face  ,dummy     )
   `(region                ,hl        ) ;; фон при выделении региона
   `(secondary-selection   ,dummy     )
   `(show-paren-match      ,hl-active ) ;; скобки
   `(trailing-whitespace   ,hl-warning)

   ;; Mode line & frames' faces
   `(mode-line           ,fringe       ) ;; modeline активный крайний(3)
   `(mode-line-buffer-id ,dummy        )
   `(mode-line-inactive  ,fringe       ) ;; modeline неактивный крайний(3)
   `(vertical-border     ,fringe-border) ;; вертикальный бордер на границе буферов

   ;; Escape and prompt faces
   `(error             ,hl-error)
   `(escape-glyph      ,constant) ;; symbols like 
   `(minibuffer-prompt ,prompt  )
   `(success           ,hl-success)
   `(warning           ,hl-warning)

   ;; Ace-jump
   `(ace-jump-face-background ,dummy)
   `(ace-jump-face-foreground ,dummy)

   ;; Button and link faces
   `(link         ,link-face)
   `(link-visited ,link-face)

   ;; CPerl
   `(cperl-array-face          ,dummy)
   `(cperl-hash-face           ,dummy)
   `(cperl-nonoverridable-face ,dummy)

   ;; CUA
   `(cua-rectangle ,dummy)

   ;; Clojure/Cider
   `(cider-deprecated-face     ,dummy)
   `(clojure-test-error-face   ,dummy)
   `(clojure-test-failure-face ,dummy)
   `(clojure-test-success-face ,dummy)

   ;; Column marker
   `(column-marker-1 ,dummy)
   `(column-marker-2 ,dummy)
   `(column-marker-3 ,dummy)

   ;; Comint prompt
   `(comint-highlight-prompt ,promptf)

   ;; Completions
   `(completions-annotations      ,dummy)
   `(completions-common-part      ,hl)
   `(completions-first-difference ,hl-active)

   ;; Custom
   `(custom-button         ,dummy)
   `(custom-button-mouse   ,dummy)
   `(custom-button-pressed ,dummy)

   ;; Diff
   `(diff-added             ,dummy)
   `(diff-changed           ,dummy)
   `(diff-context           ,dummy)
   `(diff-file-header       ,dummy)
   `(diff-function          ,dummy)
   `(diff-header            ,dummy)
   `(diff-hunk-header       ,dummy)
   `(diff-index             ,dummy)
   `(diff-indicator-added   ,dummy)
   `(diff-indicator-changed ,dummy)
   `(diff-indicator-removed ,dummy)
   `(diff-nonexistent       ,dummy)
   `(diff-refine-added      ,dummy)
   `(diff-refine-change     ,dummy)
   `(diff-refine-removed    ,dummy)
   `(diff-removed           ,dummy)

   ;; Dired/Dired+
   `(dired-directory               ,directory )
   `(dired-flagged                 ,hl-active )
   `(dired-header                  ,directory ) ;; Путь в диспетчере задач
   `(dired-ignored                 ,dummy     )
   `(dired-mark                    ,hl        )
   `(dired-marked                  ,hl-warning)
   `(dired-perm-write              ,empty     )
   `(dired-symlink                 ,symlink   )
   `(dired-warning                 ,dummy     )
   `(diredp-compressed-file-suffix ,dummy     )
   `(diredp-date-time              ,dummy     )
   `(diredp-deletion               ,dummy     )
   `(diredp-deletion-file-name     ,dummy     )
   `(diredp-dir-heading            ,dummy     )
   `(diredp-dir-priv               ,dummy     )
   `(diredp-display-msg            ,dummy     )
   `(diredp-exec-priv              ,dummy     )
   `(diredp-executable-tag         ,dummy     )
   `(diredp-file-name              ,dummy     )
   `(diredp-file-suffix            ,dummy     )
   `(diredp-flag-mark              ,dummy     )
   `(diredp-flag-mark-line         ,dummy     )
   `(diredp-ignored-file-name      ,dummy     )
   `(diredp-link-priv              ,dummy     )
   `(diredp-mode-line-flagged      ,dummy     )
   `(diredp-mode-line-marked       ,dummy     )
   `(diredp-no-priv                ,dummy     )
   `(diredp-number                 ,dummy     )
   `(diredp-other-priv             ,dummy     )
   `(diredp-rare-priv              ,dummy     )
   `(diredp-read-priv              ,dummy     )
   `(diredp-symlink                ,dummy     )
   `(diredp-write-priv             ,dummy     )

   ;; EMMS
   `(emms-playlist-selected-face     ,dummy)
   `(emms-playlist-track-face        ,dummy)
   `(emms-state-current-playing-time ,dummy)
   `(emms-state-total-playing-time   ,dummy)

   ;; ERC
   `(erc-button            ,dummy)
   `(erc-current-nick-face ,dummy)
   `(erc-dangerous-hosts   ,dummy)
   `(erc-direct-msg-face   ,dummy)
   `(erc-error-face        ,dummy)
   `(erc-header-face       ,dummy)
   `(erc-input-face        ,dummy)
   `(erc-keyword-face      ,dummy)
   `(erc-my-nick-face      ,dummy)
   `(erc-nick-default-face ,dummy)
   `(erc-nick-msg-face     ,dummy)
   `(erc-notice-face       ,dummy)
   `(erc-pal-face          ,dummy)
   `(erc-prompt-face       ,dummy)
   `(erc-timestamp-face    ,dummy)

   ;; EShell
   `(eshell-ls-archive    ,dummy    )
   `(eshell-ls-backup     ,dummy    )
   `(eshell-ls-clutter    ,dummy    )
   `(eshell-ls-directory  ,directory)
   `(eshell-ls-executable ,dummy    )
   `(eshell-ls-missing    ,dummy    )
   `(eshell-ls-product    ,dummy    )
   `(eshell-ls-readonly   ,dummy    )
   `(eshell-ls-special    ,dummy    )
   `(eshell-ls-symlink    ,dummy    )
   `(eshell-ls-unreadable ,dummy    )
   `(eshell-prompt        ,prompt   )

   ;; Ediff
   `(ediff-current-diff-A        ,dummy)
   `(ediff-current-diff-Ancestor ,dummy)
   `(ediff-current-diff-B        ,dummy)
   `(ediff-current-diff-C        ,dummy)
   `(ediff-even-diff-A           ,dummy)
   `(ediff-even-diff-Ancestor    ,dummy)
   `(ediff-even-diff-B           ,dummy)
   `(ediff-even-diff-C           ,dummy)
   `(ediff-fine-diff-A           ,dummy)
   `(ediff-fine-diff-Ancestor    ,dummy)
   `(ediff-fine-diff-B           ,dummy)
   `(ediff-fine-diff-C           ,dummy)
   `(ediff-odd-diff-A            ,dummy)
   `(ediff-odd-diff-Ancestor     ,dummy)
   `(ediff-odd-diff-B            ,dummy)
   `(ediff-odd-diff-C            ,dummy)

   ;; Flycheck
   `(flycheck-error    ,hl-error) ;; flycheck ошибка
   `(flycheck-warnline ,dummy   )

   ;; Flymake
   `(flymake-errline  ,dummy)
   `(flymake-warnline ,dummy)

   ;; Flyspell faces
   `(flyspell-duplicate ,dummy)
   `(flyspell-incorrect ,dummy)

   ;; Font lock faces
   `(font-lock-builtin-face              ,builtin       ) ;; цвет встроенных  функций
   `(font-lock-comment-delimiter-face    ,comment-symbol) ;; Разделитель комментария
   `(font-lock-comment-face              ,comment       ) ;; цвет комментария
   `(font-lock-constant-face             ,constant      ) ;; цвет std в С
   `(font-lock-doc-face                  ,comment       ) ;; Строка документации
   `(font-lock-doc-string-face           ,dummy         ) ;; ???
   `(font-lock-function-name-face        ,function-name ) ;; имена функций
   `(font-lock-keyword-face              ,keyword       ) ;; ключевые слова
   `(font-lock-negation-char-face        ,negation-char ) ;; Символ отрицания
   `(font-lock-preprocessor-face         ,preprocessor  ) ;; обращение к препроцессору
   `(font-lock-regexp-grouping-backslash ,builtin       )
   `(font-lock-regexp-grouping-construct ,constant      )
   `(font-lock-string-face               ,str           ) ;; строковые литералы
   `(font-lock-type-face                 ,type          ) ;; другие встроенные функции
   `(font-lock-variable-name-face        ,variable-name ) ;; переменные
   `(font-lock-warning-face              ,hl-warning    ) ;; autoload word color(from ;;;###autoload)

   ;; Gnus
   `(gnus-button                      ,dummy)
   `(gnus-cite-1                      ,dummy)
   `(gnus-cite-10                     ,dummy)
   `(gnus-cite-11                     ,dummy)
   `(gnus-cite-2                      ,dummy)
   `(gnus-cite-3                      ,dummy)
   `(gnus-cite-4                      ,dummy)
   `(gnus-cite-5                      ,dummy)
   `(gnus-cite-6                      ,dummy)
   `(gnus-cite-7                      ,dummy)
   `(gnus-cite-8                      ,dummy)
   `(gnus-cite-9                      ,dummy)
   `(gnus-emphasis-highlight-words    ,dummy)
   `(gnus-group-mail-1                ,dummy)
   `(gnus-group-mail-1-empty          ,dummy)
   `(gnus-group-mail-1-low            ,dummy)
   `(gnus-group-mail-2                ,dummy)
   `(gnus-group-mail-2-empty          ,dummy)
   `(gnus-group-mail-2-low            ,dummy)
   `(gnus-group-mail-3                ,dummy)
   `(gnus-group-mail-3-empty          ,dummy)
   `(gnus-group-mail-3-low            ,dummy)
   `(gnus-group-mail-low              ,dummy)
   `(gnus-group-mail-low-empty        ,dummy)
   `(gnus-group-news-1                ,dummy)
   `(gnus-group-news-1-empty          ,dummy)
   `(gnus-group-news-1-low            ,dummy)
   `(gnus-group-news-2                ,dummy)
   `(gnus-group-news-2-empty          ,dummy)
   `(gnus-group-news-2-low            ,dummy)
   `(gnus-group-news-3                ,dummy)
   `(gnus-group-news-3-empty          ,dummy)
   `(gnus-group-news-3-low            ,dummy)
   `(gnus-group-news-4                ,dummy)
   `(gnus-group-news-4-empty          ,dummy)
   `(gnus-group-news-4-low            ,dummy)
   `(gnus-group-news-5                ,dummy)
   `(gnus-group-news-5-empty          ,dummy)
   `(gnus-group-news-5-low            ,dummy)
   `(gnus-group-news-6                ,dummy)
   `(gnus-group-news-6-empty          ,dummy)
   `(gnus-group-news-6-low            ,dummy)
   `(gnus-group-news-low              ,dummy)
   `(gnus-group-news-low-empty        ,dummy)
   `(gnus-header-content              ,dummy)
   `(gnus-header-from                 ,dummy)
   `(gnus-header-name                 ,dummy)
   `(gnus-header-newsgroups           ,dummy)
   `(gnus-header-subject              ,dummy)
   `(gnus-server-agent                ,dummy)
   `(gnus-server-closed               ,dummy)
   `(gnus-server-denied               ,dummy)
   `(gnus-server-offline              ,dummy)
   `(gnus-server-opened               ,dummy)
   `(gnus-signature                   ,dummy)
   `(gnus-splash                      ,dummy)
   `(gnus-summary-cancelled           ,dummy)
   `(gnus-summary-high-ancient        ,dummy)
   `(gnus-summary-high-read           ,dummy)
   `(gnus-summary-high-ticked         ,dummy)
   `(gnus-summary-high-undownloaded   ,dummy)
   `(gnus-summary-high-unread         ,dummy)
   `(gnus-summary-low-ancient         ,dummy)
   `(gnus-summary-low-read            ,dummy)
   `(gnus-summary-low-ticked          ,dummy)
   `(gnus-summary-low-undownloaded    ,dummy)
   `(gnus-summary-low-unread          ,dummy)
   `(gnus-summary-normal-ancient      ,dummy)
   `(gnus-summary-normal-read         ,dummy)
   `(gnus-summary-normal-ticked       ,dummy)
   `(gnus-summary-normal-undownloaded ,dummy)
   `(gnus-summary-normal-unread       ,dummy)
   `(gnus-summary-selected            ,dummy)

   ;; Grep
   `(grep-context-face ,dummy)
   `(grep-error-face   ,dummy)
   `(grep-hit-face     ,dummy)
   `(grep-match-face   ,dummy)

   ;; Haskell
   `(haskell-interactive-face-compile-error   ,dummy)
   `(haskell-interactive-face-compile-warning ,dummy)
   `(haskell-interactive-face-garbage         ,dummy)
   `(haskell-interactive-face-prompt          ,dummy)
   `(haskell-interactive-face-result          ,dummy)

   ;; Helm
   `(helm-bookmark-directory   ,dummy)
   `(helm-bookmark-file        ,dummy)
   `(helm-bookmark-info        ,dummy)
   `(helm-buffer-directory     ,dummy)
   `(helm-buffer-process       ,dummy)
   `(helm-buffer-saved-out     ,dummy)
   `(helm-buffer-size          ,dummy)
   `(helm-candidate-number     ,dummy)
   `(helm-ff-directory         ,dummy)
   `(helm-ff-excutable         ,dummy)
   `(helm-ff-file              ,dummy)
   `(helm-ff-invalid-symlink   ,dummy)
   `(helm-ff-prefix            ,dummy)
   `(helm-grep-cmd-line        ,dummy)
   `(helm-grep-file            ,dummy)
   `(helm-grep-finish          ,dummy)
   `(helm-grep-lineno          ,dummy)
   `(helm-grep-match           ,dummy)
   `(helm-grep-running         ,dummy)
   `(helm-header               ,dummy)
   `(helm-lisp-show-completion ,dummy)
   `(helm-match                ,dummy)
   `(helm-selection            ,dummy)
   `(helm-selection-line       ,dummy)
   `(helm-source-header        ,dummy)
   `(helm-visible-mark         ,dummy)

   ;; Hydra
   `(hydra-face-amaranth ,dummy)
   `(hydra-face-blue     ,dummy)
   `(hydra-face-red      ,dummy)

   ;; Jabber
   `(jabber-activity-face          ,dummy)
   `(jabber-activity-personal-face ,dummy)
   `(jabber-chat-error             ,dummy)
   `(jabber-chat-prompt-foreign    ,dummy)
   `(jabber-chat-prompt-local      ,dummy)
   `(jabber-chat-prompt-system     ,dummy)
   `(jabber-chat-text-foreign      ,dummy)
   `(jabber-chat-text-local        ,dummy)
   `(jabber-rare-time-face         ,dummy)
   `(jabber-roster-user-away       ,dummy)
   `(jabber-roster-user-chatty     ,dummy)
   `(jabber-roster-user-dnd        ,dummy)
   `(jabber-roster-user-error      ,dummy)
   `(jabber-roster-user-offline    ,dummy)
   `(jabber-roster-user-online     ,dummy)
   `(jabber-roster-user-xa         ,dummy)

   ;; Javascript
   `(js2-error                    ,empty        )
   `(js2-external-variable        ,hl-warning   )
   `(js2-function-call            ,empty        )
   `(js2-function-param           ,variable-name) ;;2 ;; переменные ??work??
   `(js2-function-param-face      ,dummy        )
   `(js2-instance-member          ,dummy        )
   `(js2-jsdoc-html-tag-delimiter ,function-name)
   `(js2-jsdoc-html-tag-name      ,keyword      )
   `(js2-jsdoc-tag                ,function-name)
   `(js2-jsdoc-type               ,type         )
   `(js2-jsdoc-value              ,variable-name)
   `(js2-object-property          ,empty        )
   `(js2-private-function-call    ,dummy        )
   `(js2-private-member           ,dummy        )
   `(js2-warning                  ,empty        )

   ;; MMM-Mode
   `(mmm-cleanup-submode-face     ,dummy)
   `(mmm-code-submode-face        ,dummy)
   `(mmm-comment-submode-face     ,dummy)
   `(mmm-declaration-submode-face ,dummy)
   `(mmm-default-submode-face     ,dummy)
   `(mmm-delimiter-face           ,dummy)
   `(mmm-init-submode-face        ,dummy)
   `(mmm-output-submode-face      ,dummy)
   `(mmm-special-submode-face     ,dummy)

   ;; ;; Magit
   ;; `(magit-branch                       ,dummy)
   ;; `(magit-diff-add                     ,dummy)
   ;; `(magit-diff-del                     ,dummy)
   ;; `(magit-diff-file-header             ,header)
   ;; `(magit-diff-hunk-header             ,header)
   ;; `(magit-diff-merge-current           ,dummy)
   ;; `(magit-diff-merge-diff3-separator   ,dummy)
   ;; `(magit-diff-merge-proposed          ,dummy)
   ;; `(magit-diff-merge-separator         ,dummy)
   ;; `(magit-diff-none                    ,dummy)
   ;; `(magit-header                       ,header)
   ;; `(magit-item-highlight               ,dummy)
   ;; `(magit-item-mark                    ,dummy)
   ;; `(magit-log-author                   ,dummy)
   ;; `(magit-log-author-date-cutoff       ,dummy)
   ;; `(magit-log-date                     ,dummy)
   ;; `(magit-log-graph                    ,dummy)
   ;; `(magit-log-head-label-bisect-bad    ,dummy)
   ;; `(magit-log-head-label-bisect-good   ,dummy)
   ;; `(magit-log-head-label-bisect-skip   ,dummy)
   ;; `(magit-log-head-label-default       ,dummy)
   ;; `(magit-log-head-label-head          ,dummy)
   ;; `(magit-log-head-label-local         ,dummy)
   ;; `(magit-log-head-label-patches       ,dummy)
   ;; `(magit-log-head-label-remote        ,dummy)
   ;; `(magit-log-head-label-tags          ,dummy)
   ;; `(magit-log-head-label-wip           ,dummy)
   ;; `(magit-log-message                  ,dummy)
   ;; `(magit-log-reflog-label-amend       ,dummy)
   ;; `(magit-log-reflog-label-checkout    ,dummy)
   ;; `(magit-log-reflog-label-cherry-pick ,dummy)
   ;; `(magit-log-reflog-label-commit      ,dummy)
   ;; `(magit-log-reflog-label-merge       ,dummy)
   ;; `(magit-log-reflog-label-other       ,dummy)
   ;; `(magit-log-reflog-label-rebase      ,dummy)
   ;; `(magit-log-reflog-label-remote      ,dummy)
   ;; `(magit-log-reflog-label-reset       ,dummy)
   ;; `(magit-log-sha1                     ,dummy)
   ;; `(magit-process-ng                   ,dummy)
   ;; `(magit-process-ok                   ,dummy)
   ;; `(magit-section-title                ,header)
   ;; `(magit-signature-bad                ,dummy)
   ;; `(magit-signature-good               ,dummy)
   ;; `(magit-signature-none               ,dummy)
   ;; `(magit-signature-untrusted          ,dummy)
   ;; `(magit-tag                          ,dummy)
   ;; `(magit-valid-signature              ,dummy)
   ;; `(magit-whitespace-warning-face      ,dummy)

   ;; ;; Magit >= 2.1.0
   ;; `(magit-bisect-bad                  ,dummy)
   ;; `(magit-bisect-good                 ,dummy)
   ;; `(magit-bisect-skip                 ,dummy)
   ;; `(magit-blame-date                  ,dummy)
   ;; `(magit-blame-hash                  ,dummy)
   ;; `(magit-blame-heading               ,dummy)
   ;; `(magit-blame-name                  ,dummy)
   ;; `(magit-blame-summary               ,dummy)
   ;; `(magit-branch-current              ,dummy)
   ;; `(magit-branch-local                ,dummy)
   ;; `(magit-branch-remote               ,dummy)
   ;; `(magit-cherry-equivalent           ,dummy)
   ;; `(magit-cherry-unmatched            ,dummy)
   ;; `(magit-diff-added                  ,dummy)
   ;; `(magit-diff-added-highlight        ,dummy)
   ;; `(magit-diff-base                   ,dummy)
   ;; `(magit-diff-base-highlight         ,dummy)
   ;; `(magit-diff-conflict-heading       ,dummy)
   ;; `(magit-diff-context                ,dummy)
   ;; `(magit-diff-context-highlight      ,dummy)
   ;; `(magit-diff-file-heading           ,header)
   ;; `(magit-diff-file-heading-highlight ,empty)
   ;; `(magit-diff-file-heading-selection ,dummy)
   ;; `(magit-diff-hunk-heading           ,dummy)
   ;; `(magit-diff-hunk-heading-highlight ,dummy)
   ;; `(magit-diff-hunk-heading-selection ,dummy)
   ;; `(magit-diff-lines-boundary         ,dummy)
   ;; `(magit-diff-lines-heading          ,dummy)
   ;; `(magit-diff-our                    ,dummy)
   ;; `(magit-diff-our-highlight          ,dummy)
   ;; `(magit-diff-removed                ,dummy)
   ;; `(magit-diff-removed-highlight      ,dummy)
   ;; `(magit-diff-their                  ,dummy)
   ;; `(magit-diff-their-highlight        ,dummy)
   ;; `(magit-diff-whitespace-warning     ,dummy)
   ;; `(magit-diffstat-added              ,dummy)
   ;; `(magit-diffstat-removed            ,dummy)
   ;; `(magit-dimmed                      ,dummy)
   ;; `(magit-filename                    ,dummy)
   ;; `(magit-hash                        ,dummy)
   ;; `(magit-head                        ,dummy)
   ;; `(magit-header-line                 ,dummy)
   ;; `(magit-log-author                  ,dummy)
   ;; `(magit-log-date                    ,dummy)
   ;; `(magit-log-graph                   ,dummy)
   ;; `(magit-process-ng                  ,dummy)
   ;; `(magit-process-ok                  ,dummy)
   ;; `(magit-reflog-amend                ,dummy)
   ;; `(magit-reflog-checkout             ,dummy)
   ;; `(magit-reflog-cherry-pick          ,dummy)
   ;; `(magit-reflog-commit               ,dummy)
   ;; `(magit-reflog-merge                ,dummy)
   ;; `(magit-reflog-other                ,dummy)
   ;; `(magit-reflog-rebase               ,dummy)
   ;; `(magit-reflog-remote               ,dummy)
   ;; `(magit-reflog-reset                ,dummy)
   ;; `(magit-section-heading             ,header)
   ;; `(magit-section-heading-selection   ,dummy)
   ;; `(magit-section-highlight           ,hl-active)
   ;; `(magit-sequence-done               ,dummy)
   ;; `(magit-sequence-drop               ,dummy)
   ;; `(magit-sequence-head               ,dummy)
   ;; `(magit-sequence-onto               ,dummy)
   ;; `(magit-sequence-part               ,dummy)
   ;; `(magit-sequence-pick               ,dummy)
   ;; `(magit-sequence-stop               ,dummy)
   ;; `(magit-signature-bad               ,dummy)
   ;; `(magit-signature-good              ,dummy)
   ;; `(magit-signature-untrusted         ,dummy)
   ;; `(magit-tag                         ,dummy)
   ;; `(magit-valid-signature             ,dummy)
   ;; `(magit-whitespace-warning-face     ,dummy)

   ;; Malabar
   `(malabar-error-face   ,dummy)
   `(malabar-info-face    ,dummy)
   `(malabar-warning-face ,dummy)

   ;; Markdown-mode
   `(markdown-blockquote-face       ,dummy)
   `(markdown-bold-face             ,dummy)
   `(markdown-comment-face          ,dummy)
   `(markdown-header-delimiter-face ,dummy)
   `(markdown-header-face           ,dummy)
   `(markdown-header-face-1         ,dummy)
   `(markdown-header-face-2         ,dummy)
   `(markdown-header-face-3         ,dummy)
   `(markdown-header-face-4         ,dummy)
   `(markdown-header-face-5         ,dummy)
   `(markdown-header-face-6         ,dummy)
   `(markdown-header-rule-face      ,dummy)
   `(markdown-inline-code-face      ,dummy)
   `(markdown-italic-face           ,dummy)
   `(markdown-link-face             ,dummy)
   `(markdown-list-face             ,dummy)
   `(markdown-math-face             ,dummy)
   `(markdown-missing-link-face     ,dummy)
   `(markdown-pre-face              ,dummy)
   `(markdown-reference-face        ,dummy)
   `(markdown-url-face              ,dummy)

   ;; Message faces
   `(message-cited-text        ,dummy)
   `(message-header-cc         ,dummy)
   `(message-header-name       ,dummy)
   `(message-header-newsgroups ,dummy)
   `(message-header-other      ,dummy)
   `(message-header-subject    ,dummy)
   `(message-header-to         ,dummy)
   `(message-header-xheader    ,dummy)
   `(message-mml               ,dummy)
   `(message-separator         ,dummy)

   ;; Multiple cursor
   ;; `(mc/cursor-face      ,hl) ;; use funny default cursor hl
   `(mc/cursor-bar-face  ,hl-active)
   `(mc/region-face      ,hl-active)
   
   ;; Neotree
   `(neo-banner-face     ,dummy)
   `(neo-button-face     ,dummy)
   `(neo-dir-link-face   ,dummy)
   `(neo-expand-btn-face ,dummy)
   `(neo-file-link-face  ,dummy)
   `(neo-header-face     ,dummy)
   `(neo-root-dir-face   ,dummy)

   ;; Rainbow-delimiters
   `(rainbow-delimiters-depth-1-face   ,dummy)
   `(rainbow-delimiters-depth-2-face   ,dummy)
   `(rainbow-delimiters-depth-3-face   ,dummy)
   `(rainbow-delimiters-depth-4-face   ,dummy)
   `(rainbow-delimiters-depth-5-face   ,dummy)
   `(rainbow-delimiters-depth-6-face   ,dummy)
   `(rainbow-delimiters-depth-7-face   ,dummy)
   `(rainbow-delimiters-depth-8-face   ,dummy)
   `(rainbow-delimiters-depth-9-face   ,dummy)
   `(rainbow-delimiters-unmatched-face ,dummy)

   ;; ReStructuredText
   `(rst-adornment    ,dummy)
   `(rst-block        ,dummy)
   `(rst-comment      ,dummy)
   `(rst-definition   ,dummy)
   `(rst-directive    ,dummy)
   `(rst-external     ,dummy)
   `(rst-level-1      ,dummy)
   `(rst-level-1-face ,dummy)
   `(rst-level-2      ,dummy)
   `(rst-level-2-face ,dummy)
   `(rst-level-3      ,dummy)
   `(rst-level-3-face ,dummy)
   `(rst-level-4      ,dummy)
   `(rst-level-4-face ,dummy)
   `(rst-level-5      ,dummy)
   `(rst-level-5-face ,dummy)
   `(rst-level-6      ,dummy)
   `(rst-level-6-face ,dummy)
   `(rst-literal      ,dummy)
   `(rst-reference    ,dummy)
   `(rst-transition   ,dummy)

   ;; Ruby
   `(enh-ruby-heredoc-delimiter-face ,dummy)
   `(enh-ruby-op-face                ,dummy)
   `(enh-ruby-regexp-delimiter-face  ,dummy)
   `(enh-ruby-string-delimiter-face  ,dummy)
   `(erm-syn-errline                 ,dummy)
   `(erm-syn-warnline                ,dummy)

   ;; Semantic faces
   `(semantic-decoration-on-includes               ,dummy)
   `(semantic-decoration-on-private-members-face   ,dummy)
   `(semantic-decoration-on-protected-members-face ,dummy)
   `(semantic-decoration-on-unknown-includes       ,dummy)
   `(semantic-decoration-on-unparsed-includes      ,dummy)
   `(semantic-tag-boundary-face                    ,dummy)
   `(semantic-unmatched-syntax-face                ,dummy)

   ;; Swoop
   `(helm-swoop-target-line-block-face ,dummy)
   `(helm-swoop-target-line-face       ,dummy)
   `(helm-swoop-target-word-face       ,dummy)
   `(swoop-face-header-format-line     ,dummy)
   `(swoop-face-line-buffer-name       ,dummy)
   `(swoop-face-line-number            ,dummy)
   `(swoop-face-target-line            ,dummy)
   `(swoop-face-target-words           ,dummy)

   ;; Tuareg
   `(tuareg-font-lock-error-face              ,dummy)
   `(tuareg-font-lock-governing-face          ,dummy)
   `(tuareg-font-lock-interactive-error-face  ,dummy)
   `(tuareg-font-lock-interactive-output-face ,dummy)
   `(tuareg-font-lock-multistage-face         ,dummy)
   `(tuareg-font-lock-operator-face           ,dummy)

   ;; Twittering-mode
   `(twittering-timeline-footer-face ,dummy)
   `(twittering-timeline-header-face ,dummy)
   `(twittering-uri-face             ,dummy)
   `(twittering-username-face        ,dummy)

   ;; ansi-term
   `(term-color-black   ,dummy)
   `(term-color-blue    ,dummy)
   `(term-color-cyan    ,dummy)
   `(term-color-green   ,dummy)
   `(term-color-magenta ,dummy)
   `(term-color-red     ,dummy)
   `(term-color-white   ,dummy)
   `(term-color-yellow  ,dummy)

   ;; avy-mode
   `(avy-lead-face   ,dummy)
   `(avy-lead-face-0 ,dummy)
   `(avy-lead-face-1 ,dummy)
   `(avy-lead-face-2 ,dummy)

   ;; cfw: Calendar Framework
   `(cfw:face-day-title          ,dummy)
   `(cfw:face-grid               ,dummy)
   `(cfw:face-header             ,dummy)
   `(cfw:face-holiday            ,dummy)
   `(cfw:face-saturday           ,dummy)
   `(cfw:face-select             ,dummy)
   `(cfw:face-sunday             ,dummy)
   `(cfw:face-today              ,dummy)
   `(cfw:face-today-title        ,dummy)
   `(cfw:face-toolbar            ,dummy)
   `(cfw:face-toolbar-button-off ,dummy)
   `(cfw:face-toolbar-button-on  ,dummy)

   ;; company
   `(company-echo                     ,dummy)
   `(company-echo-common              ,dummy)
   `(company-preview                  ,dummy)
   `(company-preview-common           ,dummy)
   `(company-preview-search           ,dummy)
   `(company-scrollbar-bg             ,dummy)
   `(company-scrollbar-fg             ,dummy)
   `(company-template-field           ,dummy)
   `(company-tooltip                  ,dummy)
   `(company-tooltip-annotation       ,dummy)
   `(company-tooltip-common           ,dummy)
   `(company-tooltip-common-selection ,dummy)
   `(company-tooltip-mouse            ,dummy)
   `(company-tooltip-selection        ,dummy)

   ;; compilation
   `(compilation-column-number  ,link-face)
   `(compilation-error          ,hl-error)
   `(compilation-info           ,hl-info)
   `(compilation-line-number    ,link-face)
   `(compilation-mode-line-exit ,dummy)
   `(compilation-mode-line-fail ,dummy)
   `(compilation-mode-line-run  ,dummy)
   `(compilation-warning        ,hl-warning)

   ;; git-commit-mode
   `(git-commit-branch-face               ,dummy)
   `(git-commit-comment-action-face       ,dummy)
   `(git-commit-comment-file-face         ,dummy)
   `(git-commit-comment-heading-face      ,dummy)
   `(git-commit-known-pseudo-header-face  ,dummy)
   `(git-commit-no-branch-face            ,dummy)
   `(git-commit-nonempty-second-line-face ,dummy)
   `(git-commit-note-face                 ,dummy)
   `(git-commit-overlong-summary-face     ,dummy)
   `(git-commit-pseudo-header-face        ,dummy)
   `(git-commit-summary-face              ,dummy)
   `(git-rebase-description-face          ,dummy)
   `(git-rebase-killed-action-face        ,dummy)

   ;; git-gutter (&-fringe)
   `(git-gutter:added    ,dummy)
   `(git-gutter:deleted  ,dummy)
   `(git-gutter:modified ,dummy)

   ;; ido-mode
   `(ido-first-match       ,hl-active)
   `(ido-incomplete-regexp ,dummy    )
   `(ido-indicator         ,constant )
   `(ido-only-match        ,hl       ) ;; only match.
   `(ido-subdir            ,directory) ;; Папки в альтернативе
   `(ido-virtual           ,dummy    )

   ;; info
   `(info-header-node  ,dummy)
   `(info-header-xref  ,dummy)
   `(info-index-match  ,dummy)
   `(info-menu-header  ,dummy)
   `(info-menu-star    ,dummy)
   `(info-node         ,dummy)
   `(info-title-1      ,dummy)
   `(info-title-2      ,dummy)
   `(info-title-3      ,dummy)
   `(info-title-4      ,dummy)
   `(info-xref         ,dummy)
   `(info-xref-visited ,dummy)

   ;; ivy-mode
   `(ivy-confirm-face            ,dummy)
   `(ivy-current-match           ,dummy)
   `(ivy-minibuffer-match-face-1 ,dummy)
   `(ivy-minibuffer-match-face-2 ,dummy)
   `(ivy-minibuffer-match-face-3 ,dummy)
   `(ivy-minibuffer-match-face-4 ,dummy)
   `(ivy-subdir                  ,dummy)
   `(ivy-virtual                 ,dummy)

   ;; latex
   `(font-latex-bold-face                 ,empty)
   `(font-latex-doctex-documentation-face ,dummy)
   `(font-latex-doctex-preprocessor-face  ,dummy)
   `(font-latex-italic-face               ,empty)
   `(font-latex-math-face                 ,str)
   `(font-latex-sectioning-5-face         ,empty)
   `(font-latex-sectioning-4-face         ,empty)
   `(font-latex-sectioning-3-face         ,empty)
   `(font-latex-sectioning-2-face         ,empty)
   `(font-latex-sectioning-1-face         ,empty)
   `(font-latex-sedate-face               ,builtin)
   `(font-latex-slide-title-face          ,dummy)
   `(font-latex-string-face               ,str)
   `(font-latex-subscript-face            ,empty)
   `(font-latex-superscript-face          ,empty)
   `(font-latex-verbatim-face             ,dummy)
   `(font-latex-warning-face              ,hl-warning)

   ;; notmuch
   `(notmuch-search-unread-face ,dummy)

   ;; org-mode
   `(org-agenda-clocking         ,dummy)
   `(org-agenda-column-dateline  ,dummy)
   `(org-agenda-date             ,dummy)
   `(org-agenda-date-today       ,dummy)
   `(org-agenda-date-weekend     ,dummy)
   `(org-agenda-dimmed-todo-face ,dummy)
   `(org-agenda-done             ,dummy)
   `(org-agenda-structure        ,dummy)
   `(org-agenda-todo             ,dummy)
   `(org-archived                ,dummy)
   `(org-block                   ,dummy)
   `(org-block-background        ,dummy)
   `(org-block-begin-line        ,dummy)
   `(org-block-end-line          ,dummy)
   `(org-checkbox                ,dummy)
   `(org-code                    ,dummy)
   `(org-column                  ,dummy)
   `(org-column-title            ,dummy)
   `(org-date                    ,dummy)
   `(org-deadline-announce       ,dummy)
   `(org-document-info           ,dummy)
   `(org-document-info-keyword   ,dummy)
   `(org-document-title          ,dummy)
   `(org-done                    ,dummy)
   `(org-ellipsis                ,dummy)
   `(org-footnote                ,dummy)
   `(org-formula                 ,dummy)
   `(org-headline-done           ,dummy)
   `(org-hide                    ,dummy)
   `(org-level-1                 ,dummy)
   `(org-level-2                 ,dummy)
   `(org-level-3                 ,dummy)
   `(org-level-4                 ,dummy)
   `(org-level-5                 ,dummy)
   `(org-level-6                 ,dummy)
   `(org-level-7                 ,dummy)
   `(org-level-8                 ,dummy)
   `(org-link                    ,dummy)
   `(org-mode-line-clock         ,dummy)
   `(org-mode-line-clock-overrun ,dummy)
   `(org-priority                ,dummy)
   `(org-quote                   ,dummy)
   `(org-scheduled               ,dummy)
   `(org-scheduled-previously    ,dummy)
   `(org-scheduled-today         ,dummy)
   `(org-special-keyword         ,dummy)
   `(org-table                   ,dummy)
   `(org-tag                     ,dummy)
   `(org-time-grid               ,dummy)
   `(org-todo                    ,dummy)
   `(org-upcoming-deadline       ,dummy)
   `(org-verbatim                ,dummy)
   `(org-warning                 ,dummy)

   ;; outline
   `(outline-1 ,dummy)
   `(outline-2 ,dummy)
   `(outline-3 ,dummy)
   `(outline-4 ,dummy)
   `(outline-5 ,dummy)
   `(outline-6 ,dummy)
   `(outline-7 ,dummy)
   `(outline-8 ,dummy)

   ;; popup
   `(popup-face                       ,dummy   )
   `(popup-isearch-match              ,dummy   )
   `(popup-menu-face                  ,dummy   )
   `(popup-menu-mouse-face            ,dummy   )
   `(popup-menu-selection-face        ,dummy   )
   `(popup-menu-summary-face          ,dummy   )
   `(popup-scroll-bar-background-face ,default ) ;; скроллбар фон
   `(popup-scroll-bar-foreground-face ,default2) ;; скроллбар ползунок
   `(popup-summary-face               ,default2) ;; Пояснения откуда дока
   `(popup-tip-face                   ,tip     ) ;; совет,хелп,документация при ac

   ;; rcirc
   `(rcirc-bright-nick               ,dummy)
   `(rcirc-dim-nick                  ,dummy)
   `(rcirc-keyword                   ,dummy)
   `(rcirc-my-nick                   ,dummy)
   `(rcirc-nick-in-message           ,dummy)
   `(rcirc-nick-in-message-full-line ,dummy)
   `(rcirc-other-nick                ,dummy)
   `(rcirc-prompt                    ,dummy)
   `(rcirc-server                    ,dummy)
   `(rcirc-server-prefix             ,dummy)
   `(rcirc-timestamp                 ,dummy)
   `(rcirc-track-keyword             ,dummy)
   `(rcirc-track-nick                ,dummy)
   `(rcirc-url                       ,dummy)

   ;; smerge
   `(smerge-refined-change ,dummy)

   ;; swiper
   `(swiper-line-face    ,dummy)
   `(swiper-match-face-1 ,dummy)
   `(swiper-match-face-2 ,dummy)
   `(swiper-match-face-3 ,dummy)
   `(swiper-match-face-4 ,dummy)

   ;; table
   `(table-cell ,dummy)

   ;; tty-menu
   `(menu                   ,dummy)
   `(tty-menu-disabled-face ,dummy)
   `(tty-menu-enabled-face  ,dummy)
   `(tty-menu-selected-face ,dummy)

   ;; undo-tree
   `(undo-tree-visualizer-active-branch-face ,default-active  ) ;; active undo-tree branch in visualizer.
   `(undo-tree-visualizer-current-face       ,variable-name   ) ;; current undo-tree node in visualizer.
   `(undo-tree-visualizer-default-face       ,default-inactive) ;; current undo-tree node in visualizer.
   `(undo-tree-visualizer-register-face      ,dummy           )

   ;; volatile-highlights
   `(vhl/default-face ,dummy)

   ;; web-mode
   `(web-mode-block-attr-name-face           ,dummy)
   `(web-mode-block-attr-value-face          ,dummy)
   `(web-mode-block-comment-face             ,dummy)
   `(web-mode-block-control-face             ,keyword)
   `(web-mode-block-delimiter-face           ,function-name)
   `(web-mode-block-face                     ,default)
   `(web-mode-block-string-face              ,str)
   `(web-mode-bold-face                      ,dummy)
   `(web-mode-builtin-face                   ,dummy)
   `(web-mode-comment-face                   ,comment)
   `(web-mode-comment-keyword-face           ,dummy)
   `(web-mode-constant-face                  ,constant)
   `(web-mode-css-at-rule-face               ,dummy)
   `(web-mode-css-color-face                 ,dummy)
   `(web-mode-css-comment-face               ,dummy)
   `(web-mode-css-function-face              ,dummy)
   `(web-mode-css-priority-face              ,dummy)
   `(web-mode-css-property-name-face         ,variable-name)
   `(web-mode-css-pseudo-class-face          ,dummy)
   `(web-mode-css-selector-face              ,function-name)
   `(web-mode-css-string-face                ,dummy)
   `(web-mode-css-variable-face              ,dummy)
   `(web-mode-current-column-highlight-face  ,hl)
   `(web-mode-current-element-highlight-face ,hl)
   `(web-mode-doctype-face                   ,keyword)
   `(web-mode-error-face                     ,dummy)
   `(web-mode-filter-face                    ,dummy)
   `(web-mode-folded-face                    ,dummy)
   `(web-mode-function-call-face             ,default)
   `(web-mode-function-name-face             ,function-name)
   `(web-mode-html-attr-custom-face          ,variable-name)
   `(web-mode-html-attr-engine-face          ,dummy)
   `(web-mode-html-attr-equal-face           ,default)
   `(web-mode-html-attr-name-face            ,variable-name)
   `(web-mode-html-attr-value-face           ,str)
   `(web-mode-html-entity-face               ,dummy)
   `(web-mode-html-tag-bracket-face          ,function-name)
   `(web-mode-html-tag-custom-face           ,dummy)
   `(web-mode-html-tag-face                  ,keyword)
   `(web-mode-html-tag-namespaced-face       ,dummy)
   `(web-mode-inlay-face                     ,dummy)
   `(web-mode-italic-face                    ,dummy)
   `(web-mode-javascript-comment-face        ,comment)
   `(web-mode-javascript-string-face         ,str)
   `(web-mode-json-comment-face              ,dummy)
   `(web-mode-json-context-face              ,dummy)
   `(web-mode-json-key-face                  ,dummy)
   `(web-mode-json-string-face               ,dummy)
   `(web-mode-jsx-depth-1-face               ,dummy)
   `(web-mode-jsx-depth-2-face               ,dummy)
   `(web-mode-jsx-depth-3-face               ,dummy)
   `(web-mode-jsx-depth-4-face               ,dummy)
   `(web-mode-keyword-face                   ,keyword)
   `(web-mode-param-name-face                ,dummy)
   `(web-mode-part-comment-face              ,dummy)
   `(web-mode-part-face                      ,dummy)
   `(web-mode-part-string-face               ,dummy)
   `(web-mode-preprocessor-face              ,dummy)
   `(web-mode-script-face                    ,default)
   `(web-mode-sql-keyword-face               ,dummy)
   `(web-mode-string-face                    ,dummy)
   `(web-mode-style-face                     ,empty)
   `(web-mode-symbol-face                    ,dummy)
   `(web-mode-type-face                      ,dummy)
   `(web-mode-underline-face                 ,dummy)
   `(web-mode-variable-name-face             ,variable-name)
   `(web-mode-warning-face                   ,dummy)
   `(web-mode-whitespace-face                ,dummy)

   ;; which-function-mode
   `(which-func ,dummy)

   ;; widget
   `(widget-button            ,dummy)
   `(widget-button-pressed    ,dummy)
   `(widget-documentation     ,dummy)
   `(widget-field             ,dummy)
   `(widget-inactive          ,dummy)
   `(widget-single-line-field ,dummy)

   ;; yalinum
   `(yalinum-bar-face   ,dummy)
   `(yalinum-face       ,dummy)
   `(yalinum-track-face ,dummy)

   ;; yas
   `(yas-field-highlight-face ,empty)

   ;; other
   `(ac-candidate-face                    ,default2      ) ;; "Face for candidate."
   `(ac-candidate-mouse-face              ,hl-active     ) ;; "Mouse face for candidate."
   `(ac-completion-face                   ,default2      ) ;; "Face for inline completion"
   `(ac-selection-face                    ,hl-active     ) ;; "Face for selected candidate."
   `(bookmark-menu-heading                ,header        ) ;; Заголовок заметок
   `(button                               ,but           )
   `(display-time-face                    ,empty         ) ;; часы
   `(emmet-preview-input                  ,hl-active     ) ;; emmet preview input
   `(emmet-preview-output                 ,default2      ) ;; emmet preview output
   `(flycheck-fringe-error                ,fringe-error  ) ;; flycheck ошибка на бортике
   `(flycheck-fringe-info                 ,fringe-info   ) ;; flycheck информация на бортике
   `(flycheck-fringe-warning              ,fringe-warning) ;; flycheck предупреждение на бортике
   `(flycheck-info                        ,hl-info       ) ;; flycheck информация
   `(flycheck-warning                     ,hl-warning    ) ;; flycheck предупреждение
   `(hideshowvis-hidable-face             ,fringe-info   ) ;; hideshow minus in fringe
   `(highlight-indentation-face           ,linum         ) ;; подсветить текущую найденную
   `(hs-face                              ,hl            ) ;; hideshow {(n)...} face
   `(hs-fringe-face                       ,fringe-info   ) ;; hideshow plus in fringe
   `(isearch-fail                         ,hl-error      ) ;; подсветить зафейленую часть
   `(match                                ,hl-active     ) ;; подсветить текущую найденную
   `(powerline-active1                    ,default2      ) ;; modeline активный нецентральный(2)
   `(powerline-active2                    ,hl-active     ) ;; modeline активный центральный(1)
   `(powerline-inactive1                  ,default       ) ;; modeline неактивный нецентральный(2)
   `(powerline-inactive2                  ,default       ) ;; modeline неактивный центральный(1)
   `(speedbar-button-face                 ,but           ) ;; цвет кнопок +-
   `(speedbar-directory-face              ,directory     ) ;; Папка в списке директорий
   `(speedbar-file-face                   ,file          )
   `(speedbar-highlight-face              ,hl            ) ;; цвет функции при переходе на неё из "функций в файлах"
   `(speedbar-selected-face               ,hl-active     ) ;; Текущий файл в списке директорий
   `(speedbar-tag-face                    ,function-name ) ;; цвет функций в файлах
   `(tooltip                              ,tip           ) ;; совет
   `(tr-default-font-face                 ,default       ) ;; hideshow {(n)...} face
   `(undo-tree-visualizer-unmodified-face ,constant      ) ;; nodes corresponding to unmodified buffers in visualizer.

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
