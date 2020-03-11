
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;
;; Customize settings.
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu-tuna"    .  "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			   ("melpa-tuna"  .  "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

(require 'cl)

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


;; hungry-delete mode
(require 'hungry-delete)
(global-hungry-delete-mode)


(ivy-mode t)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)


(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
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

(require 'smartparens-config)
(smartparens-global-mode t)


;; Configure js2-mode for js files.
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; if your OS is MacOXX, you need add below settings.
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(global-linum-mode t)

(setq inhibit-splash-screen t)


(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)


(global-company-mode t)

(setq-default cursor-type 'bar)
(setq make-backup-files nil)

(require 'org)
(setq org-src-fontify-natively t)

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 50)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(delete-selection-mode t)

(setq initial-frame-alist (quote ((fullscreen . maximized))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-hl-line-mode t)

(load-theme 'dracula t)

;; org-agenda
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(package-selected-packages (quote (company))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
