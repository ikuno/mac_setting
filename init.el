(add-to-list 'load-path "/usr/share/emacs/site-lisp/")
(global-set-key "\C-h" 'delete-backward-char)
(setq make-backup-files nil)
(put 'downcase-region 'disabled nil)
(setq inhibit-startup-message t)
;; (require 'linum)
;; (setq linum-format
;;       (lambda (line)
;; 	(propertize (format
;; 		     (let ((w (length (number-to-string
;; 				       (count-lines (point-min) (point-max))))))
;; 		       (concat "%" (number-to-string w) "d| ")) line) 'face 'linum)))
;; (global-linum-mode t)
;;YaTeX
;; Add library path
(add-to-list 'load-path "~/.emacs.d/site-lisp/yatex1.81")
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq load-path (cons (expand-file-name "~/.emacs.d/yatex") load-path))
(setq YaTeX-kanji-code nil)
  (add-hook ' yatex-mode-hook
   '(
     lambda () (auto-fill-mode -1)
    )
  )

;(show-paren-mode t)
;;cuda
(setq auto-mode-alist (cons(cons"\\.cu$"'c++-mode)auto-mode-alist))

;;(add-to-list 'load-path "/Applications/MacPorts/Emacs.app/Contents/Resources/share/emacs/site-lisp/muse")

;; (require 'muse-mode)     ; load authoring mode

;; (require 'muse-html)     ; load publishing styles I use
;; (require 'muse-latex)
;; (require 'muse-texinfo)
;; (require 'muse-docbook)
;
; for aspell
;;(setq ispell-program-name "/usr/local/Cellar/aspell")
;;(setq ispell-program-name "/usr/local/Cellar/ispell/3.4.00/bin/ispell")
;;(setq ispell-program-name "/usr/local/Cellar/aspell/0.60.6.1_1/bin/aspell")
(setq ispell-program-name "/opt/homebrew/Cellar/ispell/3.4.04/bin/ispell")
