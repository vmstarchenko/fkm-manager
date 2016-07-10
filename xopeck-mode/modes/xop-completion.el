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

;; latex completion
;;(add-to-list 'load-path "~/elisp")
;;(require 'ac-math)
;;(add-to-list 'ac-modes 'latex-mode)
;;(defun ac-latex-mode-setup ()
;;  (setq ac-sources
;;        (append '(ac-source-math-latex ac-source-latex-commands  ac-source-;math-unicode)
;;                ac-sources)))
;;(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)

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

(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)

(provide 'xop-completion)
