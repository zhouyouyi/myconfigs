;; personal info
(setq user-full-name "rzhou")
(setq user-mail-address "zhou.youyi@gmail.com")

;; setup my customized emacs load path
(add-to-list 'load-path "~/.emacs.d/sugars" )

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; turn off menu bar
(menu-bar-mode -1)

;; turn off tool bar
(tool-bar-mode -1)

;; turn off scroll bar
(toggle-scroll-bar -1)

;; turn off line numbers in certain modes
(require 'linum-off)

;; non-blinking cursor
(blink-cursor-mode 0)
;; bar cursor
;; (setq-default cursor-type 'bar)
;; show column number
(column-number-mode t)

;; display time
(display-time-mode t)

;; show buffer name on window title
(setq frame-title-format "%b@emacs")

;; solarized
;;(add-to-list 'load-path "~/.emacs.d/color-theme-solarized")
(add-to-list 'custom-theme-load-path "~/.emacs.d/color-theme-solarized")
(load-theme 'solarized-dark t)

;;(require 'color-theme)
;;(require 'color-theme-solarized)
;;(color-theme-initialize)
;;(color-theme-solarized-dark)

;; ido
(require 'ido)
(ido-mode t)

;; (defun my-semantic-hook ()
;;   (semantic-add-system-include "~/firedrake/Debug/include" 'c++-mode)
;;   (semantic-add-system-include "~/workspace/firedrake/src" 'c++-mode))
;; (add-hook 'semantic-init-hooks 'my-semantic-hook)

;; Semantic
;; (semantic-mode t)
;; (global-semantic-idle-completions-mode t)
;; (global-semantic-highlight-func-mode t)
;; (global-semantic-show-unmatched-syntax-mode t)
;; (global-semantic-idle-summary-mode t)
;; (global-semantic-decoration-mode t)

;; (add-to-list 'semanticdb-project-roots "~/workspace/firedrake/src" )

;; (defun ac-cc-mode-setup ()
;;   (setq ac-sources '(ac-source-semantic)) )

;; Turn off ac-auto-start in CC-mode
;; (add-hook 'c-mode-hook '(lambda ()
;;                           (setq-local ac-auto-start nil)
;;                           ) )

;;auto-complete
;;(require 'auto-complete)
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (ac-config-default)
;; (setq ac-auto-start nil)

;; auto-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; shell mode
(require 'shell)

;; desktop mode
(desktop-save-mode 1)

;; tabs
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;; delete selection
(delete-selection-mode 1)

;; show matched parens
(show-paren-mode 1)

;; don't show line number
(global-linum-mode nil)

;; auto reload buffers when files changed
(global-auto-revert-mode t)

;; org mode
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; (setq org-log-done t)
;; (setq org-agenda-files (list "~/rzhou.org"))
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cc" 'org-capture)
;; (global-set-key "\C-cb" 'org-iswitchb)

;; C-Style
(c-add-style "tetrion-c-style"
             '("linux"
               (c-basic-offset . 4)
               (c-offsets-alist . ( (innamespace . [0] ) ) )
               )
             )

;; c-style
(setq c-default-style "tetrion-c-style" )
;;      c-basic-offset 4 )

;; YASNippet
;;(add-to-list 'load-path "~/.emacs.d/yasnippet")
;;(add-to-list 'load-path "~/.emacs.d/cl-lib")

;; irony
;;(add-to-list 'load-path "~/.emacs.d/irony-mode/elisp")
;;(require 'auto-complete)
;;(require 'yasnippet)
;;(require 'irony)

;;(yas-global-mode 1)

;;(irony-enable 'ac)

;;(defun my-c++-hooks ()
;;  "Enable the hooks in the preferred order: 'yas -> auto-complete -> irony'."
  ;; be cautious, if yas is not enabled before (auto-complete-mode 1), overlays
  ;; *may* persist after an expansion.
;;  (yas/minor-mode-on)
;;  (auto-complete-mode 1)

  ;; avoid enabling irony-mode in modes that inherits c-mode, e.g: php-mode
;;  (when (member major-mode irony-known-modes)
;;    (irony-mode 1)))

;;(add-hook 'c++-mode-hook 'my-c++-hooks)
;;(add-hook 'c-mode-hook 'my-c++-hooks)

;; (require 'irony)
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)

;; ;; replace the `completion-at-point' and `complete-symbol' bindings in
;; ;; irony-mode's buffers by irony-mode's function
;; (defun my-irony-mode-hook ()
;;   (define-key irony-mode-map [remap completion-at-point]
;;     'irony-completion-at-point-async)
;;   (define-key irony-mode-map [remap complete-symbol]
;;     'irony-completion-at-point-async))
;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(glasses-face (quote bold))
 '(glasses-separator "")
 '(show-paren-mode t))

;; mew for mail
;;(autoload 'mew "mew" nil t)
;;(autoload 'mew-send "mew" nil t)

;; Optional setup
;;(setq read-mail-command 'mew)

;; Optional setup (e.g. C-xm for sending a message)
;;(autoload 'mew-user-agent-compose "mew" nil t)
;;(if (boundp 'mail-user-agent)
;;   (setq mail-user-agent 'mew-user-agent))
;;(if (fboundp 'define-mail-user-agent)
;;    (define-mail-user-agent
;;      'mew-user-agent
;;      'mew-user-agent-compose
;;      'mew-draft-send-message
;;      'mew-draft-kill
;;      'mew-send-hook))

;; Start a server
(server-start)

;; hook c-x k to kll server buffer
(add-hook 'server-switch-hook
	  (lambda ()
	    (when (current-local-map)
	      (use-local-map (copy-keymap(current-local-map))))
	    (when server-buffer-clients
	      (local-set-key(kbd "C-x k") 'server-edit))))

;; compilation mode
(setq compilation-scroll-output t)

(defun compilation-exit-autoclose(status code msg)
  ;; if M-x compile exists with a 0
  (when (and(eq status 'exit) (zerop code))
    (bury-buffer "*compilation*")
    (delete-window (get-buffer-window (get-buffer "*compilation*"))))
  (cons msg code))
(setq compilation-exit-message-function 'compilation-exit-autoclose)

(defun custom-compilation-hook()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
	(let* ((w(split-window-vertically))
	       (h(window-height w)))
	  (select-window w)
	  (switch-to-buffer "*compilation*")
	  (shrink-window(- h 10)))))))
(add-hook 'compilation-mode-hook 'custom-compilation-hook)

;; gnus mail
;; (setq gnus-select-method
;;       '(nnimap "athena"
;;                (nnimap-address "mail.athenacr.com")
;;                (nnimap-server-port 993)
;;                (nnimap-stream ssl)))

;; (setq message-send-mail-function 'smtpmail-send-it
;;       smtpmail-starttls-credentials '(("mail.athenacr.com" 25 nil nil))
;;       smtpmail-auth-credentials '(("mail.athenacr.com" 25
;;                                    "relay@athenacr.com" nil))
;;       smtpmail-default-smtp-server "mail.athenacr.com"
;;       smtpmail-smtp-server "mail.athenacr.com"
;;       smtpmail-smtp-service 25
;;       ;;gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
;;       gnus-ignored-newsgroups "")

;;(gnus-demon-add-handler 'gnus-group-get-new-news 2 t)
;;(gnus-demon-init)

;; (setq gnus-select-method
;;       '(nnimap "gmail"
;; 	       (nnimap-address "imap.gmail.com")
;; 	       (nnimap-server-port 993)
;; 	       (nnimap-stream ssl)))

;; (setq message-send-mail-function 'smtpmail-send-it
;;       smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-auth-credentials '(("smtp.gmail.com" 587
;; 				   "rzhou@athenacr.com" nil))
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587
;;       gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;; (gnus-demon-add-handler 'gnus-group-get-new-news 2 t)
;; (gnus-demon-init)

;; EMail settings for Wanderlust

;; (autoload 'wl "wl" "Wanderlust" t)
;; (autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
;; (autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)
;; (require 'mime-w3m)

;; ;; IMAP
;; (setq elmo-imap4-default-server "imap.gmail.com")
;; (setq elmo-imap4-default-user "rzhou@tetrioncapital.com") 
;; (setq elmo-imap4-default-authenticate-type 'clear) 
;; (setq elmo-imap4-default-port '993)
;; (setq elmo-imap4-default-stream-type 'ssl)

;; (setq elmo-imap4-use-modified-utf7 t) 

;; ;; SMTP
;; (setq wl-smtp-connection-type 'starttls)
;; (setq wl-smtp-posting-port 587)
;; (setq wl-smtp-authenticate-type "plain")
;; (setq wl-smtp-posting-user "rzhou@tetrioncapital.com")
;; (setq wl-smtp-posting-server "smtp.gmail.com")
;; (setq wl-local-domain "gmail.com")

;; (setq wl-from "Roy Zhou<rzhou@tetrioncapital.com>")

;; (setq wl-default-folder "%inbox")
;; (setq wl-default-spec "%")
;; (setq wl-draft-folder "%[Gmail]/Drafts") ; Gmail IMAP
;; (setq wl-trash-folder "%[Gmail]/Trash")
;; (setq wl-fcc "%[Gmail]/Sent Mail")
;; (setq wl-fcc-force-as-read t)

;; (setq wl-folder-check-async t) 

;; (setq elmo-imap4-use-modified-utf7 t)

;; (autoload 'wl-user-agent-compose "wl-draft" nil t)
;; (if (boundp 'mail-user-agent)
;;     (setq mail-user-agent 'wl-user-agent))
;; (if (fboundp 'define-mail-user-agent)
;;     (define-mail-user-agent
;;       'wl-user-agent
;;       'wl-user-agent-compose
;;       'wl-draft-send
;;       'wl-draft-kill
;;       'mail-send-hook))

;; (setq mime-view-ignored-field-list '("^.*"))

;; (setq wl-message-ignored-field-list '("^.*:")
;;       wl-message-visible-field-list
;;       '("^\\(To\\|Cc\\):"
;;         "^Subject:"
;;         "^\\(From\\|Reply-To\\):"
;;         "^Organization:"
;;         "^Message-Id:"
;;         "^\\(Posted\\|Date\\):"
;;         )
;;       )

;; (setq wl-forward-subject-prefix "Fwd: " )
 
;; (setq wl-message-visible-field-list
;;       (append mime-view-visible-field-list
;;               '("^Subject:" "^From:" "^To:" "^Cc:" 
;;                 "^X-Mailer:" "^X-Newsreader:" "^User-Agent:"
;;                 "^X-Face:" "^X-Mail-Count:" "^X-ML-COUNT:"
;;                 )))
 
;; (setq wl-message-ignored-field-list
;;       (append mime-view-ignored-field-list
;;               '(".*Received:" ".*Path:" ".*Id:" "^References:"
;;                 "^Replied:" "^Errors-To:"
;;                 "^Lines:" "^Sender:" ".*Host:" "^Xref:"
;;                 "^Content-Type:" "^Content-Transfer-Encoding:"
;;                 "^Precedence:"
;;                 "^Status:" "^X-VM-.*:"
;;                 "^X-Info:" "^X-PGP" "^X-Face-Version:"
;;                 "^X-UIDL:" "^X-Dispatcher:"
;;                 "^MIME-Version:" "^X-ML" "^Message-I.:"
;;                 "^Delivered-To:" "^Mailing-List:"
;;                 "^ML-Name:" "^Reply-To:" "Date:"
;;                 "^X-Loop" "^X-List-Help:"
;;                 "^X-Trace:" "^X-Complaints-To:"
;;                 "^Received-SPF:" "^Message-ID:"
;;                 "^MIME-Version:" "^Content-Transfer-Encoding:"
;;                 "^Authentication-Results:"
;;                 "^X-Priority:" "^X-MSMail-Priority:"
;;                 "^X-Mailer:" "^X-MimeOLE:"
;;                 )))

;; (add-to-list 'wl-summary-sort-specs 'rdate)

;; hook sconscript to python mode
(setq auto-mode-alist
      (cons '("SConstruct" . python-mode) auto-mode-alist))
 (setq auto-mode-alist
      (cons '("SConscript" . python-mode) auto-mode-alist))

(defun jn-disable-<> ()
  (setq c-recognize-<>-arglists nil))

;; align nicely to '=' sign
(defun align-to-equals (begin end)
  "Align region to equal signs"
   (interactive "r")
   (align-regexp begin end "\\(\\s-*\\)=" 1 1 ))

;; bind C-c a = to align-to-equals
(local-set-key (kbd "C-c a =")
               (lambda () (interactive) 
                 (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 1 nil)))

(add-hook 'c++-mode-hook 'jn-disable-<>)

;; set compile command
(global-set-key "\C-x\C-m" 'compile)
(add-hook 'c++-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command) "fdcmake && fdmake -j20")))

;; ACR stuffs

;; ACR: Get the value of the named envvar, or return a default
;;(defun acr-getenv-or-default (envvar default)
;;  (let ((value (getenv envvar)))
;;    (if (null value) default value)))

;; ACR: Finds the current source root, either via BB_HG_ROOT or
;;(defun acr-get-src-root()
;;  (acr-getenv-or-default "BB_HG_ROOT" "/with/src" ) )

;; ACR: Append the current ACR source root to the ffap path
;;(defun acr-make-ffap-c-path()
;;  (cons (acr-get-src-root) ffap-c-path))

;; ;; ACR: Hook our stuff in to ffap.
;;(defun ffap-c-mode (name)
;;  (ffap-locate-file name t (acr-make-ffap-c-path)))


;; ACR: cronjob-conf is a subdirectory containing crontabs
(add-to-list 'auto-mode-alist '("/cronjob-conf/" . sh-mode))
(add-to-list 'auto-mode-alist '("/crontabs/" . sh-mode))

;; ACR: scons files are Python
(add-to-list 'auto-mode-alist '("sconscript$" . python-mode))
(add-to-list 'auto-mode-alist '("sconstruct$" . python-mode))

;; ACR: We use .h files for C++ (not good, but what can you do). Tell
;; emacs that so it knows to put them in C++ mode.
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Turn on Erlang mode for .erl
(add-to-list 'auto-mode-alist '("\\.erl\\'" . erlang-mode))

;; ACR: We will enable buffer
(require 'uniquify)

;; ACR: use unique buffer names.
(setq uniquify-buffer-name-style 'post-forward)

;; ACR: disable tooltips - they make graphical emacs very laggy over
;; remote X sessions
(tooltip-mode -1)

;; ACR: Nobody likes ~ files
(setq make-backup-files nil)

;; ACR: stop at the end of the file, not just add newlines
;; forever. Also require that files end with a newline
(setq next-line-add-newlines nil)
(setq require-final-newline t)

;;(setq acr-elisp-load-path "/local/dist/dotfiles/emacs")
;;(add-to-list 'load-path acr-elisp-load-path)

;;(require 'acr-auto-insert)

;; ACR: find-file-at-point is cool, but we need some customization to
;; make it work right with our path remapping.
;; -- Disabled, I like ido more than ffap
;; (ffap-bindings)

;; (setq ff-other-file-alist
;;       '( ("\\.h$" (".cc" ".c" ".cpp"))
;;         ("\\.cc$" (".h"))
;;         ("\\.cpp$" (".h"))
;;         ))

;; (setq ff-search-directories
;;       (cons
;;        (acr-get-src-root)
;;        '("/with/bb/root/include" "/usr/include")))

;; ACR: setup gdb nicely
(setq gud-gdb-command-name "gdb --annotate=3")
(setq gdb-many-windows t)

;; C-c c to comment or uncomment region
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c q") 'query-replace)
(global-set-key (kbd "C-c r") 'query-replace-regexp)
(global-set-key (kbd "C-c w") 'whitespace-cleanup)

(global-set-key (kbd "C-x g") 'goto-line)
(global-set-key (kbd "C-c g") 'grep-find)

;; BBDB stuffs to work with Wanderlust
;; (setq bbdb-file "~/.emacs.d/bbdb")           ;; keep ~/ clean; set before loading
;; (require 'bbdb)
;; (bbdb-initialize)
;; (setq 
;;     bbdb-offer-save 1                        ;; 1 means save-without-asking

    
;;     bbdb-use-pop-up t                        ;; allow popups for addresses
;;     bbdb-electric-p t                        ;; be disposable with SPC
;;     bbdb-popup-target-lines  1               ;; very small
    
;;     bbdb-dwim-net-address-allow-redundancy t ;; always use full name
;;     bbdb-quiet-about-name-mismatches 2       ;; show name-mismatches 2 secs

;;     bbdb-always-add-address t                ;; add new addresses to existing...
;;                                              ;; ...contacts automatically
;;     bbdb-canonicalize-redundant-nets-p t     ;; x@foo.bar.cx => x@bar.cx

;;     bbdb-completion-type nil                 ;; complete on anything

;;     bbdb-complete-name-allow-cycling t       ;; cycle through matches
;;                                              ;; this only works partially

;;     bbbd-message-caching-enabled t           ;; be fast
;;     bbdb-use-alternate-names t               ;; use AKA


;;     bbdb-elided-display t                    ;; single-line addresses

;;     ;; auto-create addresses from mail
;;     bbdb/mail-auto-create-p 'bbdb-ignore-some-messages-hook   
;;     bbdb-ignore-some-messages-alist ;; don't ask about fake addresses
;;     ;; NOTE: there can be only one entry per header (such as To, From)
;;     ;; http://flex.ee.uec.ac.jp/texi/bbdb/bbdb_11.html

;;     '(( "From" . "no.?reply\\|DAEMON\\|daemon\\|facebookmail\\|twitter"))
;;     )

;; (require 'bbdb-wl)
;; (bbdb-wl-setup)

;; ;; i don't want to store addresses from my mailing folders
;; (setq 
;;   bbdb-wl-folder-regexp    ;; get addresses only from these folders
;;   "^\.inbox$\\|^.sent")    ;; 


;; (add-hook 'wl-mail-setup-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-c TAB") 'bbdb-complete-name) ) )

;; switch to rej files when merging
(defun switch-hg-reject ()
  (interactive)
  (let ((other-file
         (if (string= (substring (buffer-file-name) -4 nil) ".rej")
             (substring (buffer-file-name) 0 -4)
           (concat (buffer-file-name) ".rej"))))
    (if (file-exists-p other-file)
        (switch-to-buffer (find-file-noselect other-file))
      (message (format "No alternate reject file found" other-file)))))

(global-set-key (kbd "C-c j") 'switch-hg-reject)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(default ((t (:family "Source Code Pro" :foundry "adobe" :slant normal :weight semi-bold :height 98 :width normal)))))

;;(add-to-list 'default-frame-alist '(font .  "Source Code Pro-12" ))
;;(set-face-attribute 'default t :font  "Source Code Pro-12" )

;;(set-face-attribute 'default nil :font  "Source Code Pro-12" )
;;(set-frame-font   "Source Code Pro-12" nil t)
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "adobe" :slant normal :weight normal :height 98 :width normal)))))

(defun on-frame-open (frame)
    (if (not (display-graphic-p frame))
        (progn
          (set-face-background 'default "unspecified-bg" frame)
          (set-face-background 'linum   "unspecified-bg" frame)
          )
      ))
(on-frame-open (selected-frame))
(add-hook 'after-make-frame-functions 'on-frame-open)

;; setup 4 spaces indent for .py
(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (setq python-indent-offset 4)))

;; setup 4 spaces indent for .rb
(add-hook 'ruby-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (setq ruby-indent-size 4)
            (setq ruby-indent-level 4)))

;; setup 4 spaces indent for .lua
(add-hook 'lua-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (setq lua-indent-level 4)))

;; autoinsert C/C++ header
(define-auto-insert
  (cons "\\.\\([Hh]\\|hh\\|hpp\\)\\'" "My C / C++ header")
  '(nil
    "// Contents Copyright 2015 Tetrion Capital LLC. All Rights Reserved.\n"
    "\n"
    (let* ((noext (substring buffer-file-name 0 (match-beginning 0)))
           (nopath (file-name-nondirectory noext))
           (ident (concat (upcase nopath) "_H")))
      (concat "#ifndef " ident "\n"
              "#define " ident "\n\n\n"
              "\n\n#endif // " ident "\n"))
    ))

;; auto insert C/C++
(define-auto-insert
  (cons "\\.\\([Cc]\\|cc\\|cpp\\)\\'" "My C++ implementation")
  '(nil
    "// Contents Copyright 2015 Tetrion Capital LLC. All Rights Reserved.\n"
    "\n"
    (let* ((noext (substring buffer-file-name 0 (match-beginning 0)))
           (nopath (file-name-nondirectory noext))
           (ident (concat nopath ".h")))
      (if (file-exists-p ident)
          (concat "#include \"" ident "\"\n")))
    ))

;; python shell
(setq
 python-shell-interpreter "ipython" 
 python-shell-interpreter-args "" 
 python-shell-prompt-regexp "In \\[[0-9]+\\]: " 
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: " 
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion" 
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n" 
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

;; TAGS
(defun create-tags (dir-name)
     "Create tags file."
     (interactive "DDirectory: ")
     (eshell-command
      (format "find %s -type f -name \"*.h\" -o -name \"*.cc\" -o -name \"*.c\" | etags --append --lang=c++" dir-name)))

(defadvice find-tag (around refresh-etags activate)
  "Rerun etags and reload tags if tag not found and redo find-tag.
   If buffer is modified, ask about save before running etags."
  (let ((extension (file-name-extension (buffer-file-name))))
    (condition-case err
        ad-do-it
      (error (and (buffer-modified-p)
                  (not (ding))
                  (y-or-n-p "Buffer is modified, save it? ")
                  (save-buffer))
             (er-refresh-etags extension)
             ad-do-it))))

(defun er-refresh-etags (&optional extension)
  "Run etags on all peer files in current dir and reload them silently."
  (interactive)
  (shell-command (format "etags *.%s" (or extension "el")))
  (let ((tags-revert-without-query t))  ; don't query, revert silently
    (visit-tags-table default-directory nil)))
