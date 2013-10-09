
;;(global-set-key [(control b) (control t)] 'list-buffers-other-win)


;;;;
;
; My own personal keybindings.
;

(global-set-key [(control x) (control j)] 'journal)
(global-set-key [("control x") ("control j")] 'list-buffers-other-win)
(global-set-key [("meta s")] 'search-backwards)


;;(global-set-key [(control tab)] 'crs-bury-buffer) ; cycle through buffer
;;(global-set-key [(control meta tab)] (lambda () (interactive)
;;                                      (crs-bury-buffer -1))); reverse cycle

;; (global-set-key [(quote [f6])] 'kill-entire-buffer)


;; (global-set-key [(meta left)]  'goto-matching-paren)
;; (global-set-key [(meta right)] 'goto-matching-paren)


;; ;; at the begining C-x b scrolled the cursor one step towards left
;; (global-unset-key [(control b)]); b as Bilou!!
;; (global-set-key [(control b) (control m)] 'compile) ; launches make
;; (global-set-key [(control b) (control d)] 'd2u-buffer)  ; dos -> unix
;; (global-set-key [(control b) (control v)] 'vc-load-vc-hooks); launches vc
;; ;; takes next errors, and edit concerned file
;; (global-set-key [(control b) (control n)] 'next-error) 
;; (global-set-key [(control b) (control r)] 'revert-buffer) ;reload from disk
;; (global-set-key [(control b) (control p)] 'load-projet) ;load project-file
;; (global-set-key [(control b) (control c)] 'comment-or-uncomment-region)
;; (global-set-key [(control b) (control g)] 'goto-line)
;; (global-set-key [(control b) (control i)] 'indent-region)
;; ;; load tramp on tp
;; ;; (global-set-key [(control b) (control t)] 'load-tp)



;; ; wheel down(up): goes upward (downward) of 5 lines
;; (global-set-key [button5] '(lambda () (interactive) (scroll-up 5)))
;; (global-set-key [button4] '(lambda () (interactive) (scroll-down 5)))
;; ;; set f1 to manual, f2 to man current-word
;; (global-set-key [(f1)] 'bm-man)
;; (global-set-key [(f2)] '(lambda () (interactive) (bm-man(current-word))))
;; ;; unset insert, so not to toggle to overwrite-mode
;; (global-unset-key [(insert)])


;; ;; C-c f does filename completion
;; (global-set-key [(kbd "C-c f")] 'comint-dynamic-complete-filename)
;; ;; redefine C-x C-b for a better buffer menu
;; (global-set-key [(kbd "C-x C-b")] 'buffer-menu)

