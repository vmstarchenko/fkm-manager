;; stop asking whether to save newly added abbrev when quitting emacs
(setq save-abbrevs nil)

;; turn on abbrev mode
(setq-default abbrev-mode t)
;; (add-hook 'LaTeX-mode-hook '(lambda() (setq abbrev-mode nil)))

(setq abbrev-file-name "~/.emacs") ;; stop loading other abbrevs
(kill-all-abbrevs)

(define-abbrev-table 'global-abbrev-table
	'(
    ;; words
		("te" "temporary")
		("aux" "auxiliary")
		("s" "spare")
		("c" "current")
		
		("ix" "index")
		
		("l" "left")
		("r" "right")
		("m" "middle")
		
		("ch" "child")
		
		("ctr" "counter")
		("ptr" "pointer")
		("itr" "iterator")
		("iter" "iterator")
		;; c++ flags
		("c98" "-std=c++98")
		("c11" "-std=c++11")
		("c14" "-std=c++14")
		;; built in
		("ret" "return")
		("wh" "while")
    ))

(define-abbrev-table 'c++-mode-abbrev-table
	'(
		;; c++ built in
		("inc" "include")
		("io" "iostream")
		("cin" "std::cin >>")
		("cout" "std::cout <<")
		("endl" "std::endl")
		("elif" "else if")
		("pub" "public")
		("pri" "private")
		;; constructions
		("deb" "if (DEBUG)")
		))

(define-abbrev-table 'python-mode-abbrev-table
	'(
		;; constructions
		("deb" "if DEBUG:")
    ("else if" "elif")
		))

(provide 'xop-abbrev)
