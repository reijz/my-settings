;; Starts the Emacs server
(server-start)

;; Added by Package management
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; Use aspell to spell checking
(setq ispell-program-name "aspell")
(add-to-list 'exec-path "/usr/local/bin")

;; Selection delete mode
(delete-selection-mode 1)

;; set windown splitting
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; Auto revert buffer
(global-auto-revert-mode 1)

;; Some key bindings
(global-set-key (kbd "<s-left>") 'beginning-of-line)
(global-set-key (kbd "<s-right>") 'end-of-line)
(global-set-key (kbd "C-c r") 'revert-buffer)

;; Write backups to ~/.emacs.d/backup/
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      20 ; how many of the newest versions to keep
      kept-old-versions      5) ; and how many of the old

;; Add load path
(add-to-list 'load-path "~/.emacs.d/jz-lisp")
(add-to-list 'load-path "~/.emacs.d/lisp")

;; Appearance of Emacs
(require 'jz-appearance)

;; Language settings
(require 'jz-latex-mode)

;; Language settings
(require 'jz-markdown-mode)

;; Language settings
(require 'jz-org-mode)

;; Redo using redo+.el
;; from http://www.emacswiki.org/emacs/RedoPlus
(require 'redo+)
(global-set-key (kbd "<C-s-268632090>") 'redo)
(global-set-key (kbd "C-?") 'redo)
