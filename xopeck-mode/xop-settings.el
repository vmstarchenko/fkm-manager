;;;; Пользовательские настройки

;; убрать панельки меню, скроллбар, мигане курсора
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

;; убрать мусор со стартового экрана
(setq inhibit-splash-screen t)

;; y/n вместо yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Название открытого буфера в шапке окна
(setq frame-title-format "Emacs:   %b")

;; modeline
(line-number-mode)
(column-number-mode) ;; отображать номер столбца

;; (setq
;;  global-mode-string
;;  (list 
;;        '(:eval (battery-status))
;;        ))

;; fix iedit keybindings
(setq iedit-toggle-key-default nil)

;; powerline
(defun powerline-xopeck-theme ()
  "Setup a mode-line with major and minor modes centered."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (face3 (if active 'powerline-active3 'powerline-inactive3)) ;;;
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list
                                (powerline-raw "%*" nil 'l)
                                ;; (powerline-buffer-size nil 'l)
                                (powerline-raw "%p" nil 'l) ;; Процент прокрутки
                                (powerline-raw "%2cC" nil 'l) ;; номер столбца
																(powerline-raw "%2lL " nil 'l) ;; номер строки
                                ;; (powerline-raw "")
                                (funcall separator-left mode-line face1)
                                (powerline-raw " " face1 'l)
                                (powerline-narrow face1 'l)
                                (powerline-buffer-id face1 'nil) ;; Название буффера
                                (powerline-vc face1)
                                ))
                          (rhs (list
                                (funcall separator-right face1 mode-line)
                                (powerline-raw global-mode-string nil 'l)
                                (powerline-raw " ")
                                        ;(powerline-hud face2 face1)
                                ))
                          (center (list
                                   (powerline-raw " " face1)
                                   (funcall separator-left face1 face2)
                                   (when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
                                     (powerline-raw erc-modified-channels-object face2 'l))
                                   (powerline-major-mode face2 'l)
                                   (powerline-process face2)
                                   (powerline-raw " :" face2)
                                   (powerline-minor-modes face2 'l)
                                   (powerline-raw " " face2)
                                   (funcall separator-right face2 face1))))
                     (concat (powerline-render lhs)
                             (powerline-fill-center face1 (/ (powerline-width center) 2.0))
                             (powerline-render center)
                             (powerline-fill face1 (powerline-width rhs))
                             (powerline-render rhs)))))))

;;; modeline
;; date and time
(defface
  display-time-face '()  "Face used to display the time in the mode line.")
(setq display-time-string-forms
      '((propertize (format-time-string " %H:%M %d.%m") 'face 'display-time-face)))  ;" %H:%M:%S %d-%m-%Y"
(setq display-time-interval 10)
(display-time-mode 1)

;; battery
(require 'battery)
;; (display-battery-mode 1)

(setq-default
 mode-line-format
 '(   ;; buffer state: readonly, changed, not changed
   (:eval
    (when (eql buffer-read-only t)
      (propertize
       " # " 'face
       (if (not (string-match "*" (buffer-name)))
           '(:background "color-88" :foreground "white" :weight bold)))))
   (:eval
    (propertize (if (eql buffer-read-only nil) " %* " "") 'face
                (if (not (string-match "*" (buffer-name)))
                    (if (buffer-modified-p)
                        '(:background "red" :foreground "black" :weight bold)
                      '(:background "green" :foreground "black" :weight bold)))))
   ;; cursor position data
   (:eval
    (propertize " %2cC %2lL %p "
                'face '(:background "grey" :foreground "black")))

   " %b"

   ;;  git state
   ;; (:eval ;; it works
   ;;  (propertize (replace-regexp-in-string
   ;;               "^ Git" " " (if (eq vc-mode nil) "" vc-mode)) 'face
   ;;               '()))

   " [%m:"
   minor-mode-alist
   "]"
   ;; "%I"

   (:eval ;; battery
    (let* ((battery-status (funcall battery-status-function))
           (power-level (cdr (assoc ?p battery-status)))
           (is-charging (downcase (cdr (assoc ?B battery-status)))) ;; charging, discharging, n/a
           (finish-time (cdr (assoc ?t battery-status))) ;; time til finish charging/discharging
           )
      (propertize (if (and (< (string-to-int power-level) 100)
                           (not (string= is-charging "unknown")))
                      (format " %s %s " power-level finish-time) " FULL ") 'face
                      (if (string= is-charging "discharging")
                          (if (< (string-to-int power-level) 20)
                              '(:background "red" :foreground "black" :weight bold)
                            '(:background "orange" :foreground "black" :weight bold))
                        '()))))
   "%M " ;; time
   ))

(setq line-move-visual nil)


;; бэкап
;; (setq make-backup-files        nil)
(setq auto-save-default        nil)
                                        ; (setq auto-save-list-file-name nil) ;; я так привык... хотите включить - замените nil на t

(setq
 backup-by-copying t                                        ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.saves"))                                      ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)                                         ; use versioned backups

;; show-trailing-whitespace
(custom-set-variables
 '(show-trailing-whitespace t))

;; ibuffer
(defalias 'list-buffers 'ibuffer)

;; Общий с ОС буфер обмена
(setq x-select-enable-clipboard t)

;; удалить выделенный текст при вводе поверх
(delete-selection-mode t)

;; отсутствие строки выделить глифами рядом с полосой с номером строки
(setq-default indicate-empty-lines t)

;; убрать перенос строк
(setq-default truncate-lines t)

;; определяем размер окна при запуске
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; выделить выражение в скобках
(show-paren-mode t) ; включить выделение выражений между {},[],()
;; (add-hook 'jinja2-mode-hook (lambda() (show-paren-mode -1)))
;; (add-hook 'html-mode-hook (lambda() (show-paren-mode -1)))
(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()

;; прокрутка
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ; one line at a time
(setq mouse-wheel-progressive-speed nil) ; don't accelerate scrolling
(setq mouse-wheel-follow-mosue 't) ; scroll window under mouse
(setq scroll-step 1) ; keyboard scroll one line at a time
(setq scroll-conservatively 10000)
(setq scroll-margin 3)
(setq scroll-preserve-screen-position 1)

;;; размер таба + пробелы вместо табов
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(add-hook 'fundamental-mode-hook (lambda() (setq tab-width 2)))
(add-hook 'text-mode-hook (lambda() (setq tab-width 2)))
(add-hook 'python-mode-hook (lambda() (setq tab-width 4) (setq indent-tabs-mode nil))) ;;+
(add-hook 'c++-mode-hook (lambda() (setq c-basic-offset 2) (setq indent-tabs-mode nil))) ;;c-basic-indent???
(add-hook 'org-mode (lambda() (setq tab-width 2) (setq indent-tabs-mode nil)))
(add-hook 'emacs-lisp-mode-hook (lambda() (setq tab-width 2)))
(add-hook 'lisp-mode (lambda() (setq tab-width 2) (setq indent-tabs-mode nil)))
(add-hook 'js-mode-hook (lambda() (setq js-indent-level 2))) ;;+
(add-hook 'js2-mode-hook (lambda() (setq js2-basic-offset 2))) ;;+
(add-hook 'css-mode-hook (lambda() (setq css-indent-offset 2))) ;;+
(add-hook 'scss-mode-hook (lambda() (setq css-indent-offset 2))) ;;+
(add-hook 'makefile-mode-hook (lambda() (setq indent-tabs-mode t) (setq tab-width 4))) ;;+
(add-hook 'web-mode-hook
          (lambda()
            (setq web-mode-markup-indent-offset 2)
            (setq web-mode-css-indent-offset 4)
            (setq web-mode-code-indent-offset 2)
            )) ;;+


;; ;; Связять расширения с модами
;; (setq auto-mode-alist
;;       (append '(( "\\.el$". emacs-lisp-mode)
;;                 ( ".emacs$". emacs-lisp-mode)
;;                 ( "\\.py$". python-mode)
;;                 ( "\\.pyw$". python-mode)
;;                 ( "\\.html$". sgml-mode)
;;                 ( "\\.xml$". sgml-mode)
;;                 ( "\\.js$". javascript-mode)
;; ;                ( "\\.cpp$". c++-mode)
;;                 ( "\\.h$". c++-mode)
;;                 ( "\\.hpp$". c++-mode)
;;                 ( "\\.hxx$". c++-mode)
;;                 ( "Makefile$". makefile-mode)
;;                 ( "\\.txt$". Fundamental-mode)
;;                 )))
;; (global-font-lock-mode 1) ;; эта хитрая заточка, включает разум емакса для подсветки синтаксиса 

;; Связять расширения с модами
(add-to-list 'auto-mode-alist '( "\\.h$". c++-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml$" . web-mode))

;; (global-font-lock-mode 1) ;; эта хитрая заточка, включает разум емакса для подсветки синтаксиса 

;; ;; Клавиши для русской раскладки
;; (defun cfg:reverse-input-method (input-method)
;;   "Build the reverse mapping of single letters from INPUT-METHOD."
;;   (interactive
;;    (list (read-input-method-name "Use input method (default current): ")))
;;   (if (and input-method (symbolp input-method))
;;       (setq input-method (symbol-name input-method)))
;;   (let ((current current-input-method)
;;         (modifiers '(nil (control) (meta) (control meta) (super))))
;;     (when input-method
;;       (activate-input-method input-method))
;;     (when (and current-input-method quail-keyboard-layout)
;;       (dolist (map (cdr (quail-map)))
;;         (let* ((to (car map))
;;                (from (quail-get-translation
;;                       (cadr map) (char-to-string to) 1)))
;;           (when (and (characterp from) (characterp to))
;;             (dolist (mod modifiers)
;;               (define-key local-function-key-map
;;                 (vector (append mod (list from)))
;;                 (vector (append mod (list to)))))))))
;;     (when input-method
;;       (activate-input-method current))))

;; (cfg:reverse-input-method 'russian-computer)

;; Стартовое сообщение
(add-hook 'after-init-hook
          (lambda ()
            (insert (concat ";; Hello me. Stop fun, start working.\n"
                            ";; Press s-h h for hotkey help\n\n"
                            ";; Emacs init time: " (emacs-init-time) "\n\n"
                            ";; Symgols (press C-M-q for input):\n"
                            ";;   tab(\t):\t\\t | ^I\n"
                            ";;   newline:\t\\n | ^J\n"
                            ";;   return:\t\\r | ^M\n"
                            ))))

;; Subword. if demands normal: change Docs
(require 'subword)

(setq speedbar-use-images nil)

;; Always new shell
(defadvice shell (around always-new-shell)
  "Always start a new shell."
  (let ((buffer (generate-new-buffer-name "*shell*"))) ad-do-it))
(ad-activate 'shell)

(defadvice eshell (around always-new-eshell)
  "Always start a new eshell."
  (let ((buffer (generate-new-buffer-name "*eshell*"))) ad-do-it))
(ad-activate 'eshell)

;; autosave bookmarks
(setq bookmark-save-flag t)

;; sr-speedbar
                                        ;(require 'sr-speedbar)
(setq speedbar-frame-parameters
      '((minibuffer)
        (width . 40)
        (border-width . 0)
        (menu-bar-lines . 0)
        (tool-bar-lines . 0)
        (unsplittable . t)
        (left-fringe . 0))) ;; Параметры, по походу они не работают

(setq speedbar-hide-button-brackets-flag t) ;; Убрать стрелочки по краям
(setq speedbar-show-unknown-files t)
(setq speedbar-directory-unshown-regexp "^$")
;; (setq speedbar-smart-directory-expand-flag t) ;; Хз что
(setq speedbar-use-images nil)
(setq sr-speedbar-auto-refresh nil) ;; Automatically refresh speedbar content when changed directory.
;; (setq sr-speedbar-max-width 70)
(setq sr-speedbar-right-side t) ;; Show the speedbar to the right side of the current window.
(setq sr-speedbar-width 20)

(when window-system
  (defadvice sr-speedbar-open (after sr-speedbar-open-resize-frame activate)
    (set-frame-width (selected-frame)
                     (+ (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-open 'after 'sr-speedbar-open-resize-frame)

  (defadvice sr-speedbar-close (after sr-speedbar-close-resize-frame activate)
    (sr-speedbar-recalculate-width)
    (set-frame-width (selected-frame)
                     (- (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-close 'after 'sr-speedbar-close-resize-frame)) ;; Что-то для resize frame?

;; (with-current-buffer sr-speedbar-buffer-name ;; фиксированный размер окна
;;   (setq window-size-fixed 'width)) 

(c-add-style "openbsd"
             '("bsd"
               (c-backspace-function . delete-backward-char)
               (c-syntactic-indentation-in-macros . nil)
               (c-tab-always-indent . nil)
               (c-hanging-braces-alist
                (block-close . c-snug-do-while))
               (c-offsets-alist
                (arglist-cont-nonempty . *)
                (statement-cont . *))
               (indent-tabs-mode . t)))
;; скобки в плюсах.

;; python shell
(setq
 python-shell-interpreter "/usr/bin/python3"
 python-shell-interpreter-args "-i")

;; лучшая отрисовка буфера ???
;; (setq redisplay-dont-pause t)

(provide 'xop-settings)
