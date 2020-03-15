(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; Pricess new line with DOS 
(defun hiddep-dos-eol ()
  "Don't show ^M in files containing mixed UNIX and DOS line endinds."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with UNIX eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match)))


(provide 'init-func)
