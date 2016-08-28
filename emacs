;; personal info
(setq user-full-name "Roy Zhou")
(setq user-mail-address "zhou.youyi@gmail.com")

;; setup my customized emacs load path
(add-to-list 'load-path "~/.emacs.d/sugars" )

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; turn off menu bar
;; (menu-bar-mode -1)

;; turn off tool bar
;; (tool-bar-mode -1)

;; turn off scroll bar
(toggle-scroll-bar -1)

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

;; ido
(require 'ido)
(ido-mode t)

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
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)
(setq org-agenda-files (list "~/org/rzhou.org"))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "chocolate" :weight bold)
              ("NEXT" :foreground "sky blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "khaki" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))

(setq org-use-fast-todo-selection t)

(setq org-tag-alist '((:startgroup . nil)
                      ("@OFFICE" . ?o) ("@HOME" . ?h)
                      (:endgroup . nil)
                      ("READING" . ?r)
                      ("WRITING" . ?w)
                      ("MEETING" . ?m)))
(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))

(add-hook 'org-mode-hook 
          (lambda ()
            (local-set-key "\M-n" 'outline-next-visible-heading)
            (local-set-key "\M-p" 'outline-previous-visible-heading)
            ;; table
            (local-set-key "\C-\M-w" 'org-table-copy-region)
            (local-set-key "\C-\M-y" 'org-table-paste-rectangle)
            (local-set-key "\C-\M-l" 'org-table-sort-lines)
            ;; display images
            ;; (local-set-key "\M-I" 'org-toggle-iimage-in-org)
            ;; plot
            (local-set-key "\M-\C-g" 'org-plot/gnuplot)
            ;; fix tab
            (local-set-key "\C-y" 'yank)))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; C-Style
(c-add-style "tetrion-c-style"
             '("linux"
               (c-basic-offset . 4)
               (c-offsets-alist . ( (innamespace . [0] ) ) )
               )
             )

;; c-style
(setq c-default-style "tetrion-c-style" )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(display-time-mode t)
 '(haskell-mode-hook
   (quote
    (turn-on-haskell-decl-scan turn-on-haskell-doc turn-on-haskell-indentation)))
 '(package-selected-packages
   (quote
    (ggtags lua-mode rtags company cmake-mode solarized-theme org)))
 '(show-paren-mode t))

;; default theme
(load-theme 'solarized-dark t)

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

;; We use .h files for C++ (not good, but what can you do). Tell
;; emacs that so it knows to put them in C++ mode.
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Turn on Erlang mode for .erl
(add-to-list 'auto-mode-alist '("\\.erl\\'" . erlang-mode))

;; We will enable buffer
(require 'uniquify)

;; use unique buffer names.
(setq uniquify-buffer-name-style 'post-forward)

;; disable tooltips - they make graphical emacs very laggy over
;; remote X sessions
(tooltip-mode -1)

;; Nobody likes ~ files
(setq make-backup-files nil)

;; stop at the end of the file, not just add newlines
;; forever. Also require that files end with a newline
(setq next-line-add-newlines nil)
(setq require-final-newline t)

;; setup gdb nicely
(setq gud-gdb-command-name "gdb --annotate=3")
(setq gdb-many-windows t)

;; C-c / to comment or uncomment region
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c q") 'query-replace)
(global-set-key (kbd "C-c r") 'query-replace-regexp)
(global-set-key (kbd "C-c w") 'whitespace-cleanup)

(global-set-key (kbd "C-x g") 'goto-line)
(global-set-key (kbd "C-c g") 'grep-find)

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
 '(default ((t (:family "Source Code Pro" :foundry "adobe" :slant normal :weight normal :height 98 :width normal))))
 '(org-date ((t (:foreground "cornflower blue")))))

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

;; rtags + company mode
(require 'rtags)
(require 'company)

;; (setq rtags-autostart-diagnostics t)
;; (rtags-diagnostics)
;; (setq rtags-completions-enabled t)
;; (push 'company-rtags company-backends)
(global-company-mode)
;; (define-key c-mode-base-map (kbd "<C-.>") (function company-complete))

;; ggtags
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))
