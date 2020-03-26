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
;; (global-set-key (kbd "C-c p f") 'counsel-git)


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
  (define-key company-active-map (kbd "C-p") #'company-select-next-previous-previous))

;; (global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

;; Use C-w to backward deleti a word
(global-set-key (kbd "C-w") 'backward-kill-word)

;; === 
;; === evil-leader
;; === 
(evil-leader/set-key
  "ff" 'find-file
  "fr" 'recentf-open-files
  "bb" 'switch-to-buffer
  "kb" 'kill-buffer-and-window
  "pf" 'counsel-git
  "ps" 'helm-do-ag-project-root
  "o" 'other-window
  ;; window-numbering configuration
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "4" 'select-window-4
  "sr" 'split-window-right
  "sb" 'split-window-below
  ";" 'counsel-M-x)

;; === 
;; === evil-nerd-commenter
;; === Emacs key bindings
;; === 
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

;; === 
;; === Vim key bindings
;; === 
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  ";" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "."  'evilnc-copy-and-comment-operator
  "\\" 'evilnc-comment-operator ; if you prefer backslash key
)

(provide 'init-keybindings)

