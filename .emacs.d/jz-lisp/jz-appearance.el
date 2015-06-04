;; Set some global variables 
(custom-set-variables
 '(auto-fill-function nil t)
 '(case-fold-search nil)
 '(default-frame-alist
    (quote
     ((width . 100)
      (height . 37)
      (internal-border-width . 0)
      (fringe)
      (left-fringe . 0)
      (right-fringe . 0))))
 '(global-flyspell-mode t)
 '(inhibit-startup-screen t)
;; '(split-height-threshold nil)
;; '(split-width-threshold 0)
 '(tool-bar-mode nil)
 '(visual-line-mode t t)
 '(word-wrap t))

;; Customerize faces
(custom-set-faces
 '(default ((t (:inherit nil :slant normal :weight normal :height 150 :width normal :family "Monaco"))))
 '(latex-mode-default ((t (:inherit tex-mode-default :slant normal :weight normal :height 150 :width normal :family "Monaco"))))
 '(linum ((t (:background "#f5f5f5")))))

;; line number
(global-linum-mode t)
(setq linum-format " %d ")

;; highlight current line
(global-hl-line-mode t)
(set-face-background hl-line-face "#f5f5f5")

;; Show path of file in titlebar
;; (setq-default frame-title-format "%b (%f)")
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Show matching parenthesis
(show-paren-mode 1)

;; Set cursor type 
(set-default 'cursor-type 'box)

;; Blinking cursor (only available in Emacs 24.0) 
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
  (internal-show-cursor nil (not (internal-show-cursor-p))))

;; Provide package
(provide 'jz-appearance)
