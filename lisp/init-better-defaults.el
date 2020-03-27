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

;; ===
;; === show smarter parentheses
;; === `define-advice` only apply on emacs v25 version
;; ===
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

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

;; dired mode
;; reuse current buffer by pressing "a"
(put 'dired-find-alternate-file 'disabled nil)

;; always delete, copy recursive
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; If non-nil, Dired tries to guess a default target directory.
;; This means: if there is a Dired buffer displayed in the next
;; window, use its current directory, instead of this Dired buffer’s
;; current directory.
(setq dired-dwim-target t)

;; less typing when Emacs ask you yes or notice
(fset 'yes-or-no-p 'y-or-n-p)

;; allow you to jump to current directory with dired mode
(require 'dired-x)

;; Settings default fncoding
(set-language-environment "UTF-8")

(provide 'init-better-defaults)
