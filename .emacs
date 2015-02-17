;; Set some global variables 
(custom-set-variables
 '(auto-fill-function nil t)
 '(case-fold-search nil)
 '(default-frame-alist
    (quote
     ((width . 100)
      (height . 68)
      (internal-border-width . 0)
      (fringe)
      (left-fringe . 0)
      (right-fringe . 0))))
 '(global-flyspell-mode t)
 '(global-linum-mode t)
 '(linum-format " %d ")
 '(split-height-threshold nil)
 '(split-width-threshold 0)
 '(tool-bar-mode nil)
 '(visual-line-mode t t)
 '(word-wrap t))

;; use aspell to spell checking
(setq ispell-program-name "aspell")
(add-to-list 'exec-path "/usr/local/bin")

;; Customerize font
(custom-set-faces
 '(default ((t (:inherit nil :slant normal :weight normal :height 150 :width normal :family "Monaco"))))
 '(latex-mode-default ((t (:inherit tex-mode-default :slant normal :weight normal :height 150 :width normal :family "Monaco"))))
 '(linum ((t (:background "#e6e6e6")))))

;; Do not show toolbar
(tool-bar-mode -1)

;; Show path of file in titlebar
(setq-default frame-title-format "%b (%f)")

;; highlight current line
(global-hl-line-mode t)
(set-face-background hl-line-face "#f5f5f5")

;; Auxtex
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
(setq reftex-toc-split-windows-horizontally t)
(setq reftex-label-alist '((nil ?e nil "~\\eqref{%s}" nil nil)))

;; pdflatex
(setq TeX-PDF-mode t)

;; for parentheses
(setq LaTeX-electric-left-right-brace 1)

;; for inserting $|$
(add-hook 'LaTeX-mode-hook
	  (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
			  (cons "$" "$"))))

;; for emacs to know where is pdflatex
(getenv "PATH")
(setenv "PATH"
	(concat
	 "/usr/texbin" ":" (getenv "PATH")))
 
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -synctex=1 -pv -pdf %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; for sync to emacs
(require 'tex-site)
(setq TeX-source-correlate-method 'synctex)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)

(add-hook 'LaTeX-mode-hook
      (lambda()
        (add-to-list 'TeX-expand-list
             '("%q" skim-make-url))))

(defun skim-make-url () (concat
        (TeX-current-line)
        " "
        (expand-file-name (funcall file (TeX-output-extension) t)
            (file-name-directory (TeX-master-file)))
        " "
        (buffer-file-name)))

;; Starts the Emacs server
(server-start)

;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b %n %o %b")))

(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "<S-s-mouse-1>") #'TeX-view))
          )

;; for blinking box cursor
(set-default 'cursor-type 'box)

;; Using in Emacs 24.0 

(defvar blink-cursor-colors (list  "#92c48f" "#6785c5" "#be369c" "#d9ca65")
  "On each blink the cursor will cycle to the next color in this list.")

(setq blink-cursor-count 0)
(defun blink-cursor-timer-function ()
  "Zarza wrote this cyberpunk variant of timer `blink-cursor-timer'. 
  Warning: overwrites original version in `frame.el'.

 This one changes the cursor color on each blink. Define colors in `blink-cursor-colors'."
  (when (not (internal-show-cursor-p))
    (when (>= blink-cursor-count (length blink-cursor-colors))
      (setq blink-cursor-count 0))
    (set-cursor-color (nth blink-cursor-count blink-cursor-colors))
    (setq blink-cursor-count (+ 1 blink-cursor-count))
    )
  (internal-show-cursor nil (not (internal-show-cursor-p)))
  )

