;; Markdown mode

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
(add-hook 'markdown-mode-hook
          (lambda ()
            (visual-line-mode t)
            (writegood-mode t)
            (flyspell-mode t)))

;; checking parenthesis
(add-hook 'markdown-mode-hook
	  (lambda ()
	    (when buffer-file-name
	      (add-hook 'after-save-hook
			'check-parens
			nil t))))

(setq markdown-enable-math t)

(setq markdown-command "/usr/local/bin/pandoc --smart --standalone --mathjax --from markdown -t html --css http://dmac.ust.hk/css/github.css")

; (setq markdown-command "/usr/local/bin/pandoc --smart --standalone --mathjax --from markdown -t html --css http://verse.ust.hk/bootstrap/css/bootstrap.min.css")

; (setq markdown-css-paths "http://verse.ust.hk/css/github.css")

;; Provide package
(provide 'jz-markdown-mode)
