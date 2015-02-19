;; Load Auxtex
(load "auctex.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; hooking reftex
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq reftex-toc-split-windows-horizontally t
      reftex-toc-split-windows-fraction 0.62)
(setq reftex-cite-format 'natbib
      reftex-sort-bibtex-matches 'reverse-year)

;; using \eqref{} instead of (\ref{})
(setq reftex-label-alist '((nil ?e nil "~\\eqref{%s}" nil nil)))

;; for parentheses
(setq LaTeX-electric-left-right-brace 1)

;; for inserting $|$
(add-hook 'LaTeX-mode-hook
	  (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
			  (cons "$" "$"))))

;; Choose pdflatex
(setq TeX-PDF-mode t)

;; for emacs to know where is pdflatex
(getenv "PATH")
(setenv "PATH"
	(concat
	 "/usr/texbin" ":" (getenv "PATH")))

;; Make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -synctex=1 -pv -pdf %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b %n %o %b")))

;; To invoke Skim using shift-command-click
(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "<S-s-mouse-1>") #'TeX-view)))

;; Provide package
(provide 'jz-latex-mode)
