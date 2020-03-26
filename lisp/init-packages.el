(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu-tuna"    .  "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			   ("melpa-tuna"  .  "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

;; add whatever package you want here
(defvar vincent/packages '(
			   company
			   dracula-theme
			   monokai-theme
			   hungry-delete
			   counsel
			   swiper
			   smartparens
			   exec-path-from-shell
			   js2-mode
			   nodejs-repl
			   popwin
			   reveal-in-osx-finder
			   web-mode
			   js2-refactor
			   expand-region
			   iedit
			   org-pomodoro
			   helm-ag
			   flycheck
			   auto-yasnippet
			   base16-theme
			   snazzy-theme
			   ) "Default packages")
(setq package-selected-packages vincent/packages)

(defun vincent/packages-installed-p ()
  (loop for pkg in vincent/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (vincent/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg vincent/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;;;;;;;; customize settings ;;;;;;;
;; if your OS is MacOXX, you need add below settings.
(when (memq window-system '(mac ns))
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

(global-company-mode t)

;; Popwin mode
(require 'popwin)
(popwin-mode t)

;; hungry-delete mode
(require 'hungry-delete)
(global-hungry-delete-mode)

;; ivy-mode
(ivy-mode t)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(smartparens-global-mode t)
;; In Emacs-Lusp mode, Only one single quote appears
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)

;; Configure js2-mode for js files.
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))


;; Do What I Mean
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

;; expand-region
(require 'expand-region)

;; org pomodopo
(require 'org-pomodoro)

;; Flycheck mode only in js2mode
(add-hook 'js2-mode-hook 'flycheck-mode)

;; snippet
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'init-packages)
