;;; moz-controller.el --- Control Firefox from Emacs

;;; Code:
(require 'moz)

(defgroup moz-controller nil
  "Control Firefox from Emacs"
  :group 'moz-controller)

(defcustom moz-controller-zoom-step 0.1
  "Zoom step, default to 0.1, it is supposed to be a positive number."
  :group 'moz-controller
  :type 'number)

(defvar moz-controller-mode-map nil
  "Keymap for controlling Firefox from Emacs.")

(defvar moz-controller-mode-hook nil
  "Hook to run upon entry into moz-controller-mode.")

(defvar moz-controller-repl-output ""
  "Output from *MozRepl*.")

(defvar moz-controller-repl-output-tag ""
  "Output tag from *MozRepl*.")

(defun moz-controller-repl-filter (proc string)
  "Filter function of *MozRepl*.
It gets the useful output of *MozRepl*, store it in `moz-controller-repl-output` and `kill-ring`"
  (when (buffer-live-p (process-buffer proc))
    (unless (string= string "repl> ")   ; ignore empty output (page up, page down, etc)
      (setq moz-controller-repl-output
            (replace-regexp-in-string "\"\\(.+\\)\"\nrepl> " "\\1" string))
      (setq moz-controller-repl-output-tag
            (replace-regexp-in-string "^\\(#moz-controller-.+#\\) .*" "\\1" moz-controller-repl-output))
      (if (string= moz-controller-repl-output-tag "#moz-controller-get-current-url#")
          (progn
            (setq moz-controller-repl-output (replace-regexp-in-string
                                              (concat moz-controller-repl-output-tag " ")
                                              "" moz-controller-repl-output))
            (message moz-controller-repl-output)
            (kill-new moz-controller-repl-output) ; append to kill-ring
            ))
      )
    (with-current-buffer (process-buffer proc)
      (let ((moving (= (point) (process-mark proc))))
        (save-excursion
          ;; Insert the text, advancing the process marker.
          (goto-char (process-mark proc))
          (insert string)
          (set-marker (process-mark proc) (point)))
        (if moving (goto-char (process-mark proc)))))))

(defmacro defun-moz-controller-command (name arglist doc &rest body)
  "Macro for defining moz commands.
NAME: function name.
ARGLIST: should be an empty list () .
DOC: docstring for the function.
BODY: the desired JavaScript expression, as a string."
  `(defun ,name ,arglist
     ,doc
     (interactive)
     (comint-send-string
      (inferior-moz-process)
      ,@body)
     )
  )

(defun-moz-controller-command moz-controller-page-refresh ()
  "Refresh current page"
  "setTimeout(function(){content.document.location.reload(true);}, '500');"
  )

(defun-moz-controller-command moz-controller-page-down ()
  "Scroll down the current window by one page."
  "content.window.scrollByPages(1);"
  )

(defun-moz-controller-command moz-controller-page-up ()
  "Scroll up the current window by one page."
  "content.window.scrollByPages(-1);"
  )

(defun-moz-controller-command moz-controller-next-line ()
  "Scroll down the current window by three lines."
  "content.window.scrollByLines(3);"
  )

(defun-moz-controller-command moz-controller-prev-line ()
  "Scroll up the current window by three lines."
  "content.window.scrollByLines(-3);"
  )

(defun-moz-controller-command moz-controller-tab-close ()
  "Close current tab"
  "content.window.close();"
  )

(defun-moz-controller-command moz-controller-zoom-in ()
  "Zoom in"
  (concat "gBrowser.selectedBrowser.markupDocumentViewer.fullZoom += "
          (number-to-string moz-controller-zoom-step) ";")
  )

(defun-moz-controller-command moz-controller-zoom-out ()
  "Zoom out"
  (concat "gBrowser.selectedBrowser.markupDocumentViewer.fullZoom -= "
          (number-to-string moz-controller-zoom-step) ";")
  )

(defun-moz-controller-command moz-controller-zoom-reset ()
  "Zoom in"
  "gBrowser.selectedBrowser.markupDocumentViewer.fullZoom = 1"
  )

(defun-moz-controller-command moz-controller-tab-previous ()
  "Switch to the previous tab"
  "getBrowser().mTabContainer.advanceSelectedTab(-1, true);"
  )

(defun-moz-controller-command moz-controller-tab-next ()
  "Switch to the next tab"
  "getBrowser().mTabContainer.advanceSelectedTab(1, true);"
  )

(defun-moz-controller-command moz-controller-view-page-source ()
  "View current page source code."
  "BrowserViewSourceOfDocument(gBrowser.contentDocument);"
  )

(defun-moz-controller-command moz-controller-get-current-url ()
  "Get the current tab's URL and add to kill-ring."
  "'#moz-controller-get-current-url# ' + gBrowser.contentWindow.location.href;"
  )

(unless moz-controller-mode-map
  (setq moz-controller-mode-map
        (let ((moz-controller-map (make-sparse-keymap)))
          moz-controller-map)))

;;;###autoload
(define-minor-mode moz-controller-mode
  "Toggle moz-controller mode.
With no argument, the mode is toggled on/off.
Non-nil argument turns mode on.
Nil argument turns mode off.
Commands:
\\{moz-controller-mode-map}
Entry to this mode calls the value of `moz-controller-mode-hook'."

  :init-value nil
  :lighter " MozC"
  :group 'moz-controller
  :keymap moz-controller-mode-map

  (if (get-buffer-process "*MozRepl*")
      (set-process-filter (get-buffer-process "*MozRepl*") 'moz-controller-repl-filter))
  (if moz-controller-mode
      (run-mode-hooks 'moz-controller-mode-hook)))

;;;###autoload
(define-globalized-minor-mode moz-controller-global-mode
  moz-controller-mode
  moz-controller-on)

(defun moz-controller-on ()
  "Enable moz-controller minor mode."
  (moz-controller-mode t))

(defun moz-controller-off ()
  "Disable moz-controller minor mode."
  (moz-controller-mode nil))

(defun moz-controller-global-on ()
  "Enable moz-controller global minor mode."
  (moz-controller-global-mode t)
  )

(defun moz-controller-global-off ()
  "Disable moz-controller global minor mode."
  (moz-controller-global-mode nil)
  )

(provide 'moz-controller)
;;; moz-controller.el ends here
