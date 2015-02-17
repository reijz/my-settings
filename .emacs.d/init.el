;; Starts the Emacs server
(server-start)

;; use aspell to spell checking
(setq ispell-program-name "aspell")
(add-to-list 'exec-path "/usr/local/bin")

;; Selection delete mode
(delete-selection-mode 1)

;; some key bindings
(global-set-key (kbd "<s-left>") 'beginning-of-line)
(global-set-key (kbd "<s-right>") 'end-of-line)

;; Add load path
(add-to-list 'load-path "~/.emacs.d/jz-lisp")

;; Appearance of Emacs
(require 'jz-appearance)

;; Language settings
(require 'jz-latex-mode)
