;;;;
;
; Load configuration files.
;
(if (file-exists-p "~/.emacs.d/conf/functions.el")
  (load-file "~/.emacs.d/conf/functions.el")
)
(if (file-exists-p "~/.emacs.d/conf/keybindings.el")
  (load-file "~/.emacs.d/conf/keybindings.el")
)
;; Insertion of Dates.
;; (defun insert-date-string ()
;;   "Insert a nicely formated date and time string."
;;   (interactive)                                   
;;   (insert (format-time-string "%Y-%m-%d"))
;; )
