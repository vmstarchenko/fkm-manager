;; (require 'battery)
;; (display-battery-mode 1)
;; (defcustom battery-update-interval 1
;;   "*Seconds after which the battery status will be updated."
;;   :type 'integer
;;   :group 'battery)

;; (defun battery-update ()
;;   "Update battery status information in the mode line."
;;   ;; Задаём формат
;;   (setq battery-mode-line-format
;;         (if (and (< (string-to-int (downcase (cdr (assoc ?p (funcall battery-status-function))))) 100)
;; 							   (not (string= (downcase (cdr (assoc ?B (funcall battery-status-function)))) "unknown")))
;;             (concat
;;              "%p" ;; задяд батареи
;;              (if (string= (downcase (cdr (assoc ?B (funcall battery-status-function)))) "discharging")
;;                  "-"
;;                "+") ;; Заряжается ли
;;              (if (string= (downcase (cdr (assoc ?h (funcall battery-status-function)))) "0")
;;                  "%m"
;;                "%t") ;; Время в минутах до раз/зарядки
;;              )
;;           (concat (if (string= (downcase (cdr (assoc ?B (funcall battery-status-function)))) "discharging")
;;                       "-"
;;                     "+") ;; Заряжается ли
;;                   "FULL")
;;           ))
;; 	(if (and (< (string-to-int (downcase (cdr (assoc ?p (funcall battery-status-function))))) 25)
;; 					 (string= (downcase (cdr (assoc ?B (funcall battery-status-function)))) "discharging"))
;;       (set-cursor-color "#ff0000")) ;; todo: cursor-color, unset
;;   ;; Обновляем
;;   (setq battery-mode-line-string (propertize (if (and battery-mode-line-format
;;                                                       battery-status-function)
;;                                                  (battery-format
;;                                                   battery-mode-line-format
;;                                                   (funcall battery-status-function))
;;                                                "")
;;                                              'help-echo "Battery status information"))
;;   (force-mode-line-update))

(provide 'xop-battery)
