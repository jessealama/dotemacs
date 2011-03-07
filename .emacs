;;; ledger
(push "~/sources/ledger/lisp" load-path)
(require 'ledger)

;;; auctex
(push "~/share/emacs/site-lisp/auctex" load-path)
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;;; utf-8
(setenv "LANG" "en_US.UTF-8")

;;; color theme
(push "~/share/emacs/site-lisp/color-theme" load-path)
(require 'color-theme)
(color-theme-initialize)
(color-theme-xemacs)

;;; magit
(push "~/share/emacs/site-lisp/magit" load-path)
(require 'magit)
(autoload 'magit-status "magit" nil t)
(global-set-key "\C-xg" 'magit-status)

;;; mizar
(push "~/sources/mizar/mizarmode" load-path)
(require 'mizar)
(add-to-list 'auto-mode-alist '("\\.miz\\'" . mizar-mode))

;;; slime
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;(slime-setup '(slime-sprof))
(setq common-lisp-hyperspec-root "file:/sw/share/doc/hyperspec/")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(LaTeX-mode-hook (quote (turn-on-reftex)))
 '(TeX-PDF-mode t)
 '(TeX-view-program-list (quote (("open" "/usr/bin/open %o"))))
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "open") (output-html "xdg-open"))))
 '(column-number-mode t)
 '(dired-guess-shell-alist-user (quote (("\\.svg$" "open"))))
 '(inferior-lisp-program "sbcl")
 '(safe-local-variable-values (quote ((Package . hunchentoot-dir-lister) (Base . 10) (Package . HUNCHENTOOT) (Syntax . COMMON-LISP) (Syntax . Common-Lisp) (eval add-hook (quote write-file-hooks) (quote time-stamp)))))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(slime-net-coding-system (quote utf-8-unix)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
