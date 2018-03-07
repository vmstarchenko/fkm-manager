;;; Commentary:
;;; Code:

;;; docs-string
;; functions
;; python
(defun python-docs-string()
  (interactive)
  (end-of-line)
  (let* ((p (point))
         (spc "") size )
    (insert "\n")
    (indent-for-tab-command)
    (setq size (- (point) p 1))
    (while (not (eq size 0))
      (setq spc (concat spc " "))
      (setq size (- size 1)))
    (insert (concat "\"\"\"\n" spc))
    (save-excursion (insert (concat "\n" spc "\"\"\"")))))
;; c++
(defun cpp-docs-string()
  (interactive)
  (end-of-line)
  (insert "\n// ")
  (indent-for-tab-command))
;; lisp
(defun lisp-docs-string()
  (interactive)
  (end-of-line)
  (newline-and-indent)
  (insert "\"\"")
  (backward-char 1))
;; hooks
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
  (insert
   "private:\n  // members\nprotected:\n  // members\npublic:\n  // members\n  //\n  // member functions:\n  // |-+ constructors:\n  // | |-- default constructor\n  // | |-- copy constructor\n  // | |-- other constructor\n  // | |-- destructor\n  // | |-- operator=\n  // |\n  // |-+ element access:\n  // | |-- const (right value,  const)\n  // | |-- non const (left value, &)\n  // |\n  // |-+ capacity\n  // | |-- const (get data )\n  // | |-- non const (change size)\n  // |\n  // |-+ modifiers:\n  // | |-- add\n  // | |-- pop\n  // | |-- set\n  // |\n  // |-+ operations\n  // |\n  // |-+ friend functions\n  // | |-- streams\n  // |\n  // |-+ friend classes\n  // | |-+ iterators\n  // |   |-- functions\n  // |\n  //\n  // non-member function\n  // |-- swap\n  // |-- relational operators\n"))

;; Изменит перенос строк
(defun change-truncate-lines ()
  (interactive)
  (if (eq truncate-lines t)
      (setq-default truncate-lines nil)
    (if (eq visual-line-mode t)
        (progn (setq-default truncate-lines t)
               (visual-line-mode -1))
      (visual-line-mode)))
  (recenter))


(defun fkm:shell
    (&optional
     buffer)
  "Run an inferior shell, with I/O through BUFFER (which defaults to `*shell*').
Interactively, a prefix arg means to prompt for BUFFER.
If `default-directory' is a remote file name, it is also prompted
to change if called with a prefix arg.

If BUFFER exists but shell process is not running, make new shell.
If BUFFER exists and shell process is running, just switch to BUFFER.
Program used comes from variable `explicit-shell-file-name',
 or (if that is nil) from the ESHELL environment variable,
 or (if that is nil) from `shell-file-name'.
If a file `~/.emacs_SHELLNAME' exists, or `~/.emacs.d/init_SHELLNAME.sh',
it is given as initial input (but this may be lost, due to a timing
error, if the shell discards input when it starts up).
The buffer is put in Shell mode, giving commands for sending input
and controlling the subjobs of the shell.  See `shell-mode'.
See also the variable `shell-prompt-pattern'.

To specify a coding system for converting non-ASCII characters
in the input and output to the shell, use \\[universal-coding-system-argument]
before \\[shell].  You can also specify this with \\[set-buffer-process-coding-system]
in the shell buffer, after you start the shell.
The default comes from `process-coding-system-alist' and
`default-process-coding-system'.

The shell file name (sans directories) is used to make a symbol name
such as `explicit-csh-args'.  If that symbol is a variable,
its value is used as a list of arguments when invoking the shell.
Otherwise, one argument `-i' is passed to the shell.

\(Type \\[describe-mode] in the shell buffer for a list of commands.)"
  (interactive (list (and current-prefix-arg
                          (prog1 (read-buffer "Shell buffer: "
                                              ;; If the current buffer is an inactive
                                              ;; shell buffer, use it as the default.
                                              )
                            (if (file-remote-p default-directory)
                                ;; It must be possible to declare a local default-directory.
                                ;; FIXME: This can't be right: it changes the default-directory
                                ;; of the current-buffer rather than of the *shell* buffer.
                                (setq default-directory
                                      (expand-file-name
                                       (read-directory-name
                                        "Default directory: "
                                        default-directory
                                        default-directory t nil))))))))
  (setq buffer (if (or buffer
                       (not (derived-mode-p 'shell-mode))
                       (comint-check-proc (current-buffer)))
                   (get-buffer-create (generate-new-buffer-name
                                       "*shell*"))
                 ;; If the current buffer is a dead shell buffer, use it.
                 (current-buffer)))

  ;; On remote hosts, the local `shell-file-name' might be useless.
  (if (and (called-interactively-p 'any)
           (file-remote-p default-directory)
           (null explicit-shell-file-name)
           (null (getenv "ESHELL")))
      (with-current-buffer buffer
        (set (make-local-variable 'explicit-shell-file-name)
             (file-remote-p (expand-file-name (read-file-name
                                               "Remote shell path: "
                                               default-directory
                                               shell-file-name t
                                               shell-file-name))
                            'localname))))

  ;; The buffer's window must be correctly set when we call comint (so
  ;; that comint sets the COLUMNS env var properly).
  (switch-to-buffer buffer)
  (unless (comint-check-proc buffer)
    (let* ((prog (or explicit-shell-file-name
                     (getenv "ESHELL")
                     shell-file-name))
           (name (file-name-nondirectory prog))
           (startfile (concat "~/.emacs_" name))
           (xargs-name (intern-soft (concat "explicit-" name
                                            "-args"))))
      (unless (file-exists-p startfile)
        (setq startfile (concat user-emacs-directory "init_" name
                                ".sh")))
      (apply 'make-comint-in-buffer "shell" buffer prog (if
                                                            (file-exists-p
                                                             startfile)
                                                            startfile)
             (if (and xargs-name
                      (boundp xargs-name))
                 (symbol-value xargs-name)
               '("-i")))
      (shell-mode)))
  buffer)

;; (defun fkm:shell()
;;   (interactive)
;;   (pop-to-buffer-same-window (shell-get-buffer-create)))

;; Открыть терминал
(defun open-shell ()
  (interactive)
  (fkm:shell))
;; Открыть терминал в новом вертикальном окне
(defun open-shell-in-vwindow ()
  (interactive)
  (split-window-horizontally)
  (other-window 1)
  (open-shell))
;; Открыть терминал в новом горизонтальном окне
(defun open-shell-in-hwindow ()
  (interactive)
  (split-window-vertically)
  (other-window 1)
  (open-shell))

(defun open-eshell ()
  (interactive)
  (eshell)
  (beginning-of-buffer)
  (kb-kill-line)
  (delete-char 1)
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
      (progn (switch-to-buffer (get-buffer-create "*Python Buffer*"))
             (python-mode))))

(defun open-python-shell ()
  (interactive)
  (split-window-vertically)
  (check-python-mode)
  (python-shell-switch-to-shell)
  (other-window -1)
  (delete-window))
;; Открыть интерактивную оболочку python в новом вертикальном окне
(defun open-python-shell-in-vwindow ()
  (interactive)
  (split-window-horizontally)
  (check-python-mode)
  (python-shell-switch-to-shell))
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
  (delete-window))
;; Открыть slime в новом вертикальном окне
(defun open-slime-in-vwindow ()
  (interactive)
  (split-window-horizontally)
  (slime))
;; Открыть slime в новом горизонтальном окне
(defun open-slime-in-hwindow ()
  (interactive)
  (split-window-vertically)
  (other-window 1)
  (open-slime))

;; (defun next-shell-command() ;;; add other change name
;; 		(interactive)
;; 		(if (equal major-mode 'shell-mode)
;; 				(save-excursion (comint-next-input 1))
;; 		(if (equal major-mode 'minibuffer-inactive-mode)
;; 				(save-excursion (next-history-element 1)))))

(defun next-shell-command() ;;; add other change name
  (interactive)
  (case major-mode (shell-mode (save-excursion (comint-next-input 1)))
        (minibuffer-inactive-mode (save-excursion
                                    (next-history-element 1)))))

(defun previous-shell-command() ;;; add other change name
  (interactive)
  (case major-mode (shell-mode (save-excursion (comint-previous-input
                                                1)))
        (minibuffer-inactive-mode (save-excursion
                                    (previous-history-element 1)))))

(defun eshell-clear()
  (interactive)
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)
    (save-excursion (beginning-of-buffer)
                    (insert "You are welcome to Emacs Shell!"))))
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
(defun show-python-docs-in-vwindow
    (&rest
     ARGUMENTS)
  (interactive)
  (rope-show-doc ARGUMENTS)
  (other-window 1))

(defun show-c++-docs()
  (interactive)
  (manual-entry (current-word)))

(defun fkm:show-hotkeys()
  (interactive)
  (fkm:display-table-in-buffer
   fkm:kbds-config-header
   (fkm:get-kbds-config-table)
   "*Emacs Hotkeys*"))

(defun fkm:about-emacs ()
  (interactive)
  (switch-to-buffer "*Fkm:help*")
  (insert
   (substitute-command-keys
    "Oops. There is no help yet. \
But you can press <\\[fkm:show-hotkeys]> if you want all keybindings list")))

;; Передвинуть регион
(defun move-region
    (&optional
     n)
  "Indent the region, or otherwise the current line, by N spaces."
  (interactive "P")
  (if (eq nil n)
      (setq n 1))
  (let* ((use-region (and transient-mark-mode
                          mark-active))
         (rstart (if use-region (region-beginning)
                   (point-at-bol)))
         (rend   (if use-region (region-end)
                   (point-at-eol)))
         (deactivate-mark "irrelevant"))
    (if use-region (indent-rigidly rstart rend n)
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
  (save-excursion (delete-region (point)
                                 (progn (forward-word)
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
         (b (save-excursion (search-forward "\n" (point-max)
                                            (point-max)))))
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
  (save-excursion (delete-region (point)
                                 (progn (forward-paragraph)
                                        (point)))))
;; buffer
(defun kb-kill-beginning-of-buffer()
  (interactive)
  (delete-region (point-min)
                 (point))
  (beginning-of-buffer)
  (recenter))
(defun kb-kill-end-of-buffer()
  (interactive)
  (delete-region (point)
                 (point-max))
  (recenter))

;; change case
(defun upcase-previous-word ()
  (interactive)
  (save-excursion (backward-word)
                  (upcase-word 1)))
(defun downcase-previous-word ()
  (interactive)
  (save-excursion (backward-word)
                  (downcase-word 1)))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; перевести в русский
(defun turn-in-russian  (start end)
  "Russian recoding."
  (interactive "r")
  (setq eik-chartable (make-hash-table   :test 'equal))
  (puthash "q" "й" eik-chartable)
  (puthash "w" "ц" eik-chartable)
  (puthash "e" "у" eik-chartable)
  (puthash "r" "к" eik-chartable)
  (puthash "t" "е" eik-chartable)
  (puthash "y" "н" eik-chartable)
  (puthash "u" "г" eik-chartable)
  (puthash "i" "ш" eik-chartable)
  (puthash "o" "щ" eik-chartable)
  (puthash "p" "з" eik-chartable)
  (puthash "[" "х" eik-chartable)
  (puthash "]" "ъ" eik-chartable)
  (puthash "a" "ф" eik-chartable)
  (puthash "s" "ы" eik-chartable)
  (puthash "d" "в" eik-chartable)
  (puthash "f" "а" eik-chartable)
  (puthash "g" "п" eik-chartable)
  (puthash "h" "р" eik-chartable)
  (puthash "j" "о" eik-chartable)
  (puthash "k" "л" eik-chartable)
  (puthash "l" "д" eik-chartable)
  (puthash ";" "ж" eik-chartable)
  (puthash "'" "э" eik-chartable)
  (puthash "z" "я" eik-chartable)
  (puthash "x" "ч" eik-chartable)
  (puthash "c" "с" eik-chartable)
  (puthash "v" "м" eik-chartable)
  (puthash "b" "и" eik-chartable)
  (puthash "n" "т" eik-chartable)
  (puthash "m" "ь" eik-chartable)
  (puthash "," "б" eik-chartable)
  (puthash "." "ю" eik-chartable)
  (puthash "`" "ё" eik-chartable)
  (puthash "Q" "Й" eik-chartable)
  (puthash "W" "Ц" eik-chartable)
  (puthash "E" "У" eik-chartable)
  (puthash "R" "К" eik-chartable)
  (puthash "T" "Е" eik-chartable)
  (puthash "Y" "Н" eik-chartable)
  (puthash "U" "Г" eik-chartable)
  (puthash "I" "Ш" eik-chartable)
  (puthash "O" "Щ" eik-chartable)
  (puthash "P" "З" eik-chartable)
  (puthash "{" "Х" eik-chartable)
  (puthash "}" "Ъ" eik-chartable)
  (puthash "A" "Ф" eik-chartable)
  (puthash "S" "Ы" eik-chartable)
  (puthash "D" "В" eik-chartable)
  (puthash "F" "А" eik-chartable)
  (puthash "G" "П" eik-chartable)
  (puthash "H" "Р" eik-chartable)
  (puthash "J" "О" eik-chartable)
  (puthash "K" "Л" eik-chartable)
  (puthash "L" "Д" eik-chartable)
  (puthash ":" "Ж" eik-chartable)
  (puthash "\"" "Э" eik-chartable)
  (puthash "Z" "Я" eik-chartable)
  (puthash "X" "Ч" eik-chartable)
  (puthash "C" "С" eik-chartable)
  (puthash "V" "М" eik-chartable)
  (puthash "B" "И" eik-chartable)
  (puthash "N" "Т" eik-chartable)
  (puthash "M" "Ь" eik-chartable)
  (puthash "<" "Б" eik-chartable)
  (puthash ">" "Ю" eik-chartable)
  (puthash "~" "Ё" eik-chartable)
  (puthash "@" "\"" eik-chartable)
  (puthash "#" "№" eik-chartable)
  (puthash "$" ";" eik-chartable)
  (puthash "^" ":" eik-chartable)
  (puthash "&" "?" eik-chartable)
  (puthash "/" "." eik-chartable)
  (puthash "?" "," eik-chartable)
  (setq eik-str-out "")
  (setq eik-char-in "")
  (setq eik-char-out "")
  (setq eik-i start)
  (while (< eik-i end)
    (setq eik-char-in
          (buffer-substring-no-properties
           eik-i
           (+ eik-i 1)))
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
  (puthash "й" "q" eik-chartable)
  (puthash "ц" "w" eik-chartable)
  (puthash "у" "e" eik-chartable)
  (puthash "к" "r" eik-chartable)
  (puthash "е" "t" eik-chartable)
  (puthash "н" "y" eik-chartable)
  (puthash "г" "u" eik-chartable)
  (puthash "ш" "i" eik-chartable)
  (puthash "щ" "o" eik-chartable)
  (puthash "з" "p" eik-chartable)
  (puthash "х" "[" eik-chartable)
  (puthash "ъ" "]" eik-chartable)
  (puthash "ф" "a" eik-chartable)
  (puthash "ы" "s" eik-chartable)
  (puthash "в" "d" eik-chartable)
  (puthash "а" "f" eik-chartable)
  (puthash "п" "g" eik-chartable)
  (puthash "р" "h" eik-chartable)
  (puthash "о" "j" eik-chartable)
  (puthash "л" "k" eik-chartable)
  (puthash "д" "l" eik-chartable)
  (puthash "ж" ";" eik-chartable)
  (puthash "э" "'" eik-chartable)
  (puthash "я" "z" eik-chartable)
  (puthash "ч" "x" eik-chartable)
  (puthash "с" "c" eik-chartable)
  (puthash "м" "v" eik-chartable)
  (puthash "и" "b" eik-chartable)
  (puthash "т" "n" eik-chartable)
  (puthash "ь" "m" eik-chartable)
  (puthash "б" "," eik-chartable)
  (puthash "ю" "." eik-chartable)
  (puthash "ё" "`" eik-chartable)
  (puthash "Й" "Q" eik-chartable)
  (puthash "Ц" "W" eik-chartable)
  (puthash "У" "E" eik-chartable)
  (puthash "К" "R" eik-chartable)
  (puthash "Е" "T" eik-chartable)
  (puthash "Н" "Y" eik-chartable)
  (puthash "Г" "U" eik-chartable)
  (puthash "Ш" "I" eik-chartable)
  (puthash "Щ" "O" eik-chartable)
  (puthash "З" "P" eik-chartable)
  (puthash "Х" "{" eik-chartable)
  (puthash "Ъ" "}" eik-chartable)
  (puthash "Ф" "A" eik-chartable)
  (puthash "Ы" "S" eik-chartable)
  (puthash "В" "D" eik-chartable)
  (puthash "А" "F" eik-chartable)
  (puthash "П" "G" eik-chartable)
  (puthash "Р" "H" eik-chartable)
  (puthash "О" "J" eik-chartable)
  (puthash "Л" "K" eik-chartable)
  (puthash "Д" "L" eik-chartable)
  (puthash "Ж" ":" eik-chartable)
  (puthash "Э" "\"" eik-chartable)
  (puthash "Я" "Z" eik-chartable)
  (puthash "Ч" "X" eik-chartable)
  (puthash "С" "C" eik-chartable)
  (puthash "М" "V" eik-chartable)
  (puthash "И" "B" eik-chartable)
  (puthash "Т" "N" eik-chartable)
  (puthash "Ь" "M" eik-chartable)
  (puthash "Б" "<" eik-chartable)
  (puthash "Ю" ">" eik-chartable)
  (puthash "Ё" "~" eik-chartable)
  (puthash "\"" "@" eik-chartable)
  (puthash "№" "#" eik-chartable)
  (puthash ";" "$" eik-chartable)
  (puthash ":" "^" eik-chartable)
  (puthash "?" "&" eik-chartable)
  (puthash "." "/" eik-chartable)
  (puthash "," "?" eik-chartable)
  (setq eik-str-out "")
  (setq eik-char-in "")
  (setq eik-char-out "")
  (setq eik-i start)
  (while (< eik-i end)
    (setq eik-char-in
          (buffer-substring-no-properties
           eik-i
           (+ eik-i 1)))
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

;; reload fkm-mode
(defun reload-fkm-mode()
  "reload fkm-mode"
  (interactive)
  (load "fkm-mode"))

;; css-colors
(defun hex-color ()
  "Syntax color text of the form #ff1100 in current buffer"
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[abcdef[:digit:]]\\{3,9\\}" (0 (put-text-property
                                        (match-beginning 0)
                                        (match-end 0) 'face (list
                                                             :background
                                                             (match-string-no-properties
                                                              0)
                                                             :foreground
                                                             (color-complement-hex
                                                              (match-string-no-properties
                                                               0))))))))
  (font-lock-fontify-buffer))

(defun indent()
  "Indent the region or all buffer if dont user region."
  (interactive)
  (save-excursion (let* ((use-region (and transient-mark-mode
                                          mark-active))
                         (rstart (if use-region (region-beginning)
                                   (point-min)))
                         (rend   (if use-region (region-end)
                                   (point-max))))
                    (indent-region rstart rend)))
  (deactivate-mark "irrelevant"))

(defun clang-format-auto ()
  "Correct style by clang-format in the region or all
   buffer if dont user region."
  (interactive)
  (save-excursion
    (let* ((use-region (and transient-mark-mode
                            mark-active))
           (rstart (if use-region
                       (region-beginning)
                     (point-min)))
           (rend (if use-region
                     (region-end)
                   (point-max))))
      (clang-format-region
       rstart
       rend)))
  (deactivate-mark "irrelevant"))

;; TODO: handle shell-command errors
;; TODO: rm tmp-file-name with concat with filename?
(defmacro define-formatter (formatter-name command tmp-file-path)
  "Create formatter. Command must be abled to called from shell."
  ;; TODO: here check path
  ;; TODO: really save-buffer ?
  `(defun ,formatter-name ()
     (interactive)
     (save-buffer)
     (let* ((command ,command)
            (filename (buffer-file-name (current-buffer)))
            (tmp-file (concat "" ,tmp-file-path
                              ;; (file-name-nondirectory filename)
                              ))
            (use-region (and transient-mark-mode
                             mark-active))
            (p (point))
            (rstart (if use-region (region-beginning)
                      (point-min)))
            (rend (if use-region (region-end)
                    (point-max))))
       (if (not (eq filename nil))
           (progn (write-region rstart rend tmp-file)
                  (message (concat command tmp-file))
                  (shell-command (concat command tmp-file))
                  (delete-region rstart rend)
                  (insert-file-contents tmp-file)
                  (message ,(format "%s was used successfully"
                                    formatter-name))
                  (goto-char p))))))

(define-formatter
  pyformat
  "pyformat -i "
  "/tmp/#.emacs.formatter")
(define-formatter
  scssformat
  "csscomb -c ~/.csscomb.json "
  "/tmp/#.emacs.formatter")

(defun fkm:elformat-buffer ()
  (interactive)
  (message "wait...")
  (save-excursion
    (goto-char (point-max))
    (lispy-alt-multiline t)
    (lispy-up 1)
    (do
        ((position-value (point))
         (prev-position-value -1))
        ((= position-value
            prev-position-value))
      (lispy-alt-multiline t)
      (setq prev-position-value
            position-value)
      (lispy-up 1)
      (setq position-value (point))))
  (message "Elformat finished."))


(defun fkm:elformat ()
  (interactive)
  (lispy-alt-multiline nil))


(defun switch-flycheck()
  "turn on or off flycheck"
  (interactive)
  (let ((active-modes))
    (mapc (lambda (mode)
            (condition-case nil (if (and (symbolp mode)
                                         (symbol-value mode))
                                    (add-to-list 'active-modes mode))
              (error
               nil))) minor-mode-list)
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
  (let* ((use-region (and transient-mark-mode
                          mark-active))
         (rstart (if use-region (region-beginning)
                   (progn (insert " ")
                          (backward-char)
                          (point))))
         (rend   (if use-region (region-end)
                   (+ (point) 1))))
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
  (interactive (list (read-string "Zoom value: ")))
  (setq zoom-value (string-to-number arg))
  (set-face-attribute 'default nil
                      :height zoom-value))

(defun zoom+()
  (interactive)
  (setq zoom-value (+ zoom-value zoom-step))
  (set-face-attribute 'default nil
                      :height zoom-value))

(defun zoom-()
  (interactive)
  (setq zoom-value (- zoom-value zoom-step))
  (if (< zoom-value zoom-min-value)
      (progn
        (setq zoom-value zoom-min-value)
        (message "It's too little value")))
  (set-face-attribute 'default nil
                      :height zoom-value))


;; (defadvice fill-paragraph (around advice-fill-paragraph activate)
;;   "interactive ask about required line width and save this value"
;;   (interactive)
;;   (let* ((input (read-string (format "Max line width (current %d): "
;;                                      fill-column)))
;;          (value (string-to-number input)))
;;     (if (not (eq value 0))
;;         (setq fill-column value)))
;;   ad-do-it)

;; TODO fix from to values
;; (defadvice fill-region (around advice-fill-region activate)
;;   "interactive ask about required line width and save this value"
;;   (interactive)
;;   (let* ((input (read-string
;;                  (format "Max line width (current %d): " fill-column)))
;;          (value (string-to-number input)))
;;     (if (not (eq value 0))
;;         (setq fill-column value)))
;;   ad-do-it)

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

(defun fkm:ac-start()
  (interactive)
  (unless (auto-complete-mode)
    (auto-complete-mode t))
  (ac-start))

(defmacro fkm:define-keymap (name)
  "Expanded macros is definition of keymap"
  `(defvar ,name (make-sparse-keymap)
     "Autogenerated keymap"))

;; (defun apply-macro (macro arg-list)
;;   (eval
;;    `(,macro ,@(loop for arg in arg-list
;;                  collect `(quote ,arg)))))
;; (defmacro fkm:define-keymaps (maps)

;;   (mapcar
;;    '(lambda (name)
;;       (eval `(defvar ,name (make-sparse-keymap)
;;                "Autogenerated keymap")))
;;    maps))

;; (mapcar
;;  '(lambda (name)
;;    (eval `(defvar ,name (make-sparse-keymap)
;;             "If it wants to be reversible, it must save the former state.")))
;;  '(fkm:a fkm:b fkm:c))
;; (fkm:define-keymaps '(fkm:a fkm:b fkm:c))
;; (dolist (map '(fkm:a fkm:b fkm:c))
;;   (print map)
;;   (fkm:define-keymap map))
;; (apply-macro 'fkm:define-keymap '(fkm:a fkm:b))

(defmacro fkm:unset-kbds (keymap hook kbds)
  "Unset kbds for map for mode-hook
Example:
  (fkm:unset-kbds org-mode-map org-mode-hook '(\"M-RET\" \"C-y\"))"
  `(add-hook ',hook '(lambda ()
                       (dolist (key ,kbds)
                         (define-key ,keymap (kbd key) nil)))))


(defun fkm:make-tabulated-headers (column-names rows)
  "column width are calculated by picking the max width of every cell under that
column + the column name"
  (let ((widths
         (-reduce-from
          (lambda (acc x)
            (-zip-with (lambda (l r) (max l (length r))) acc (append x '())))
          (-map #'length columns-names)
          rows)))
    (cl-map
     #'vector #'identity
     (-zip-with
      (lambda (col size) (list col size nil))
      columns-names widths))))

(defun fkm:display-table-in-buffer (columns-names rows buffer-name)
  "Create new buffer and display there table with headers"
  (let ((headers (fkm:make-tabulated-headers columns-names rows)))
    (with-current-buffer (get-buffer-create buffer-name)
      (tabulated-list-mode)
      (setq show-trailing-whitespace nil)
      (setq tabulated-list-format headers)
      (setq tabulated-list-padding 2)
      (tabulated-list-init-header)
      (setq tabulated-list-entries
            (-zip-with
             (lambda (i x) (list i x))
             (-iterate '1+ 0 (length rows))
             rows))
      (tabulated-list-print t)
      (switch-to-buffer buffer-name)
      )))



;; (defmacro a(l)
;;   `( (key l)
;;     (print key)))
;; (macroexpand-1 '(a (1 2 3)))
;; (print (macroexpand-1 '(fkm:unset-kbds js2-mode-map js2-mode-hook ("C-M-1"))))
;; (setq maps '(a b c d))
;; (while maps
;;   (print maps)
;;   (fkm:define-keymap (car maps))
;;   (setq maps (cdr maps)))

(defun fkm:find-file()
  (interactive)
  (if (projectile-project-p)
      (helm-projectile-find-file)
    (helm-find-files nil)))


(provide 'fkm:utils)
