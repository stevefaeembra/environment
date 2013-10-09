(defun list-buffers-other-win ()
 "Opens list-buffers and put focus on it"
 (interactive)
 (list-buffers)
 (other-window 1)
 (delete-other-windows))

;;;;
;
; My own personal functions.
;
(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (espresso--proper-indentation parse-status))
           node)

     (save-excursion
       ;; I like to indent case and labels to half the tab width.
       (back-to-indentation)
       (if (looking-at "case\\s-")
           (setq indentation (+ indentation (/ espresso-indent-level 2))))

       ;; Consecutive declarations in a var statement are nice if properly aligned. i.e.
       ;;
       ;; var fo0 = "bar",
       ;;           "foo";
       (setq node (js2-node-at-point))
       (when (and node
                  (= js2-NAME (js2-node-type node))
                  (= js2-VAR (js2-node-type (js2-node-parent node))))
         (setq indentation (+ 4 indentation))))

     (indent-line-to indentation)
     (when (> offset 0) (forward-char offset)))))

(defun my-indent-sexp ()
  (interactive)
  (save-restriction
    (save-excursion
      (widen)
      (let* ((inhibit-point-motion-hooks t)
             (parse-status (syntax-ppss (point)))
             (beg (nth 1 parse-status))
             (end-marker (make-marker))
             (end (progn (goto-char beg) (forward-list) (point)))
             (ovl (make-overlay beg end)))
        (set-marker end-marker end)
        (overlay-put ovl 'face 'highlight)
        (goto-char beg)
        (while (< (point) (marker-position end-marker))
          ;; Don't re-indent blank lines so we don't set the "buffer
          ;; modified" property for nothing.
          (beginning-of-line)
          (unless (looking-at "\\s-*$")
            (indent-according-to-mode))
          (forward-line))
        (run-with-timer 0.5 nil '(lambda(ovl)
                                   (delete-overlay ovl)) ovl)))))

(defun my-js2-mode-hook ()
  (require 'espresso)
  (setq espresso-indent-level 2
        indent-tabs-mode nil
        c-basic-offset 8)
  (c-toggle-auto-state 0)
  (c-toggle-hungry-state 1)
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
  (define-key js2-mode-map [(meta control |)] 'cpan-lineup)
  (define-key js2-mode-map [(meta control \;)]
    '(lambda()
       (interactive)
       (insert "/* -----[ ")
       (save-excursion
         (insert " ] ----- */"))
       ))
    (define-key js2-mode-map [(return)] 'newline-and-indent)
    (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
    (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)
    (define-key js2-mode-map [(control meta q)] 'my-indent-sexp)
    (if (featurep 'js2-highlight-vars)
      (js2-highlight-vars-mode))
    (message "My JS2 Hook"))

(add-hook 'js2-mode-hook 'my-js2-mode-hook)


;; Welcome message, used when emacs first loads.
(defun emacs-reloaded ()
  (animate-string (concat ";; Initialization sucessful.  Welcome to "
                  (substring (emacs-version) 0 16) ".") 0 0)
  (sit-for 1)
  (newline-and-indent) (newline-and-indent)
)

;; Shortcut to .emacs file.
(defun dotemacs ()
  (interactive)
  (find-file "~/.emacs")
)

;; to change ASCII files from DOS to UNIX
(defun d2u-buffer ()
  "Convert dos buffer to unix"  ; description for C-h f
  (interactive)			; can be execute
  (save-excursion		; cursor goes back at the current point after
    (goto-char (point-min))	; cursor at the beginning of the buffer
    (while (search-forward "\r" nil t) 
      (replace-match "")
    )
  )
)

;; Insertion of Dates.
(defun insert-datetime-string ()
  "Insert a nicely formated date and time string."
  (interactive)
  (insert (format-time-string "%a %b %d %H:%M:%S %Y"))
)
  
; Specify the directory where journal entries are kept.
(defun journal ()
  (interactive)
;  (find-file (read-from-minibuffer "Journal to use:"))
  (find-file (read-file-name "Journal to use:"))
  (beginning-of-buffer)
  (insert "\n\n\n")
  (insert "*")
  (insert-datetime-string)
  (insert "\n\n")
)






;; (defun goto-matching-paren (arg)
;; (interactive "p")
;; (cond ((looking-at "[([{]") (forward-sexp 1) (backward-char))
;;       ((looking-at "[])}]") (forward-char) (backward-sexp 1))))



; ###################### necessary support function for buffer burial
;; (defun crs-delete-these (delete-these from-this-list)
;;   "Delete DELETE-THESE FROM-THIS-LIST."
;;   (cond
;;    ((car delete-these)
;;     (if (member (car delete-these) from-this-list)
;;         (crs-delete-these (cdr delete-these) (delete (car delete-these)
;;                                                  from-this-list))
;;       (crs-delete-these (cdr delete-these) from-this-list)))
;;    (t from-this-list)))

; this is the list of buffers I never want to see
;; (defvar crs-hated-buffers
;;    '("KILL" "*Compile-Log*" "*Compile-Log-Show*" "*compilation*" "*Completions*"))

; might as well use this for both
;; (setq iswitchb-buffer-ignore (append '("^ " "*Buffer") crs-hated-buffers))

;; (defun crs-hated-buffers ()
;;   "List of buffers I never want to see, converted from names to buffers."
;;   (delete nil
;;           (append
;;            (mapcar 'get-buffer crs-hated-buffers)
;;            (mapcar (lambda (this-buffer)
;;                      (if (string-match "^ " (buffer-name this-buffer))
;;                          this-buffer))
;;                    (buffer-list)))))

; I'm sick of switching buffers only to find KILL right in front of me
;; (defun crs-bury-buffer (&optional n)
;;   (interactive)
;;   (unless n
;;     (setq n 1))
;;   (let ((my-buffer-list (crs-delete-these (crs-hated-buffers)
;;                                           (buffer-list (selected-frame)))))
;;     (switch-to-buffer
;;      (if (< n 0)
;;          (nth (+ (length my-buffer-list) n)
;;               my-buffer-list)
;;        (bury-buffer)
;;        (nth n my-buffer-list)))))

; #################### end of necessary support function for buffer burial

