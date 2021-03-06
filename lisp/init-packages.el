(require 'cl)

;;;;;;;;; customize settings ;;;;;;;
;; if your OS is MacOXX, you need add below settings.
(use-package exec-path-from-shell
  :if (and (eq system-type 'darwin) (display-graphic-p))
  :ensure t
  :pin melpa-stable
  :config
  (progn
    (when (string-match-p "/zsh$" (getenv "SHELL"))
      ;; Use a non-interactive login shell. A login shell, because my
      ;; environment variables are mostly set in `.zshenv'.
      (setq exec-path-from-shell-arguments '("-l")))

    (exec-path-from-shell-initialize)
    )
  )

(global-company-mode t)

(add-hook 'python-mode-hook
	  (lambda()
	    (set (make-local-variable 'company-backends) '((company-anaconda company-dabbrev-code) company-dabbrev))))

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

;; colemak-evilZ
;; (require 'colemak-evil)

;; Evil mode
(evil-mode t)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; evil-colemak-basics -- (comfortable for me)
(require 'evil-colemak-basics)
(global-evil-colemak-basics-mode)

;; window-numbering
(window-numbering-mode t)

;; evil-surround
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;; evilnc-default-hotkeys
(evilnc-default-hotkeys)

;; which-key
;; Allow C-h to trigger which-key before it is done automatically
(setq which-key-show-early-on-C-h t)
;; make sure which-key doesn't show normally but refreshes quickly after it is
;; triggered.
;; (setq which-key-idle-delay 10000)
(setq which-key-idle-secondary-delay 0.05)
(which-key-mode)
(which-key-setup-side-window-bottom)

(provide 'init-packages)
