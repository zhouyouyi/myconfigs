;;; package --- Summary
;;; Commentary:
;;; my Emacs setup

;;; Code:
;; personal info
(setq user-full-name "royzhou")
(setq user-mail-address "zhou.youyi@gmail.com")

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'eldoc-mode)
(add-hook 'ielm-mode-hook 'eldoc-mode)

(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (add-to-list 'package-archives
		'("melpa" . "http://melpa.org/packages/") t)
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (require 'use-package)))

;; define my most used packages
;; easy editing parens
(use-package paredit :ensure t)

;; flycheck for syntax checking
(use-package flycheck :ensure t :config (global-flycheck-mode))

;; exec path from shell
(use-package exec-path-from-shell :ensure t :config (exec-path-from-shell-initialize))

;; CMake mode
(use-package cmake-mode :ensure t)

;; lsp mode
(require 'cc-mode)

(use-package projectile :ensure t)
(use-package treemacs :ensure t)
(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)
(use-package lsp-java :ensure t :after lsp :config (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode :ensure t :after lsp-mode :config (dap-mode t) (dap-ui-mode t))

;; smart window switch
(use-package ace-window :ensure t :bind ("C-x o" . ace-window))

;; turn off menu bar
;; (menu-bar-mode -1)

;; turn off tool bar
;; (tool-bar-mode -1)

;; turn off scroll bar
;; (toggle-scroll-bar -1)

;; turn off line numbers in certain modes
;; (require 'linum-off)

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
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/color-theme-solarized")
;; (load-theme 'solarized-dark t)

(use-package solarized-theme :ensure t :config (load-theme 'solarized-dark t))

;; ido
;; (require 'ido)
;; (ido-mode t)

;; helm
(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (helm-mode 1))

;; auto-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

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
;; (global-linum-mode nil)

;; auto reload buffers when files changed
(global-auto-revert-mode t)

;; disable bold fonts
;; (set-face-bold-p 'bold nil)

;; org mode
(use-package org :ensure t)

;; (require 'org)
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; (setq org-log-done t)
;; (setq org-agenda-files (list "~/org/rzhou.org"))

;; setq org-todo-keywords
;;       (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
;;               (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

;; (setq org-todo-keyword-faces
;;       (quote (("TODO" :foreground "chocolate" :weight bold)
;;               ("NEXT" :foreground "sky blue" :weight bold)
;;               ("DONE" :foreground "forest green" :weight bold)
;;               ("WAITING" :foreground "orange" :weight bold)
;;               ("HOLD" :foreground "khaki" :weight bold)
;;               ("CANCELLED" :foreground "forest green" :weight bold)
;;               ("MEETING" :foreground "forest green" :weight bold)
;;               ("PHONE" :foreground "forest green" :weight bold))))

;; (setq org-use-fast-todo-selection t)

;; (setq org-tag-alist '((:startgroup . nil)
;;                       ("@OFFICE" . ?o) ("@HOME" . ?h)
;;                       (:endgroup . nil)
;;                       ("READING" . ?r)
;;                       ("WRITING" . ?w)
;;                       ("MEETING" . ?m)))
;; (setq org-directory "~/org")
;; (setq org-default-notes-file (concat org-directory "/notes.org"))
;; (setq org-capture-templates
;;       '(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
;;          "* TODO %?\n  %i\n  %a")
;;         ("j" "Journal" entry (file+datetree "~/org/journal.org")
;;          "* %?\nEntered on %U\n  %i\n  %a")))

;; (add-hook 'org-mode-hook 
;;           (lambda ()
;;             (local-set-key "\M-n" 'outline-next-visible-heading)
;;             (local-set-key "\M-p" 'outline-previous-visible-heading)
;;             ;; table
;;             (local-set-key "\C-\M-w" 'org-table-copy-region)
;;             (local-set-key "\C-\M-y" 'org-table-paste-rectangle)
;;             (local-set-key "\C-\M-l" 'org-table-sort-lines)
;;             ;; display images
;;             ;; (local-set-key "\M-I" 'org-toggle-iimage-in-org)
;;             ;; plot
;;             (local-set-key "\M-\C-g" 'org-plot/gnuplot)
;;             ;; fix tab
;;             (local-set-key "\C-y" 'yank)))

;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cc" 'org-capture)
;; (global-set-key "\C-cb" 'org-iswitchb)

;; C-Style
(c-add-style "offset-4-c-style"
             '("linux"
               (c-basic-offset . 4)
               (c-offsets-alist . (
                                   (innamespace . [0])
                                   (substatement-open . [0])
                                   )
                                )
               )
             )
(setq c-default-style "offset-4-c-style" )

;; Start a server
;; (server-start)

;; hook c-x k to kll server buffer
(add-hook 'server-switch-hook
	  (lambda ()
	    (when (current-local-map)
	      (use-local-map (copy-keymap(current-local-map))))
	    (when server-buffer-clients
	      (local-set-key(kbd "C-x k") 'server-edit))))

;; compilation mode
(setq compilation-scroll-output t)

;; (defun compilation-exit-autoclose(status code msg)
;;   ;; if M-x compile exists with a 0
;;   (when (and(eq status 'exit) (zerop code))
;;     (bury-buffer "*compilation*")
;;     (delete-window (get-buffer-window (get-buffer "*compilation*"))))
;;   (cons msg code))
;; (setq compilation-exit-message-function 'compilation-exit-autoclose)

;; (defun custom-compilation-hook()
;;   (when (not (get-buffer-window "*compilation*"))
;;     (save-selected-window
;;       (save-excursion
;; 	(let* ((w(split-window-vertically))
;; 	       (h(window-height w)))
;; 	  (select-window w)
;; 	  (switch-to-buffer "*compilation*")
;; 	  (shrink-window(- h 10)))))))
;; (add-hook 'compilation-mode-hook 'custom-compilation-hook)

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

;;(add-hook 'c++-mode-hook 'flycheck-mode)
;;(add-hook 'c-mode-hook 'flycheck-mode)

;; expand region
(use-package expand-region :ensure t :config (global-set-key (kbd "C-c =") 'er/expand-region))

;; multiple cursors
(use-package multiple-cursors
	     :ensure t
	     :config
	     (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
	     (global-set-key (kbd "C-c >") 'mc/mark-next-like-this)
	     (global-set-key (kbd "C-c <") 'mc/mark-previous-like-this)
	     (global-set-key (kbd "C-c C-@") 'mc/mark-all-like-this))

;; markdown mode
(use-package markdown-mode :ensure t)

;; set compile command
(global-set-key "\C-x\C-m" 'compile)
(add-hook 'c++-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command) "fdcmake && fdmake -j20")))

;; cronjob-conf is a subdirectory containing crontabs
(add-to-list 'auto-mode-alist '("/cronjob-conf/" . sh-mode))
(add-to-list 'auto-mode-alist '("/crontabs/" . sh-mode))

;; scons files are Python
(add-to-list 'auto-mode-alist '("sconscript$" . python-mode))
(add-to-list 'auto-mode-alist '("sconstruct$" . python-mode))

;; emacs in lisp
(add-to-list 'auto-mode-alist '("emacs" . emacs-lisp-mode))

;; We use .h files for C++ (not good, but what can you do). Tell
;; emacs that so it knows to put them in C++ mode.
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Turn on Erlang mode for .erl
(add-to-list 'auto-mode-alist '("\\.erl\\'" . erlang-mode))

;; We will enable buffer
;; (require 'uniquify)

;; disable tooltips - they make graphical emacs very laggy over
;; remote X sessions
;; (tooltip-mode -1)

;; Nobody likes ~ files
(setq make-backup-files nil)

;; stop at the end of the file, not just add newlines
;; forever. Also require that files end with a newline
(setq next-line-add-newlines nil)
(setq require-final-newline t)

;; setup gdb nicely
;; (setq gud-gdb-command-name "gdb --annotate=3")
;; (setq gdb-many-windows t)

;; C-c / to comment or uncomment region
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c q") 'query-replace)
(global-set-key (kbd "C-c r") 'query-replace-regexp)
(global-set-key (kbd "C-c w") 'whitespace-cleanup)

(global-set-key (kbd "C-x g") 'goto-line)
(global-set-key (kbd "C-c g") 'grep-find)

;; switch to rej files when merging
;; (defun switch-hg-reject ()
;;   (interactive)
;;   (let ((other-file
;;          (if (string= (substring (buffer-file-name) -4 nil) ".rej")
;;              (substring (buffer-file-name) 0 -4)
;;            (concat (buffer-file-name) ".rej"))))
;;     (if (file-exists-p other-file)
;;         (switch-to-buffer (find-file-noselect other-file))
;;       (message (format "No alternate reject file found" other-file)))))

;; (global-set-key (kbd "C-c j") 'switch-hg-reject)

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "Source Code Pro" :foundry "adobe" :slant normal :weight normal :height 98 :width normal))))
;;  '(org-date ((t (:foreground "cornflower blue")))))

;; (defun on-frame-open (frame)
;;     (if (not (display-graphic-p frame))
;;         (progn
;;           (set-face-background 'default "unspecified-bg" frame)
;;           (set-face-background 'linum   "unspecified-bg" frame)
;;           )
;;       ))
;; (on-frame-open (selected-frame))
;; (add-hook 'after-make-frame-functions 'on-frame-open)

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

;; python shell
;; (setq
;;  python-shell-interpreter "ipython" 
;;  python-shell-interpreter-args "-i"
;;  )
;; (require 'python)
;; (setq ansi-color-for-comint-mode t)
;; (setq python-shell-interpreter "ipython")

;; TAGS
;; (defun create-tags (dir-name)
;;      "Create tags file."
;;      (interactive "DDirectory: ")
;;      (eshell-command
;;       (format "find %s -type f -name \"*.h\" -o -name \"*.cc\" -o -name \"*.c\" | etags --append --lang=c++" dir-name)))

;; (defadvice find-tag (around refresh-etags activate)
;;   "Rerun etags and reload tags if tag not found and redo find-tag.
;;    If buffer is modified, ask about save before running etags."
;;   (let ((extension (file-name-extension (buffer-file-name))))
;;     (condition-case err
;;         ad-do-it
;;       (error (and (buffer-modified-p)
;;                   (not (ding))
;;                   (y-or-n-p "Buffer is modified, save it? ")
;;                   (save-buffer))
;;              (er-refresh-etags extension)
;;              ad-do-it))))

;; (defun er-refresh-etags (&optional extension)
;;   "Run etags on all peer files in current dir and reload them silently."
;;   (interactive)
;;   (shell-command (format "etags *.%s" (or extension "el")))
;;   (let ((tags-revert-without-query t))  ; don't query, revert silently
;;     (visit-tags-table default-directory nil)))

;; irony mode
;; (require 'irony)
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;;(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
;; (defun my-irony-mode-hook ()
;;   (define-key irony-mode-map [remap completion-at-point]
;;     'irony-completion-at-point-async)
;;   (define-key irony-mode-map [remap complete-symbol]
;;     'irony-completion-at-point-async))
;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; rtags + company mode
;; (require 'rtags)
;; (require 'company)

;; (setq rtags-autostart-diagnostics t)
;; (rtags-diagnostics)
;; (setq rtags-completions-enabled t)
;; (push 'company-rtags company-backends)
;; (global-company-mode)
;; (define-key c-mode-base-map (kbd "<C-.>") (function company-complete))
(use-package company :ensure t :config (global-company-mode))

;; ggtags
(use-package ggtags :ensure t)
;; (require 'ggtags)
;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
;;               (ggtags-mode 1))))

;; Unbind Pesky Sleep Button
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])

(use-package magit :ensure t :bind ("C-c m" . magit-status))

(defun revert-all-buffers ()
  "Iterate through the list of buffers and revert them, e.g. after a new branch has been checked out."
  (interactive)
  (when (yes-or-no-p "Are you sure - any changes in open buffers will be lost! ")
    (let ((frm1 (selected-frame)))
      (make-frame)
      (let ((frm2 (next-frame frm1)))
        (select-frame frm2)
        (make-frame-invisible)
        (dolist (x (buffer-list))
          (let ((test-buffer (buffer-name x)))
            (when (not (string-match "\*" test-buffer))
              (when (not (file-exists-p (buffer-file-name x)))
                (select-frame frm1)
                (when (yes-or-no-p (concat "File no longer exists (" (buffer-name x) "). Close buffer? "))
                  (kill-buffer (buffer-name x)))
                (select-frame frm2))
              (when (file-exists-p (buffer-file-name x))
                (switch-to-buffer (buffer-name x))
                (revert-buffer t t t)))))
        (select-frame frm1)
        (delete-frame frm2)))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(display-time-mode t)
 '(lsp-auto-guess-root t)
 '(lsp-log-io t)
 '(package-selected-packages
   (quote
    (cmake-mode magit ggtags multiple-cursors expand-region helm dap-mode lsp-java lsp-ui company-lsp lsp-mode yasnippet treemacs projectile exec-path-from-shell flycheck paredit use-package)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 100 :width normal)))))
