;; start auto-complete with emacs
;; todo: auto completeon doesnt work with newline 
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; show menu automatically
(setq ac-show-menu-immediately-on-auto-complete t)
;; dont show automatically
;;(setq ac-auto-show-menu t)
;;(setq ac-auto-start nil)

(defun configure-auto-complete-for-scss ()
  (add-to-list 'ac-sources 'ac-source-css-property))
(add-hook 'scss-mode-hook 'configure-auto-complete-for-scss)
(add-to-list 'ac-modes 'scss-mode)

(defun configure-auto-complete-for-web-mode ()
  (add-to-list 'ac-modes 'web-mode)
  (add-to-list 'ac-modes 'ac-emmet))
(add-hook 'web-mode-hook 'configure-auto-complete-for-web-mode)



;; latex completion
;;(add-to-list 'load-path "~/elisp")

(require 'ac-math)
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`
(defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
  (setq ac-sources
        (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                ac-sources)))
(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
(setq ac-math-unicode-in-math-p t)

;; autocomplete c-headers
;;(defun ac-c-header-init ()
;;  (require 'auto-complete-c-headers)
;;  (add-to-list 'ac-sources 'ac-source-c-headers)
;;                                        ;(add-to-list 'achead:include-directories '("/Applications/Xcode.app/Contents/Developer/usr/llvm-gcc-4.2/lib/gcc/i686-apple-darwin11/4.2.1/include" "/usr/include"))
;;  )
;;(add-hook 'c++-mode-hook 'ac-c-header-init)
;;(add-hook 'c-mode-hook 'ac-c-header-init)

;; ac-html
;; (defun setup-ac-for-html ()
;;   (require 'ac-haml)
;; 	(require 'ac-html)
;;   (require 'ac-html-default-data-provider)
;;   (ac-html-enable-data-provider 'ac-html-default-data-provider)
;;   (auto-complete-mode))

;; (add-hook 'html-mode-hook 'setup-ac-for-html)
;; (set-default 'ac-sources
;; 			'(ac-source-abbrev
;; 				ac-source-dictionary
;; 				ac-source-yasnippet
;; 				ac-source-words-in-buffer
;; 				ac-source-words-in-same-mode-buffers))
;; ;;				ac-source-semantic))

;; jedi completion
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)
;; (setq jedi:complete-on-dot t) ;; doesnt work ?? 

;; bash completion (and shell)
(require 'shell)
(add-to-list 'ac-modes 'shell-mode)
(add-to-list 'ac-modes 'bash-mode)

(require 'readline-complete)
(setq explicit-shell-file-name "bash")
(setq explicit-bash-args '("-c" "export EMACS=; stty echo; bash"))
(setq comint-process-echoes t)

(add-hook 'shell-mode-hook 'ac-rlc-setup-sources)
(add-hook 'shell-mode-hook
          '(lambda() (setq ac-sources ac-source-files-in-current-dir)))
(add-hook 'bash-mode-hook
          '(lambda() (setq ac-sources ac-source-files-in-current-dir)))

(company-mode)
(push 'company-readline company-backends)
(add-hook 'rlc-no-readline-hook (lambda () (company-mode -1)))

(provide 'xop-completion)
