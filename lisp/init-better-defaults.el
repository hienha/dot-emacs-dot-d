;; inhibit ring bell
(setq ring-bell-function 'ignore)

;; show line number
(global-linum-mode t)

;; selection delete
(delete-selection-mode t)

;; Auto-load file
(global-auto-revert-mode t)

;; no auto-backup and auto-save
(setq make-backup-files nil)
(setq auto-save-default nil)

;; show smarter parentheses
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; recentf-mode
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 50)

;; abbrev-mode
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("vct" "vincent")
					    ;; emacs regex
					    ))

;; Indent regein ir 
(defun indent-buffer ()
  "Indent the current visited buffer"
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))


;; hippif expand is dabbrev expakd on stepoids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))
(provide 'init-better-defaults)

