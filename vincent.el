(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

(require 'init-func)
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-web-mode)
(require 'init-keybindings)
