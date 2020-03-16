(with-eval-after-load 'org
  ;; highlight source code in in org-mode
  (setq org-src-fontify-natively t)

  ;; org-agenda
  (setq org-agenda-files '("~/Documents/tasks/org"))

  ;; use org-capture to take notes
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/Documents/tasks/org/gtd.org" "工作安排与进展")
	   "* TODO [#B] %?\n %i\n"
	   :empty-lines 1))))


(provide 'init-org)

