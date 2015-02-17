;; Starts the Emacs server
(server-start)

;; use aspell to spell checking
(setq ispell-program-name "aspell")
(add-to-list 'exec-path "/usr/local/bin")

(add-to-list 'load-path "~/.emacs.d/jz-lisp")

;; Appearance of Emacs
(require 'jz-appearance)

;; Language settings
(require 'jz-latex-mode)
