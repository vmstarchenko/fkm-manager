;;; alarm.el --- Alarm

;;; Code:

(defvar alarm-clock-timer nil
  "Keep timer so that the user can cancel the alarm.")

(defun alarm-clock-message(text time)
  "The actual alarm action.
Argument TEXT alarm message."
	(interactive)
  (switch-to-buffer "*Alarm*")
	(insert (concat "Alarm clock is ringing.\n"
									"It's " time " now.\n"
									"You wanted: " text)))
(defun alarm-clock ()
  "Set an alarm.
The time format is the same accepted by `run-at-time'.  For
example \"11:30am\"."
  (interactive)
  (let ((time (read-string "Time (example, 11:30am): "))
        (text (read-string "Message: ")))
    (setq alarm-clock-timer (run-at-time time nil 'alarm-clock-message text time))))
(defun alarm-clock-cancel ()
  "Cancel the alarm clock."
  (interactive)
  (cancel-timer alarm-clock-timer))

(defun timer-message(text)
	(interactive)
  (switch-to-buffer "*Timer*")
  (kb-kill-beginning-of-buffer)
  (kb-kill-end-of-buffer)
  (insert (concat "Timer clock is ringing.\n" text)))

(defun timer()
  (interactive)
  (let* ((time (read-string "Duration in minutes (60 by default): " nil nil "60"))
         (text (read-string
                (concat "Message (\"" time " minutes passed.\" by default): ") nil nil
                (concat time " minutes passed."))))
    
    (run-with-timer (round (* (string-to-number time) 60))
                    nil 'timer-message text)
    (message (number-to-string (* (string-to-number time) 60)))
    (message (concat "Timer was set successfully. It will ring " time " minutes later."))))

(provide 'fkm:alarm)
;;; fkm:alarm.el ends here

;;; LocalWords:  el
