;;; markdown mode
(push "~/share/emacs/site-lisp/markdown-mode" load-path)
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.mkd" . markdown-mode) auto-mode-alist))

;;; mac-key-mode
(push "~/share/emacs/site-lisp/mac-key-mode" load-path)
(require 'redo+)
(require 'mac-key-mode)
(mac-key-mode 1)

;;; cperl-mode is preferred to perl-mode
;;; "Brevity is the soul of wit" <foo at acm.org>
;;;
;;; stolen from the emacs wiki (http://www.emacswiki.org/emacs/CPerlMode)
(defalias 'perl-mode 'cperl-mode)

;;; eldoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;;; ibuffer
(global-set-key "\C-x\C-b" 'ibuffer)

;;; xsltxt
(push "~/share/emacs/site-lisp/xsltxt" load-path)
(require 'xsltxt)
(add-to-list 'auto-mode-alist '("\\.xsltxt\\'" . xsltxt-mode))

;;; gnus
(require 'gnus)
(setq user-mail-address "jesse.alama@gmail.com")
(setq user-full-name "Jesse Alama")

;;; bbdb
(push "~/share/emacs/site-lisp/bbdb" load-path)
(require 'bbdb)
(bbdb-initialize 'gnus 'message)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'bbdb-notice-hook 'bbdb-auto-notes-hook)


;;; emacs-w3m
(push "~/share/emacs/site-lisp/w3m" load-path)
(require 'w3m-load)

;; news and mail sources
(setq gnus-select-method '(nntp "news.gmane.org"))

;; Configure outbound mail (SMTP)
(setq smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-default-smtp-server "smtp.gmail.com"
      send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 587
      smtpmail-auth-credentials (expand-file-name "~/.authinfo"))
      ;; smtpmail-auth-credentials '(("smtp.gmail.com"
      ;; 				   587
      ;; 				   "jesse.alama@gmail.com"
      ;; 				   nil)))
(setq smptmail-debug-info "t")

;; gnus customization
(setq gnus-summary-line-format ":%U%R %B %s %-60=|%-20,20f |%&user-date; \n")
(setq gnus-sum-thread-tree-single-leaf " »")
(setq gnus-sum-thread-tree-leaf-with-other " »")

;; fetch old headers when a new follow-up arrives
(setq gnus-fetch-old-headers t)

;; mail splitting
;; haven't finished this yet, but here's an example
;; (setq nnmail-split-methods 'nnmail-split-fancy)
;; (setq nnmail-split-fancy
;;       `(| ("User-Agent" "rss2email" "rss.feeds")
;;       (from "JIRA" "mail.apache.jira") 
;;           (any "svn commit" "mail.apache.commits") 
;;           ("Mailing-List" "contact \\[-a-z]*\\-help@\\[.a-z]*\\apache.org" "mail.apache.\\2\\1") 
;;           ;; unmatched goes to misc
;;           "mail.misc"))


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

;;; paredit
(push "~/share/emacs/site-lisp/paredit" load-path)
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)

;;; dired-x
(require 'dired-x)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(LaTeX-mode-hook (quote (turn-on-reftex)) t)
 '(TeX-PDF-mode t)
 '(TeX-view-program-list (quote (("open" "/usr/bin/open %o"))))
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "open") (output-html "xdg-open"))))
 '(bbdb-offer-save (quote savenoprompt))
 '(column-number-mode t)
 '(dired-dwim-target t)
 '(dired-guess-shell-alist-user (quote (("\\.svg$" "open") ("\\.html$" "open") ("\\.pdf$" "open"))))
 '(dired-recursive-copies (quote always))
 '(dired-recursive-deletes (quote always))
 '(gnus-group-mode-hook (quote (gnus-topic-mode gnus-agent-mode)))
 '(gnus-ignored-newsgroups "^to\\.\\|^[0-9. 	]+\\( \\|$\\)\\|^[\"]\"[#'()]")
 '(gnus-posting-styles (quote ((".*" (name "Jesse Alama") (address "jesse.alama@gmail.com") ("Bcc" "jesse.alama@gmail.com")))))
 '(gnus-secondary-select-methods (quote ((nnml "") (nnimap "imap.gmail.com" (nnimap-server-port 993) (nnimap-authinfo-file "~/.authinfo") (nnimap-stream ssl)))))
 '(inferior-lisp-program "sbcl")
 '(inhibit-startup-echo-area-message "alama")
 '(initial-buffer-choice t)
 '(initial-scratch-message nil)
 '(mail-user-agent (quote gnus-user-agent))
 '(markdown-command "markdown")
 '(mm-text-html-renderer (quote w3m))
 '(ns-alternate-modifier (quote none))
 '(safe-local-variable-values (quote ((Package MEMOIZE) (Syntax . ANSI-COMMON-LISP) (Package . CL-WHO) (Package . CL-USER) (Package . CL-PPCRE) (Package . hunchentoot-dir-lister) (Base . 10) (Package . HUNCHENTOOT) (Syntax . COMMON-LISP) (Syntax . Common-Lisp) (eval add-hook (quote write-file-hooks) (quote time-stamp)))))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(slime-net-coding-system (quote utf-8-unix)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
