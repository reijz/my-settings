;; Starts the Emacs server
(server-start)

;; Use aspell to spell checking
(setq ispell-program-name "aspell")
(add-to-list 'exec-path "/usr/local/bin")

;; Selection delete mode
(delete-selection-mode 1)

;; Auto revert buffer
(global-auto-revert-mode 1)

;; Some key bindings
(global-set-key (kbd "<s-left>") 'beginning-of-line)
(global-set-key (kbd "<s-right>") 'end-of-line)
(global-set-key (kbd "C-c r") 'revert-buffer)

;; Add load path
(add-to-list 'load-path "~/.emacs.d/jz-lisp")
(add-to-list 'load-path "~/.emacs.d/lisp")

;; Appearance of Emacs
(require 'jz-appearance)

;; Language settings
(require 'jz-latex-mode)

;; Redo using redo+.el
;; from http://www.emacswiki.org/emacs/RedoPlus
(require 'redo+)
(global-set-key (kbd "<C-s-268632090>") 'redo)
(global-set-key (kbd "C-?") 'redo)
