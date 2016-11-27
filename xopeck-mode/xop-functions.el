;;; Code:
;; python3
(defun insert-python3-directory ()
  (interactive)
  (insert "#! /usr/bin/env python3\n"))
;; python2
(defun insert-python2-directory ()
  (interactive)
  (insert "#! /usr/bin/env python\n"))

;;; docs-string
;; functions
                                        ; python
(defun python-docs-string()
  (interactive)
  (end-of-line)
  (let* ((p (point))
         (spc "")
         size )
    (insert "\n")
    (indent-for-tab-command)
    (setq size (- (point) p 1))
    (while (not (eq size 0))
      (setq spc (concat spc " "))
      (setq size (- size 1)))
    (insert (concat "\"\"\"\n" spc))
    (save-excursion (insert (concat "\n" spc "\"\"\"")))))
                                        ; c++
(defun cpp-docs-string()
  (interactive)
  (end-of-line)
  (insert "\n// ")
  (indent-for-tab-command))
                                        ; lisp
(defun lisp-docs-string()
  (interactive)
  (end-of-line)
  (newline-and-indent)
  (insert "\"\"")
  (backward-char 1))
                                        ; hooks
(add-hook 'python-mode-hook '(lambda ()
                               (defun docs-string()
                                 (interactive)
                                 (python-docs-string))))
(add-hook 'emacs-lisp-mode-hook '(lambda ()
                                   (defun docs-string()
                                     (interactive)
                                     (lisp-docs-string))))
(add-hook 'c++-mode-hook (lambda ()
                           (defun docs-string()
                             (interactive)
                             (cpp-docs-string))))

;; c++ 11 флаг
(defun insert-flag-c11()
  (interactive)
  (insert "-std=c++11"))

;; с++ gtkmm флаг
(defun insert-flag-gtkmm()
  (interactive)
  (insert "`pkg-config --cflags --libs gtkmm-3.0`"))

;; class template
(defun insert-class-template()
	(interactive)
	(insert "private:\n  // members\nprotected:\n  // members\npublic:\n  // members\n  //\n  // member functions:\n  // |-+ constructors:\n  // | |-- default constructor\n  // | |-- copy constructor\n  // | |-- other constructor\n  // | |-- destructor\n  // | |-- operator=\n  // |\n  // |-+ element access:\n  // | |-- const (right value,  const)\n  // | |-- non const (left value, &)\n  // |\n  // |-+ capacity\n  // | |-- const (get data )\n  // | |-- non const (change size)\n  // |\n  // |-+ modifiers:\n  // | |-- add\n  // | |-- pop\n  // | |-- set\n  // |\n  // |-+ operations\n  // |\n  // |-+ friend functions\n  // | |-- streams\n  // |\n  // |-+ friend classes\n  // | |-+ iterators\n  // |   |-- functions\n  // |\n  //\n  // non-member function\n  // |-- swap\n  // |-- relational operators\n"))

;; Изменит перенос строк
(defun change-truncate-lines ()
  (interactive)
  (if (eq truncate-lines t)
      (setq-default truncate-lines nil)
    (setq-default truncate-lines t))
  (recenter))

;; Открыть терминал
(defun open-shell ()
  (interactive)
  (shell))
;; Открыть терминал в новом вертикальном окне
(defun open-shell-in-vwindow ()
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (shell))
;; Открыть терминал в новом горизонтальном окне
(defun open-shell-in-hwindow ()
  (interactive)
  (split-window-vertically)
  (other-window 1)
  (shell))

(defun open-eshell ()
  (interactive)
  (eshell)
  (beginning-of-buffer)
  (kb-kill-line)(delete-char 1)
  (insert "You are welcome to Emacs Shell!")
  (end-of-buffer))
;; Открыть терминал в новом вертикальном окне
(defun open-eshell-in-vwindow ()
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (open-eshell))
;; Открыть терминал в новом горизонтальном окне
(defun open-eshell-in-hwindow ()
  (interactive)
  (split-window-vertically)
  (other-window 1)
  (open-eshell))

;; Открыть интерактивную оболочку python
(defun check-python-mode()
	(interactive)
	(if (not (eq major-mode 'python-mode))
			(progn
				(switch-to-buffer (get-buffer-create "*Python Buffer*"))
				(python-mode))))

(defun open-python-shell ()
  (interactive)
  (split-window-vertically)
  (check-python-mode)
  (python-shell-switch-to-shell)
  (other-window -1)
  (delete-window)
  )
;; Открыть интерактивную оболочку python в новом вертикальном окне
(defun open-python-shell-in-vwindow ()
  (interactive)
  (split-window-horizontally)
  (check-python-mode)
  (python-shell-switch-to-shell)
  )
;; Открыть интерактивную оболочку python в новом горизонтальном окне
(defun open-python-shell-in-hwindow ()
  (interactive)
  (split-window-vertically)
	(check-python-mode)
  (python-shell-switch-to-shell))

;; Открыть slime
(defun open-slime ()
  (interactive)
  (split-window-horizontally)
  (slime)
  (other-window -1)
  (delete-window)
  )
;; Открыть slime в новом вертикальном окне
(defun open-slime-in-vwindow ()
  (interactive)
  (split-window-horizontally)
  (slime)
  )
;; Открыть slime в новом горизонтальном окне
(defun open-slime-in-hwindow ()
  (interactive)
  (split-window-vertically)
	(other-window 1)
  (open-slime)
  )

;; (defun next-shell-command() ;;; add other change name
;; 		(interactive)
;; 		(if (equal major-mode 'shell-mode)
;; 				(save-excursion (comint-next-input 1))
;; 		(if (equal major-mode 'minibuffer-inactive-mode)
;; 				(save-excursion (next-history-element 1)))))

(defun next-shell-command() ;;; add other change name
  (interactive)
  (case major-mode
    (shell-mode
     (save-excursion (comint-next-input 1)))
    (minibuffer-inactive-mode
     (save-excursion (next-history-element 1)))))

(defun previous-shell-command() ;;; add other change name
  (interactive)
  (case major-mode
    (shell-mode
     (save-excursion (comint-previous-input 1)))
    (minibuffer-inactive-mode
     (save-excursion (previous-history-element 1)))))

(defun eshell-clear()
  (interactive)
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)
    (save-excursion (beginning-of-buffer)
                    (insert "You are welcome to Emacs Shell!"))
    )
  )
;; (defun previous-shell-command()
;; 		(interactive)
;; 		(if (equal major-mode 'shell-mode)
;; 				(save-excursion (comint-previous-input 1))
;; 		(if (equal major-mode 'minibuffer-inactive-mode)
;; 				(save-excursion (previous-history-element 1)))))

;; (defun next-eshell-command()
;; 	(interactive)
;; 	(save-excursion (comint-next-input 1)))
;; (defun previous-eshell-command()
;; 	(interactive)
;; 	(save-excursion (eshell-previous-matching-inputeshell-previous-matching-input 1)))

;; show docs
;; (defun show-python-docs(&rest ARGUMENTS)
;; 	(interactive)
;; 	(rope-show-doc ARGUMENTS)
;; 	(delete-window))
(defun show-python-docs-in-vwindow(&rest ARGUMENTS)
	(interactive)
	(rope-show-doc ARGUMENTS)
	(other-window 1))
(defun show-c++-docs()
	(interactive)
  (manual-entry (current-word)))
(defun show-hotkeys()
	(interactive)
  (switch-to-buffer (get-buffer-create "*Emacs Hotkeys*"))
  (kb-kill-beginning-of-buffer)
  (kb-kill-end-of-buffer)
  (insert hotkeys-docs)
  (beginning-of-buffer))


;; Передвинуть регион
(defun move-region (&optional n)
  "Indent the region, or otherwise the current line, by N spaces."
	(interactive "P")
	(if (eq nil n)
			(setq n 1))
  (let* ((use-region (and transient-mark-mode mark-active))
				 (rstart (if use-region (region-beginning) (point-at-bol)))
				 (rend   (if use-region (region-end)       (point-at-eol)))
				 (deactivate-mark "irrelevant"))
    (if use-region
				(indent-rigidly rstart rend n)
      (progn (insert "s")
						 (indent-rigidly rstart (+ rend 1) n)
             (backward-delete-char 1)))))
(defun move-region-right ()
  "Indent the region, or otherwise the current line, by tab-width spaces."
  (interactive)
  (move-region tab-width))
(defun move-region-left ()
  "Indent the region, or otherwise the current line, by tab-width spaces."
  (interactive)
  (move-region (* -1 tab-width)))

;; word
(defun kb-backward-kill-word()
  (interactive)
  (delete-region (point)
                 (progn (backward-word)
                        (point))))
(defun kb-kill-word()
  (interactive)
  (save-excursion
    (delete-region (point)
                   (progn
                     (forward-word)
                     (point)))))
;; line
;;;;;;;;; ДОДЕЛАТЬ (search-... "\n" (point-min) (point-min)
(defun kb-backward-kill-line ()
  (interactive)
  (let* ((p (point))
         (b (save-excursion (search-backward "\n" 0 0))))
    (if (eq b nil)
        (setq b 1)
      (setq b (+ b 1)))
    (if (eq p b)
        (backward-delete-char 1)
      (delete-region p b))))
(defun kb-kill-line ()
  (interactive)
  (let* ((p (point))
         (b (save-excursion (search-forward "\n" (point-max) (point-max)))))
    (if (eq b nil)
        (setq b (point-max))
      (setq b (- b 1)))
    (if (eq p b)
        (delete-char 1)
      (delete-region p b))))
;; paragraph
(defun kb-backward-kill-paragraph()
  (interactive)
  (delete-region (point)
                 (progn (backward-paragraph)
                        (point))))
(defun kb-kill-paragraph()
  (interactive)
  (save-excursion
    (delete-region (point)
                   (progn
                     (forward-paragraph)
                     (point)))))
;; buffer
(defun kb-kill-beginning-of-buffer()
  (interactive)
  (delete-region (point-min) (point))
  (beginning-of-buffer)
  (recenter))
(defun kb-kill-end-of-buffer()
  (interactive)
  (delete-region (point) (point-max))
  (recenter))

;; change case
(defun upcase-previous-word ()
  (interactive)
  (save-excursion
    (backward-word)
    (upcase-word 1)))
(defun downcase-previous-word ()
  (interactive)
  (save-excursion
    (backward-word)
    (downcase-word 1)))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; перевести в русский
(defun turn-in-russian  (start end)
  "Russian recoding."
  (interactive "r")
  (setq eik-chartable (make-hash-table   :test 'equal))
  (puthash "q" "й" eik-chartable)  (puthash "w" "ц" eik-chartable)  (puthash "e" "у" eik-chartable)  (puthash "r" "к" eik-chartable)  (puthash "t" "е" eik-chartable)  (puthash "y" "н" eik-chartable)  (puthash "u" "г" eik-chartable)  (puthash "i" "ш" eik-chartable)  (puthash "o" "щ" eik-chartable)  (puthash "p" "з" eik-chartable)  (puthash "[" "х" eik-chartable)  (puthash "]" "ъ" eik-chartable)  (puthash "a" "ф" eik-chartable)  (puthash "s" "ы" eik-chartable)  (puthash "d" "в" eik-chartable)  (puthash "f" "а" eik-chartable)  (puthash "g" "п" eik-chartable)  (puthash "h" "р" eik-chartable)  (puthash "j" "о" eik-chartable)  (puthash "k" "л" eik-chartable)  (puthash "l" "д" eik-chartable)  (puthash ";" "ж" eik-chartable)  (puthash "'" "э" eik-chartable)  (puthash "z" "я" eik-chartable)  (puthash "x" "ч" eik-chartable)  (puthash "c" "с" eik-chartable)  (puthash "v" "м" eik-chartable)  (puthash "b" "и" eik-chartable)  (puthash "n" "т" eik-chartable)  (puthash "m" "ь" eik-chartable)  (puthash "," "б" eik-chartable)  (puthash "." "ю" eik-chartable)  (puthash "`" "ё" eik-chartable)  (puthash "Q" "Й" eik-chartable)  (puthash "W" "Ц" eik-chartable)  (puthash "E" "У" eik-chartable)  (puthash "R" "К" eik-chartable)  (puthash "T" "Е" eik-chartable)  (puthash "Y" "Н" eik-chartable)  (puthash "U" "Г" eik-chartable)  (puthash "I" "Ш" eik-chartable)  (puthash "O" "Щ" eik-chartable)  (puthash "P" "З" eik-chartable)  (puthash "{" "Х" eik-chartable)  (puthash "}" "Ъ" eik-chartable)  (puthash "A" "Ф" eik-chartable)  (puthash "S" "Ы" eik-chartable)  (puthash "D" "В" eik-chartable)  (puthash "F" "А" eik-chartable)  (puthash "G" "П" eik-chartable)  (puthash "H" "Р" eik-chartable)  (puthash "J" "О" eik-chartable)  (puthash "K" "Л" eik-chartable)  (puthash "L" "Д" eik-chartable)  (puthash ":" "Ж" eik-chartable)  (puthash "\"" "Э" eik-chartable)  (puthash "Z" "Я" eik-chartable)  (puthash "X" "Ч" eik-chartable)  (puthash "C" "С" eik-chartable)  (puthash "V" "М" eik-chartable)  (puthash "B" "И" eik-chartable)  (puthash "N" "Т" eik-chartable)  (puthash "M" "Ь" eik-chartable)  (puthash "<" "Б" eik-chartable)  (puthash ">" "Ю" eik-chartable)  (puthash "~" "Ё" eik-chartable)  (puthash "@" "\"" eik-chartable)  (puthash "#" "№" eik-chartable)  (puthash "$" ";" eik-chartable)  (puthash "^" ":" eik-chartable)  (puthash "&" "?" eik-chartable)  (puthash "/" "." eik-chartable)  (puthash "?" "," eik-chartable)
  (setq eik-str-out "")
  (setq eik-char-in "")
  (setq eik-char-out "")
  (setq eik-i start)
  (while (< eik-i end)
    (setq eik-char-in
          (buffer-substring-no-properties eik-i (+ eik-i 1)))
    (setq eik-char-out (gethash eik-char-in eik-chartable nil))
    (if (not eik-char-out)
        (setq eik-char-out eik-char-in))
    (setq eik-str-out (concat eik-str-out  eik-char-out))
    (setq eik-i (1+ eik-i)))
  (delete-region start end)
  (insert eik-str-out start)
  (delete-char -1))

(defun turn-in-english  (start end)
  "English recoding."
  (interactive "r")
  (setq eik-chartable (make-hash-table   :test 'equal))
  (puthash "й" "q" eik-chartable)  (puthash "ц" "w" eik-chartable)  (puthash "у" "e" eik-chartable)  (puthash "к" "r" eik-chartable)  (puthash "е" "t" eik-chartable)  (puthash "н" "y" eik-chartable)  (puthash "г" "u" eik-chartable)  (puthash "ш" "i" eik-chartable)  (puthash "щ" "o" eik-chartable)  (puthash "з" "p" eik-chartable)  (puthash "х" "[" eik-chartable)  (puthash "ъ" "]" eik-chartable)  (puthash "ф" "a" eik-chartable)  (puthash "ы" "s" eik-chartable)  (puthash "в" "d" eik-chartable)  (puthash "а" "f" eik-chartable)  (puthash "п" "g" eik-chartable)  (puthash "р" "h" eik-chartable)  (puthash "о" "j" eik-chartable)  (puthash "л" "k" eik-chartable)  (puthash "д" "l" eik-chartable)  (puthash "ж" ";" eik-chartable)  (puthash "э" "'" eik-chartable)  (puthash "я" "z" eik-chartable)  (puthash "ч" "x" eik-chartable)  (puthash "с" "c" eik-chartable)  (puthash "м" "v" eik-chartable)  (puthash "и" "b" eik-chartable)  (puthash "т" "n" eik-chartable)  (puthash "ь" "m" eik-chartable)  (puthash "б" "," eik-chartable)  (puthash "ю" "." eik-chartable)  (puthash "ё" "`" eik-chartable)  (puthash "Й" "Q" eik-chartable)  (puthash "Ц" "W" eik-chartable)  (puthash "У" "E" eik-chartable)  (puthash "К" "R" eik-chartable)  (puthash "Е" "T" eik-chartable)  (puthash "Н" "Y" eik-chartable)  (puthash "Г" "U" eik-chartable)  (puthash "Ш" "I" eik-chartable)  (puthash "Щ" "O" eik-chartable)  (puthash "З" "P" eik-chartable)  (puthash "Х" "{" eik-chartable)  (puthash "Ъ" "}" eik-chartable)  (puthash "Ф" "A" eik-chartable)  (puthash "Ы" "S" eik-chartable)  (puthash "В" "D" eik-chartable)  (puthash "А" "F" eik-chartable)  (puthash "П" "G" eik-chartable)  (puthash "Р" "H" eik-chartable)  (puthash "О" "J" eik-chartable)  (puthash "Л" "K" eik-chartable)  (puthash "Д" "L" eik-chartable)  (puthash "Ж" ":" eik-chartable)  (puthash "Э" "\"" eik-chartable)  (puthash "Я" "Z" eik-chartable)  (puthash "Ч" "X" eik-chartable)  (puthash "С" "C" eik-chartable)  (puthash "М" "V" eik-chartable)  (puthash "И" "B" eik-chartable)  (puthash "Т" "N" eik-chartable)  (puthash "Ь" "M" eik-chartable)  (puthash "Б" "<" eik-chartable)  (puthash "Ю" ">" eik-chartable)  (puthash "Ё" "~" eik-chartable)  (puthash "\"" "@" eik-chartable)  (puthash "№" "#" eik-chartable)  (puthash ";" "$" eik-chartable)  (puthash ":" "^" eik-chartable)  (puthash "?" "&" eik-chartable)  (puthash "." "/" eik-chartable)  (puthash "," "?" eik-chartable)
  (setq eik-str-out "")
  (setq eik-char-in "")
  (setq eik-char-out "")
  (setq eik-i start)
  (while (< eik-i end)
    (setq eik-char-in
          (buffer-substring-no-properties eik-i (+ eik-i 1)))
    (setq eik-char-out (gethash eik-char-in eik-chartable nil))
    (if (not eik-char-out)
        (setq eik-char-out eik-char-in))
    (setq eik-str-out (concat eik-str-out  eik-char-out))
    (setq eik-i (1+ eik-i)))
  (delete-region start end)
  (insert eik-str-out start)
  (delete-char -1))

(defun translate-to-russian()
	"Перевести на русский"
	(interactive)
	(setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "ru")
	(google-translate-at-point)
	(setq google-translate-default-source-language nil)
	(setq google-translate-default-target-language nil))

(defun translate-to-english()
	"Перевести на русский"
	(interactive)
	(setq google-translate-default-source-language "ru")
  (setq google-translate-default-target-language "en")
	(google-translate-at-point)
	(setq google-translate-default-source-language nil)
	(setq google-translate-default-target-language nil))

;; emacs calc
                                        ;(defun calc)
;; (require 'calc-ext)

;; (defvar calc-command-flags)

;; reload xopeck-mode
(defun reload-xopeck-mode()
	"reload xopeck-mode"
	(interactive)
	(load "xopeck-mode"))

;; css-colors
(defun hex-color ()
  "Syntax color text of the form #ff1100 in current buffer"
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[abcdef[:digit:]]\\{3,9\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)
                      :foreground (color-complement-hex
                                   (match-string-no-properties 0))))))))
  (font-lock-fontify-buffer))

(defun indent()
  "Indent the region or all buffer if dont user region."
	(interactive)
  (save-excursion
    (let* ((use-region (and transient-mark-mode mark-active))
           (rstart (if use-region (region-beginning) (point-min)))
           (rend   (if use-region (region-end)       (point-max))))
      (indent-region rstart rend)))
  (deactivate-mark "irrelevant"))

(defun clang-format-auto()
  "Correct style by clang-format in the region or all
   buffer if dont user region."
	(interactive)
  (save-excursion
    (let* ((use-region (and transient-mark-mode mark-active))
           (rstart (if use-region (region-beginning) (point-min)))
           (rend   (if use-region (region-end)       (point-max))))
      (clang-format-region rstart rend)))
  (deactivate-mark "irrelevant"))

;; TODO: handle shell-command errors
;; TODO: rm tmp-file-name with concat with filename?
(defmacro define-formatter (formatter-name command tmp-file-path)
  "Create formatter. Command must be abled to called from shell."
  ;; TODO: here check path
  `(defun ,formatter-name ()
     (interactive)
     (save-buffer)
     (let* ((command ,command)
            (filename (buffer-file-name (current-buffer)))
            (tmp-file (concat
                       ""
                       ,tmp-file-path
                       ;; (file-name-nondirectory filename)
                       ))
            (use-region (and transient-mark-mode mark-active))
            (p (point))
            (rstart (if use-region (region-beginning) (point-min)))
            (rend (if use-region (region-end) (point-max))))
       (if (not (eq filename nil))
           (progn
             (write-region rstart rend tmp-file)
             (message (concat command tmp-file))
             (shell-command (concat command tmp-file))
             (kill-region rstart rend)
             (insert-file-contents tmp-file)
             (message
              ,(format "%s was used successfully" formatter-name))
             (goto-char p))))))

(define-formatter pyformat "pyformat -i " "/tmp/#.emacs.formatter")
(define-formatter scssformat "csscomb -c ~/.csscomb.json " "/tmp/#.emacs.formatter")




(defun switch-flycheck()
  "turn on or off flycheck"
  (interactive)
  (let ((active-modes))
    (mapc (lambda (mode) (condition-case nil
                             (if (and (symbolp mode) (symbol-value mode))
                                 (add-to-list 'active-modes mode))
                           (error nil)))
          minor-mode-list)
    (if (member 'flycheck-mode active-modes)
        (flycheck-mode -1)
      (flycheck-mode))))

;; emmet
;; (defun emmet-not-regioned-preview()
;;   (interactive "^")
;;   (insert " ")
;;   (emmet-preview (point) (- (point) 1))
;;   (backward-char))


(defun emmet-turn-on-preview()
  (interactive)
  (let* ((use-region (and transient-mark-mode mark-active))
         (rstart (if use-region (region-beginning) (progn (insert " ")
                                                          (backward-char)
                                                          (point))))
         (rend   (if use-region (region-end)       (+ (point) 1))))
    (emmet-preview rstart rend)))

(defun xscreen()
  (interactive)
  (split-window-horizontally)
  (split-window-vertically)
  (other-window 2)
  (split-window-vertically)
  (sr-speedbar-toggle)
  (other-window 2)
  (open-eshell-in-vwindow)
  (eshell-clear)
  (other-window 1))


(setq zoom-step 1)
(setq zoom-value 110)
(setq zoom-min-value 80)

(defun zoom-set (arg)
  "Prompt user to enter a string, with input history support."
  (interactive
   (list
    (read-string "Zoom value: ")))
  (setq zoom-value (string-to-int arg))
  (set-face-attribute 'default nil :height zoom-value))

(defun zoom+()
  (interactive)
  (setq zoom-value (+ zoom-value zoom-step))
  (set-face-attribute 'default nil :height zoom-value))

(defun zoom-()
  (interactive)
  (setq zoom-value (- zoom-value zoom-step))
  (if (< zoom-value zoom-min-value)
      (progn
        (setq zoom-value zoom-min-value)
        (message "It's too little value")))
  (set-face-attribute 'default nil :height zoom-value))


;; (defun rename-current-file (name)
;;   "Rename current file (and buffer)."
;;   (interactive "sNew name: ")
;;   (let ((filename (buffer-file-name)))
;;     (if (not filename)
;;         (message "Buffer '%s' is not visiting a file!" (buffer-name))
;;       (if (get-buffer name)
;;           (message "A buffer named '%s' already exists!" name)
;;         (progn
;;           (rename-file filename name 1)
;;           (rename-buffer name)
;;           (rename-uniquely)
;;           (set-visited-file-name name)
;;           ;; (set-buffer-modified-p nil)
;;           )))))

;; Originally from stevey, adapted to support moving to a new directory.
;; (defun rename-file-and-buffer (new-name)
;;   "Renames both current buffer and file it's visiting to NEW-NAME."
;;   (interactive
;;    (progn
;;      (if (not (buffer-file-name))
;;          (error "Buffer '%s' is not visiting a file!" (buffer-name)))
;;      (list (read-file-name (format "Rename %s to: " (file-name-nondirectory
;;                                                      (buffer-file-name)))))))
;;   (if (equal new-name "")
;;       (error "Aborted rename"))
;;   (setq new-name (if (file-directory-p new-name)
;;                      (expand-file-name (file-name-nondirectory
;;                                         (buffer-file-name))
;;                                        new-name)
;;                    (expand-file-name new-name)))
;;   ;; If the file isn't saved yet, skip the file rename, but still update the
;;   ;; buffer name and visited file.
;;   (if (file-exists-p (buffer-file-name))
;;       (rename-file (buffer-file-name) new-name 1))
;;   (let ((was-modified (buffer-modified-p)))
;;     ;; This also renames the buffer, and works with uniquify
;;     (set-visited-file-name new-name)
;;     (if was-modified
;;         (save-buffer)
;;       ;; Clear buffer-modified flag caused by set-visited-file-name
;;       (set-buffer-modified-p nil))
;;   (message "Renamed to %s." new-name)))

;; (with-eval-after-load "esh-opt"
;;   (autoload 'epe-theme-lambda "eshell-prompt-extras")
;;   (setq eshell-highlight-prompt nil
;;         eshell-prompt-function 'epe-theme-lambda))

(provide 'xop-functions)
