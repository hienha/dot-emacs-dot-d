;; open init file
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; swiper
(global-set-key "\C-s" 'swiper)

;; ivy
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)

;; sounsel
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h l") 'counsel-find-library)
(global-set-key (kbd "C-h i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "C-h u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;; for open recent files
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; use counsel-git
(global-set-key (kbd "C-c p f") 'counsel-git)


;; insent region or buffer
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)


;; hippie expakd is dabbrev expand in steroids
(global-set-key (kbd "s-/") 'hippie-expand)

;; dired: delay load
(with-eval-after-load "dired"
  '(progn
     (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)))

;; web-mode
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;; Occur
(global-set-key (kbd "M-s o") 'occur-dwim)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; org-capture
;; r aka remember
(global-set-key (kbd "C-c r") 'org-capture)

;; org-agenda
(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "M-s i") 'counsel-imenu)

(global-set-key (kbd "M-s e") 'iedit-mode)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

(provide 'init-keybindings)

