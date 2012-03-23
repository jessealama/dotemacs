;;; set up our environment

(let ((current-path (getenv "PATH"))
      (current-infopath (getenv "MANPATH"))
      (current-manpath (getenv "INFOPATH")))
  (setenv "PATH"
	  (concat "/Users/alama/bin:/Users/alama/sources/mizar/release/7.13.01-4.181.1147/bin:/usr/local/texlive/2011/bin/universal-darwin:/usr/local/bin:/opt/local/libexec/gnubin:/opt/local/bin:/opt/local/sbin"
		  (if (and current-path
			   (not (string= current-path "")))
		      (concat ":" current-path)
		    "")))
  (setenv "MANPATH"
	  (concat "/Users/alama/share/man:/usr/local/texlive/2011/texmf/doc/man:/opt/local/share/man:/usr/share/man"
		  (if (and current-manpath
			   (not (string= current-manpath "")))
		      (concat ":" current-manpath)
		    "")))
  (setenv "INFOPATH"
	  (concat "/Users/alama/share/info:/usr/local/texlive/2011/texmf/doc/info:/opt/local/share/info:/usr/share/info"
		  (if (and current-infopath
			   (not (string= current-infopath "")))
		      (concat ":" current-infopath)
		    ""))))
(setq exec-path (append (split-string (getenv "PATH") ":")
			  exec-path))

;;; maybe improve display speed
;;;
;;; see http://www.masteringemacs.org/articles/2011/10/02/improving-performance-emacs-display-engine/
(setq redisplay-dont-pause t)


;;; nxhtml
;(load "~/share/emacs/site-lisp/nxhtml/autostart.el")

;;; delete-trailing-whitespace
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;; ce-el
(push "~/sources/sep/ce-el" load-path)
;(require 'ce)
(require 'ce-quotes)
(ce-mode 1)

;;; delete
(delete-selection-mode 1)

;;; drew adams stuff
;(push "~/share/emacs/site-lisp/drewa" load-path)

;;; loccur
(push "~/share/emacs/site-lisp/loccur" load-path)
(require 'loccur)

;;; tptp-el
(push "~/sources/tptp-el/emacs" load-path)
(require 'tptp)

;;; bookmark+
;(require 'bookmark+-1 "bookmark+-1")

;;; markdown mode
(push "~/share/emacs/site-lisp/markdown-mode" load-path)
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.mkd" . markdown-mode) auto-mode-alist))

;;; mac-key-mode
;(push "~/share/emacs/site-lisp/mac-key-mode" load-path)
;(require 'redo+)
;(require 'mac-key-mode)
;(mac-key-mode 1)

;;; org mode
(push "~/share/emacs/site-lisp/org" load-path)
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;; cperl-mode is preferred to perl-mode
;;; "Brevity is the soul of wit" <foo at acm.org>
;;;
;;; stolen from the emacs wiki (http://www.emacswiki.org/emacs/CPerlMode)
(defalias 'perl-mode 'cperl-mode)

;;; eldoc
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;;; no trailing whitespace!
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

;;; ibuffer
(global-set-key "\C-x\C-b" 'ibuffer)

;;; iswitchb
(iswitchb-mode t)

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
      ;;                                   587
      ;;                                   "jesse.alama@gmail.com"
      ;;                                   nil)))
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
;(push "~/sources/ledger/lisp" load-path)
(push "/opt/local/share/emacs/site-lisp/" load-path)
(require 'ledger)

;;; auctex
(push "~/share/emacs/site-lisp/auctex" load-path)
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(add-hook 'LaTeX-mode-hook 'TeX-toggle-debug-warnings)

;;; utf-8
(setenv "LANG" "en_US.UTF-8")

;;; color theme
(push "~/share/emacs/site-lisp/color-theme" load-path)
(require 'color-theme)
(color-theme-initialize)
(color-theme-bharadwaj)
;(color-theme-gunmetal)
;(color-theme-folio)

;;; magit
(push "~/share/emacs/site-lisp/magit" load-path)
(require 'magit)
(autoload 'magit-status "magit" nil t)
(global-set-key "\C-xg" 'magit-status)

;;; mizar
(push "~/sources/mizar/mizarmode" load-path)
(require 'mizar)
;(require 'mizar-voc)
(add-to-list 'auto-mode-alist '("\\.miz\\'" . mizar-mode))
(add-to-list 'auto-mode-alist '("\\.voc\\'" . mizar-mode))
(add-to-list 'auto-mode-alist '("\\.msm\\'" . mizar-mode))
(add-to-list 'auto-mode-alist '("\\.abs\\'" . mizar-mode))


;;; slime
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;(slime-setup '(slime-sprof))
(setq common-lisp-hyperspec-root "file:/opt/local/share/doc/lisp/HyperSpec-7-0/HyperSpec/")

;;; paredit
(push "~/share/emacs/site-lisp/paredit" load-path)
(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(add-hook 'slime-mode-hook 'enable-paredit-mode)

;;; dired-x
(require 'dired-x)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(*paradox-program* "paradox")
 '(Info-additional-directory-list (quote ("/Users/alama/share/info" "/opt/local/share/info")))
 '(LaTeX-mode-hook (quote (turn-on-reftex)) t)
 '(TeX-PDF-mode t)
 '(TeX-default-mode (quote context-mode))
 '(TeX-view-program-list (quote (("open" "/usr/bin/open %o"))))
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "open") (output-html "xdg-open"))))
 '(bbdb-offer-save (quote savenoprompt))
 '(before-save-hook (quote ((lambda nil (delete-trailing-whitespace)))))
 '(color-theme-directory nil)
 '(color-theme-is-cumulative nil)
 '(color-theme-libraries (quote ("/Users/alama/share/emacs/site-lisp/color-theme/themes/color-theme-example.el" "/Users/alama/share/emacs/site-lisp/color-theme/themes/color-theme-library.el" "/Users/alama/share/emacs/site-lisp/color-theme/themes/color-theme-gunmetal.el")))
 '(column-number-mode t)
 '(cperl-close-paren-offset -4)
 '(cperl-continued-statement-offset 4)
 '(cperl-indent-level 4)
 '(cperl-indent-parens-as-block t)
 '(dired-dwim-target t)
 '(dired-guess-shell-alist-user (quote (("\\.tiff$" "open") ("\\.svg$" "open") ("\\.html$" "open") ("\\.pdf$" "open") ("\\.jp[e]?g$" "open") ("\\.png$" "open") ("\\.gif$" "open"))))
 '(dired-listing-switches "-al --group-directories-first")
 '(dired-recursive-copies (quote always))
 '(dired-recursive-deletes (quote always))
 '(dired-use-ls-dired (quote unspecified))
 '(emacs-lisp-mode-hook (quote (turn-on-eldoc-mode checkdoc-minor-mode enable-paredit-mode)))
 '(gnus-agent t)
 '(gnus-group-mode-hook (quote (gnus-topic-mode gnus-agent-mode)))
 '(gnus-ignored-newsgroups "^to\\.\\|^[0-9.     ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
 '(gnus-posting-styles (quote ((".*" (name "Jesse Alama") (address "jesse.alama@gmail.com") ("Bcc" "jesse.alama@gmail.com")))))
 '(gnus-secondary-select-methods (quote ((nntp "news.gmane.org") (nnimap "imap.fct.unl.pt" (nnimap-stream ssl)))))
 '(gnus-select-method (quote (nnimap "imap.gmail.com" (nnimap-server-port 993) (nnimap-stream ssl))))
 '(gnus-treat-body-boundary (quote head))
 '(inferior-lisp-program "/Users/alama/sources/ccl-darwinx86/dx86cl64")
 '(inhibit-startup-echo-area-message "alama")
 '(initial-buffer-choice t)
 '(initial-scratch-message nil)
 '(ispell-program-name "aspell")
 '(mail-user-agent (quote gnus-user-agent))
 '(majmodpri-no-nxml t)
 '(markdown-command "markdown")
 '(message-fill-column nil)
 '(message-send-mail-function (quote message-send-mail-with-sendmail) t)
 '(mm-text-html-renderer (quote w3m))
 '(ns-alternate-modifier (quote none))
 '(org-agenda-files (quote ("/Users/alama/notes.org")))
 '(org-default-notes-file "~/notes.org")
 '(safe-local-variable-values (quote ((Package . CL) (package . rune-dom) (Package . CCL) (auto-fill-mode . t) (Syntax . ANSI-Common-Lisp) (Package . DRAKMA) (Package MEMOIZE) (Syntax . ANSI-COMMON-LISP) (Package . CL-WHO) (Package . CL-USER) (Package . CL-PPCRE) (Package . hunchentoot-dir-lister) (Base . 10) (Package . HUNCHENTOOT) (Syntax . COMMON-LISP) (Syntax . Common-Lisp) (eval add-hook (quote write-file-hooks) (quote time-stamp)))))
 '(scroll-bar-mode nil)
 '(sendmail-program "/opt/local/bin/msmtp")
 '(show-paren-mode t)
 '(slime-net-coding-system (quote utf-8-unix))
 '(smtpmail-debug-info t)
 '(tool-bar-mode nil)
 '(vc-handled-backends nil)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gainsboro" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Monaco")))))
