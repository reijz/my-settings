;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messags* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-fill-function nil t)
 '(case-fold-search nil)
 '(global-flyspell-mode t)
 '(global-linum-mode t)
 '(ns-tool-bar-display-mode (quote icons) t)
 '(ns-tool-bar-size-mode (quote small) t)
 '(reftex-toc-split-windows-horizontally t)
 '(size-indication-mode t)
 '(split-height-threshold nil)
 '(split-width-threshold 0)
 '(text-mode-hook (quote (smart-spacing-mode)))
 '(visual-line-mode t t)
 '(word-wrap t)
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit tex-mode-default :stipple nil :strike-through nil :underline nil :slant normal :weight normal :height 150 :width normal :family "Monaco"))))
 '(latex-mode-default ((t (:inherit tex-mode-default :stipple nil :strike-through nil :underline nil :slant normal :weight normal :height 150 :width normal :family "Monaco"))))
 )


;; ----------------------------for latex ---------------------------

;; Starts the Emacs server
(server-start)

;; Show path of file in titlebar
(setq-default frame-title-format "%b (%f)")

;; for inserting $|$
(add-hook 'LaTeX-mode-hook
	  (lambda () (set (make-variable-buffer-local 'TeX-electric-math)
			  (cons "$" "$"))))

(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; for parentheses
(setq LaTeX-electric-left-right-brace 1)
 
;; make latexmk available via C-c C-c
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


;; for blinking box cursor
; ------------------------------------------------------------------------------
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


