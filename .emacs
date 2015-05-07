;; ln -s .../.emacs ~/.emacs

;; Highlight matching parentheses
(show-paren-mode 1)

;; Typing text replaces marked regions
(delete-selection-mode 1)

(setq
 ;; Ensure final end of line
 require-final-newline t

 ;; Always display error backtraces
 debug-on-error t

 ;; Disable prompt to saving abbreviations
 save-abbrevs nil

 ;; Disable start screen
 inhibit-startup-screen t

 ;; Disable backup files
 make-backup-files nil
 auto-save-default nil
 backup-inhibited t

 ;; Disable lockfiles
 create-lockfiles nil

 ;; Always follow symbolic links to version controlled files
 vc-follow-symlinks t

 ;; Mac ls does not implement --dired
 dired-use-ls-dired nil

 ;; Minibuffer line and column
 line-number-mode t
 column-number-mode t

 ;; Smoother mouse scrolling
 mouse-wheel-scroll-amount '(0.01)

 ;; Less jumpy arrow key scrolling
 scroll-conservatively 1

 ;; Show buffer name in title bar
 frame-title-format '("%b")

 ;; Case-insensitive buffer name tab autocompletion
 read-buffer-completion-ignore-case t

 ;; Default to Unix LF line endings
 buffer-file-coding-system 'utf-8-unix
 ;; Soft tabs
 indent-tabs-mode nil
 ;; Width: 2 spaces
 sws-tab-width 2
 ;; And shell
 sh-basic-offset 2
 sh-indentation 2)

;; I say, soft tabs, width 2 spaces!
(setq-default indent-tabs-mode nil
              tab-width 2)

;; Disable version control integration
(setq vc-handled-backends ())
(remove-hook 'find-file-hooks 'vc-find-file-hook)

;; Automatically revert unmodified buffers on file change
(global-auto-revert-mode 1)

;; Fix shell-mode autoscrolling
(remove-hook 'comint-output-filter-functions
             'comint-postoutput-scroll-to-bottom)

;; Shorter M-x sh command
(defun sh () (interactive) (shell))

;; Automatically move cursor to prompt on shell up/down
(add-hook 'shell-mode-hook
          (lambda ()
            (define-key comint-mode-map (kbd "M-p")
              (lambda (arg)
                (interactive "*p")
                (goto-char (point-max))
                (comint-previous-input arg)))
            (define-key comint-mode-map (kbd "M-n")
              (lambda (arg)
                (interactive "*p")
                (goto-char (point-max))
                (comint-next-input arg)))))

;; Handle large shell output more quickly
(add-hook 'comint-output-filter-functions
          'comint-truncate-buffer)

;; Disable paging, esp. for psql
(setenv "PAGER" (executable-find "cat"))

;; Disable ncurses menubar
(menu-bar-mode -1)

;; Force save
(defadvice save-buffer (before save-buffer-always activate)
  (set-buffer-modified-p t))

;; CUA key: Alt+F4 quits
(global-set-key (kbd "M-<f4>") 'save-buffers-kill-terminal)

(require 'cask "$HOME/.cask/cask.el")
(cask-initialize)

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(if window-system
    ;; CUA tools in GUI mode
    (progn
      ;; Hide GUI toolbar
      (tool-bar-mode -1)

      ;; Font: Monaco
      ;; http://usystem.googlecode.com/files/MONACO.TTF
      (condition-case nil
          (progn
            ;; Font size: ~10pt
            (set-face-attribute 'default nil :height
                                (pcase system-type
                                  (`darwin 120)
                                  (`gnu/linux 90)))
            (set-frame-font "Monaco"))
        (error (warn "Monaco font is not installed"))))

    ;;
    ;; CUA OS copypasta in ncurses mode
    ;;
    (progn
      (defun mac-cut (text &optional push)
        (let* ((process-connection-type nil)
               (pbproxy (start-process "pbcopy" "pbcopy" "/usr/bin/pbcopy")))
          (process-send-string pbproxy text)
          (process-send-eof pbproxy)))

      (defun mac-paste () (shell-command-to-string "pbpaste"))

      (defun linux-cut-function (text &optional push)
        (with-temp-buffer
          (insert text)
          (call-process-region
           (point-min)
           (point-max)
           "xsel"
           nil
           0
           nil
           "--clipboard"
           "--input")))

      (defun linux-paste-function()
        (let ((xsel-output (shell-command-to-string "xsel --clipboard --output")))
          (unless (string= (car kill-ring) xsel-output)
            xsel-output )))

      (pcase system-type
        (`darwin (setq interprogram-cut-function 'mac-cut
                       interprogram-paste-function 'mac-paste))
        (`gnu/linux (setq x-select-enable-clipboard t
                          interprogram-cut-function 'linux-cut-function
                          interprogram-paste-function 'linux-paste-function)))

      ;;
      ;; Enable OS mouse clicking and scrolling
      ;;
      ;; Note for Mac OS X: Requires SIMBL and MouseTerm
      ;;
      ;; http://www.culater.net/software/SIMBL/SIMBL.php
      ;; https://bitheap.org/mouseterm/
      ;;
      (xterm-mouse-mode 1)
      (global-set-key [mouse-4]
                      (lambda ()
                        (interactive)
                        (scroll-down 1)))
      (global-set-key [mouse-5]
                      (lambda ()
                        (interactive)
                        (scroll-up 1)))

      ;; Work around Ubuntu server 12.04 / SSH bug
      ;;
      ;; Show buffer name in terminal title in ncurses mode
      ;; (if (and (not window-system)
      ;;          (not noninteractive)
      ;;          (string-match "^xterm" (getenv "TERM")))
      ;;     (use-package xterm-frobs
      ;;       :functions xterm-title-mode
      ;;       :config
      ;;       ;; Work around broken xterm-title in Mac OS X
      ;;       (pcase system-type
      ;;         (`darwin (progn
      ;;                    (defun my-xterm-title-hook ()
      ;;                      (xterm-set-window-title (buffer-name)))
      ;;                    (add-hook 'post-command-hook  'my-xterm-title-hook)))
      ;;         (`gnu/linux (progn
      ;;                       (use-package xterm-title
      ;;                         :config
      ;;                         (xterm-title-mode)))))))

      ))

;; Compile .emacs on save
(add-hook 'after-save-hook
          (lambda ()
            (let ((dotemacs (expand-file-name "~/.emacs")))
              (if (string= (buffer-file-name) (file-chase-links dotemacs))
                  (byte-compile-file dotemacs)))))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.mf$" . makefile-mode))
(add-to-list 'auto-mode-alist '("\\.gitconfig$" . conf-mode))
(add-to-list 'auto-mode-alist '("pylintrc" . conf-mode))
(add-to-list 'auto-mode-alist '("pep8" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.ackrc$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.editorconfig$" . conf-mode))
(add-to-list 'auto-mode-alist '("Cask$" . lisp-mode))

;; Fast line numbers
(use-package nlinum
  :config
  ;; Line number gutter in ncurses mode
  (unless window-system
    (setq nlinum-format "%d "))
  ;; :idle
  (global-nlinum-mode))

;; Show path information in buffer names and mode-lines
(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'post-forward
        uniquify-min-dir-content 7))

;; Don't bind M-: to some stupid newLISP evaluator
(use-package newlisp-mode
  :mode "\\.lsp$"
  :config
  (define-key newlisp-mode-map (kbd "M-:") nil))

;; JavaScript indentation
(add-hook 'js-mode-hook
          (lambda ()
            (setq
             js-indent-level 2
             indent-tabs-mode nil)))
(add-hook 'js2-mode-hook
          (lambda ()
            (setq js2-basic-offset 2)))
;; JSON indentation
(add-hook 'json-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))
;; Lua indentation
(use-package lua-mode
  :mode "\\.lua$"
  :defines lua-indent-level
  :init
  (add-hook 'lua-mode-hook
            (lambda ()
              (setq lua-indent-level tab-width))))
;; Tcl indentation
(add-hook 'tcl-mode-hook
          (lambda ()
            (defvar tcl-indent-level)
            (setq tcl-indent-level tab-width)))
(use-package css-mode
  :mode "\\.css$"
  :init
  (add-hook 'css-mode-hook
            (lambda ()
              (setq css-indent-offset 2))))
;; Perl indentation
(fset 'perl-mode 'cperl-mode)
;; Python indentation
(add-hook 'python-mode-hook
          (lambda ()
            (defvar python-indent)
            (defvar python-indent-offset)
            (setq tab-width 2
                  python-indent 2
                  python-indent-offset 2)))
;; Rust indentation
(use-package rust-mode
  :mode "\\.rs$"
  :defines rust-indent-unit rust-indent-offset
  :init
  (add-hook 'rust-mode-hook
            (lambda ()
              (setq rust-indent-unit tab-width
                    rust-indent-offset tab-width))))
;; Shell script indentation
(add-hook 'shell-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
;; Go indentation
(add-hook 'go-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
;; PostScript indentation
(use-package ps-mode
  :mode "\\.ps$"
  :defines ps-mode-tab
  :init
  (add-hook 'ps-mode-hook
            (lambda ()
              (setq ps-mode-tab tab-width))))
;; Objective C indentation
(add-hook 'objc-mode-hook
          (lambda ()
            (defvar indent-tabs-mode)
            (setq indent-tabs-mode nil)))
;; Mozart/Oz indentation
(use-package oz
  :mode ("\\.oz$" . oz-mode)
  :defines oz-indent-chars
  :init
  (add-hook 'oz-mode-hook
            (lambda ()
              (setq oz-indent-chars tab-width))))

(defun hard-tabs ()
  (setq-default indent-tabs-mode t)
  (setq indent-tabs-mode t
        tab-width 2))

(add-hook 'makefile-mode-hook 'hard-tabs)
(add-hook 'makefile-gmake-mode-hook 'hard-tabs)
(add-hook 'makefile-bsdmake-mode-hook 'hard-tabs)

(defun i-said-soft-tabs ()
  (untabify (point-min) (point-max))
  (indent-region (point-min) (point-max)))

(defun i-said-hard-tabs ()
  (tabify (point-min) (point-max)))

;; Find and Replace
(use-package findr
  :commands findr-query-replace)

;; Open project file by fuzzy name
(use-package fiplr
  :bind ("C-p" . fiplr-find-file)
  :defines fipl-ignored-globs
  :config
  (setq fiplr-ignored-globs
        '((directories
           ;; Version control
           (".git"
            ".svn"
            ".hg"
            ".bzr"
            ;; NPM
            "node_modules"
            ;; Bower
            "bower_components"
            ;; Maven
            "target"
            ;; Python
            "__pycache__"))
          (files
           ;; Emacs
           (".#*"
            ;; Vim
            "*~"
            ;; Objects
            "*.so"
            "*.o"
            "*.obj"
            ;; Media
            "*.jpg"
            "*.png"
            "*.gif"
            "*.pdf"
            ;; Archives
            "*.gz"
            "*.zip"))))

  ;; Better TAB handling
  (define-key *fiplr-keymap* (kbd "TAB")
    (lambda ()
      (interactive))))

;; C-x <direction> to switch windows
(use-package window-jump
  :bind (("C-x <up>" . window-jump-up)
         ("C-x <down>" . window-jump-down)
         ("C-x <left>" . window-jump-left)
         ("C-x <right>" . window-jump-right))
  :init
  ;; Wrap around
  (setq wj-wrap t)

  ;; Keep window split size uniform
  ;; Move focus to new window
  (defadvice split-window-below (after restore-balanace-below activate)
    (balance-windows)
    (window-jump-down)
    (switch-to-buffer "*scratch*"))
  (defadvice split-window-right (after restore-balance-right activate)
    (balance-windows)
    (window-jump-right)
    (switch-to-buffer "*scratch*"))
  (defadvice delete-window (after restore-balance activate)
    (balance-windows)))

;; Monokai
(use-package monokai-theme
  ;; :idle
  :config
  (load-theme 'monokai t))

;;
;; CUA-like Undo (Control+Z, Control+R)
;;
(use-package undo-tree
  :diminish undo-tree-mode
  :bind (("C-z" . undo-tree-undo)
         ("C-r" . undo-tree-redo))
  :config
  (global-undo-tree-mode)
  ;; Prevent accidental suspension on CUA undo
  (global-unset-key (kbd "C-x C-z")))

;; If mark exists, indent rigidly
(defun traditional-indent ()
  (interactive)
  (when mark-active
    (indent-rigidly (region-beginning) (region-end) tab-width)))

;; If mark exists, outdent rigidly
(defun traditional-outdent ()
  (interactive)
  (when mark-active
    (indent-rigidly (region-beginning) (region-end) (* tab-width -1))))

(use-package markdown-mode
  :mode ("\\.md$" . gfm-mode)
  :init
  ;; Use markdown-mode for *scratch*
  (setq initial-scratch-message nil
        initial-major-mode 'gfm-mode)
  :config
  ;; Block indent for Markdown
  (add-hook 'markdown-mode-hook
            (lambda ()
              (setq indent-tabs-mode nil
                    tab-width 4)
              (define-key markdown-mode-map (kbd "TAB") 'traditional-indent)
              (define-key markdown-mode-map (kbd "<backtab>") 'traditional-outdent))))

;; M-; toggles commenting for marked region or current line.
(use-package evil-nerd-commenter
  :bind ("M-;" . evilnc-comment-or-uncomment-lines))

;; Single dired buffer
(use-package dired-single
  :commands dired-single-buffer dired-single-buffer-mouse
  :defines dired-mode-map
  :config
  (add-hook 'dired-mode-hook
            (lambda ()
              ;; Enable all commands
              (setq disabled-command-function nil)

              (define-key dired-mode-map [return] 'dired-single-buffer)
              (define-key dired-mode-map [down-mouse-1] 'dired-single-buffer-mouse)
              (define-key dired-mode-map [^]
                (lambda ()
                  (interactive)
                  (dired-single-buffer "..")))

              ;; Auto-refresh dired on file change
              (auto-revert-mode)
              (setq-default auto-revert-interval 1))))

;; Hide dired file permissions
(use-package dired-details
  :commands dired-details-install
  :defines dired-details-hidden-string
  :config
  (dired-details-install)
  (setq dired-details-hidden-string ""))

(use-package ack-and-a-half
  :bind (("C-x C-a" . ack-and-a-half)
         ("s-F" . ack-and-a-half)))

(use-package dired+
  ;; :idle
  :defines dired-omit-files
  :config
  ;; Fix color theme
  (setq-default dired-omit-files-p t)
  (setq font-lock-maximum-decoration (quote ((dired-mode) (t . t))))
  (setq dired-omit-files (concat dired-omit-files "\\.")))

;;
;; Syntax highlighting
;;

;; To be fixed in Emacs 24.4
(add-to-list 'interpreter-mode-alist '("dash" . shell-script-mode))

;;
;; SQL
;;

(add-to-list 'auto-mode-alist
             '("\\.psql$" .
               (lambda ()
                 (sql-mode)
                 (sql-highlight-postgres-keywords))))

(use-package sqlup-mode
  :diminish sqlup-mode
  :config
  (add-hook 'sql-mode-hook 'sqlup-mode))

;;
;; Fix SQL indentation
;;

(defun get-previous-indentation ()
  "Get the column of the previous indented line"
  (interactive)
  (save-excursion
    (progn
      (move-beginning-of-line nil)
      (skip-chars-backward "\n \t")
      (back-to-indentation))
    (current-column)))

(defun get-current-indentation ()
  "Return column at current indentation"
  (interactive)
  (save-excursion
    (progn
      (back-to-indentation)
      (current-column))))

(defun point-at-current-indentation ()
  "Return point at current indentation"
  (interactive)
  (save-excursion
    (progn
      (move-to-column (get-current-indentation))
      (point))))

(defun point-at-column-on-line (col)
  "Returns the point at `col` on the current line"
  (interactive)
  (save-excursion
    (progn
      (move-to-column col)
      (point))))

(defun ig-move-line-to-column (col)
  "Move the line to col; fill with all spaces if moveing forward"
  (interactive "p")
  (let ((point-at-cur-indent (point-at-current-indentation))
        (col-at-cur-indent (get-current-indentation)))
    (cond (
           (= col 0)
           ;; delete to beginning of line or do nothing
           (if (= col-at-cur-indent 0)
               nil
               (delete-region point-at-cur-indent (point-at-column-on-line 0))))
          (
           (< col col-at-cur-indent)
           ;; delete from our current point BACK to col
           (delete-region (point-at-column-on-line col) point-at-cur-indent))
          (
           (> col col-at-cur-indent)
           ;; delete all text from indent to beginning of line
           (progn
             (delete-region point-at-cur-indent (point-at-column-on-line 0))
             (move-beginning-of-line nil)
             ;; add spaces forward
             (insert (make-string col ?\s)))))))

(defun ig-indent-sql ()
  "Indent by `tab-width` at most 1 time greater than the previously indented
line otherwise go to the beginning of the line indent forward by `tab-width`"
  (let ((previous (get-previous-indentation))
        (current (get-current-indentation)))
    (cond ( ;; exactly at previous line's indentation
           (= previous current)
           (ig-move-line-to-column (+ current tab-width)))

          ( ;; current is greater than previous
           (> current previous)
           ;; exactly at one indentation forward from previous lines indent
           (if (= tab-width (- current previous))
               ;; move line to beginning
               (ig-move-line-to-column 0)
               ;; go back to previous indentation level
               (ig-move-line-to-column previous)))

          (t
           (ig-move-line-to-column (+ current tab-width))))))

(add-hook 'sql-mode-hook
          (lambda ()
            (make-local-variable 'indent-line-function)
            (setq indent-line-function 'ig-indent-sql)))

(use-package mustache-mode
  :mode "\\.\\(mst|mustache\\)$")

(use-package gitignore-mode
  :mode "\\.\\(gitignore|jshintignore\\)$")

(use-package ntcmd
  :no-require t
  :mode ("\\.bat$" . ntcmd-mode))

(use-package oz
  :mode ("\\.oz$" . oz-mode))

(use-package xahk-mode
  :mode "\\.ahk$")

(use-package tbemail
  :mode ("\\.eml$" . tbemail-mode))

(use-package wolfram-mode
  :mode ("\\.ma$" . wolfram-mode))

(use-package vala-mode
  :no-require t
  :mode ("\\.vala$" . vala-mode))

(use-package powershell-mode
  :no-require t
  :mode ("\\.ps1$" . powershell-mode))

;; R
(autoload 'R-mode "ess-site.el" "" t)
(add-to-list 'auto-mode-alist '("\\.R$" . R-mode))
(add-hook 'R-mode-hook
          (lambda ()
            (defvar ess-indent-level)
            (setq ess-indent-level tab-width)))

(use-package swift-mode
  :mode "\\.swift$"
  :defines swift-indent-offset
  :init
  (add-hook 'swift-mode-hook
            (lambda ()
              (setq-local tab-width 2)
              (setq-local swift-indent-offset 2))))

;; More JavaScript files
(add-to-list 'auto-mode-alist '("\\.pjs$" . js2-mode))

;; crontab
(add-to-list 'auto-mode-alist '("\\.crontab$" . crontab-mode))

;; More Ruby files
(dolist (extension
         '("\\.rake$"
           "Rakefile$"
           "\\.gemspec$"
           "\\.ru$"
           "Gemfile$"
           "Guardfile"
           "guardrc"
           "Vagrantfile"
           "Cheffile"))
  (add-to-list 'auto-mode-alist (cons extension 'ruby-mode)))

(use-package haskell-mode
  :mode "\\.(l)?hs$"
  :functions haskell-ident-at-point
  :init
  ;; Fix Haskell indentation
  (add-hook 'haskell-mode-hook
            (lambda ()
              (turn-on-haskell-indentation)
              (setq tab-width tab-width)
              (inf-haskell-mode)))

  ;; Show Haskell type information
  (add-hook 'inf-haskell-mode-hook
            (lambda ()
              (local-set-key (kbd "M-/")
                             (lambda ()
                               (interactive)
                               (inferior-haskell-load-file nil)
                               (inferior-haskell-type (haskell-ident-at-point)))))))

(use-package erlang
  :mode
  ("\\(\\.hrl|\\.yrl|\\.app|\\.appSrc|\\.app.src|\\.rel|rebar.config\\)$" .
   erlang-mode)
  :defines erlang-indent-level erlang-electric-commands
  :config
  (add-hook 'erlang-mode-hook
            (lambda ()
              ;; Erlang indentation
              ;; Disable autocomplete
              (setq erlang-indent-level tab-width
                    erlang-electric-commands '()))))

;; More YAML files
(use-package yaml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.reek$" . yaml-mode)))

;; Node shell scripts
(use-package js2-mode
  :config
  (add-to-list 'interpreter-mode-alist '("node" . js2-mode)))

;; More JSON files
(use-package json-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.jshintrc$" . json-mode))
  (add-to-list 'auto-mode-alist '("\\.bowerrc$" . json-mode)))

;; JSP
(use-package crappy-jsp-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.jsp$" . crappy-jsp-mode)))

;; Embedded HTML/CSS/JS
(use-package mmm-mode
  :config
  ;; ERB
  (defun sanityinc/ensure-mmm-erb-loaded ()
    (require 'mmm-erb))

  (require 'derived)

  (defun sanityinc/set-up-mode-for-erb (mode)
    (add-hook (derived-mode-hook-name mode) 'sanityinc/ensure-mmm-erb-loaded)
    (mmm-add-mode-ext-class mode "\\.erb$" 'erb))

  (let ((html-erb-modes '(html-mode html-erb-mode nxml-mode)))
    (dolist (mode html-erb-modes)
      (sanityinc/set-up-mode-for-erb mode)
      (mmm-add-mode-ext-class mode "\\.r?html\\(\\.erb\\)?$" 'html-js)
      (mmm-add-mode-ext-class mode "\\.r?html\\(\\.erb\\)?$" 'html-css)))

  (mapc 'sanityinc/set-up-mode-for-erb
        '(coffee-mode js-mode js2-mode js3-mode markdown-mode textile-mode))

  (mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs$" 'ejs)

  (add-to-list 'auto-mode-alist '("\\.\\(r\\)?html\\(erb\\)?$" . html-erb-mode))
  (add-to-list 'auto-mode-alist '("\\.jst\\.ejs$"  . html-erb-mode))
  (mmm-add-mode-ext-class 'yaml-mode "\\.yaml$" 'erb)

  (dolist (mode (list 'js-mode 'js2-mode 'js3-mode))
    (mmm-add-mode-ext-class mode "\\.js\\.erb$" 'erb))

  ;; CSS
  (mmm-add-group
   'html-css
   '((css-cdata
      :submode css-mode
      :face mmm-code-submode-face
      :front "<style[^>]*>[ \t\n]*\\(//\\)?<!\\[CDATA\\[[ \t]*\n?"
      :back "[ \t]*\\(//\\)?]]>[ \t\n]*</style>"
      :insert ((?j js-tag nil @ "<style type=\"text/css\">"
                   @ "\n" _ "\n" @ "</script>" @)))
     (css
      :submode css-mode
      :face mmm-code-submode-face
      :front "<style[^>]*>[ \t]*\n?"
      :back "[ \t]*</style>"
      :insert ((?j js-tag nil @ "<style type=\"text/css\">"
                   @ "\n" _ "\n" @ "</style>" @)))
     (css-inline
      :submode css-mode
      :face mmm-code-submode-face
      :front "style=\""
      :back "\"")))
  (dolist (mode (list 'html-mode 'nxml-mode))
    (mmm-add-mode-ext-class mode "\\.r?html\\(\\.erb\\)?$" 'html-css)))

;;
;; Fix C family autoindent
;;
;; K&R style,
;; lining up parentheses as well.
;;
(setq gangnam-style
      '((tab-width . 2)
        (c-basic-offset . 2)
        (c-comment-only-line-offset . 0)
        (c-offsets-alist
         (arglist-close . c-lineup-close-paren)
         (statement-block-intro . +)
         (knr-argdecl-intro . 0)
         (substatement-open . 0)
         (substatement-label . 0)
         (label . 0)
         (statement-cont . +))))
(add-hook 'c-mode-common-hook
          (lambda ()
            (c-add-style "gangnam-style" gangnam-style t)

            (setq indent-tabs-mode nil
                  comment-start "// "
                  comment-end "")))

;; TODO: Fix ruby-mode closing parentheses/brackets nesting too deep
(use-package ruby-mode
  :defines ruby-deep-indent-paren
  :init
  (add-hook 'ruby-mode-hook
            (lambda ()
              (setq ruby-deep-indent-paren nil))))

(use-package dart-mode
  ;; :idle
  :config
  (add-hook 'dart-mode-hook
            (lambda ()
              (c-add-style "dart" gangnam-style t))))

(global-unset-key (kbd "M-/"))

;; ;;
;; ;; Autocomplete and type checking for Scala code
;; ;;
;; ;; * M-/ will show documentation, including type information, for the expression the cursor is on.
;; ;; * Type errors will be underlined.
;; ;;
;; ;; Ensime requires a number of manual setup steps:
;; ;;
;; ;; 1. Install the ensime SBT plugin: Add `addSbtPlugin("org.ensime" % "ensime-sbt-cmd" % "0.1.4")` to `Build.scala`
;; ;; 2. Generate a .ensime project file: Run sbt 'ensime generate -s'
;; ;; 3. Start an ensime server: M-x ensime
;; ;; 4. Confirm the project root directory and specific sub-project in question.
;; ;; 5. Wait for the analyzer to finish.
;; ;;
;; (use-package ensime
;;   :commands ensime-scala-mode-hook
;;   :config
;;   (add-hook 'scala-mode-hook
;;             (lambda ()
;;               (ensime-scala-mode-hook)
;;               (local-set-key (kbd "M-/") 'ensime-inspect-type-at-point))))

(use-package rainbow-mode
  :diminish rainbow-mode
  :config
  (dolist (hook '(css-mode-hook
                  html-mode-hook
                  sass-mode-hook
                  less-css-mode-hook))
    (add-hook hook 'rainbow-mode)))

;;
;; Highlight strange characters
;;

(use-package whitespace
  :diminish (global-whitespace-mode
             whitespace-mode
             whitespace-newline-mode)
  :defines whitespace-face
  :config
  (dolist (hook '(prog-mode-hook
                  conf-mode-hook
                  groovy-mode-hook
                  text-mode-hook
                  html-erb-mode-hook
                  nxml-mode-hook))
    (add-hook hook
              (lambda ()
                (setq whitespace-style
                      '(face
                        trailing
                        space-before-tab
                        space-after-tab
                        ;; work around https://github.com/jwiegley/use-package/issues/122
                        ;; indentation
                        empty)
                      ;; Make inappropriate indentations more visible
                      ;; in a dark theme like Monokai
                      whitespace-face 'whitespace-trailing)
                (whitespace-mode)))))

(use-package hideshow
  :diminish hs-minor-mode
  :bind ("M-]" . hs-toggle-hiding)
  :init
  (dolist (hook '(prog-mode-hook
                  conf-mode-hook
                  groovy-mode-hook
                  text-mode-hook
                  html-erb-mode-hook
                  nxml-mode-hook))
    (add-hook hook 'hs-minor-mode))
  :config
  ;; Fix XML folding
  (add-to-list 'hs-special-modes-alist
               (list 'nxml-mode
                     "<!--\\|<[^/>]*[^/]>"
                     "-->\\|</[^/>]*[^/]>"
                     "<!--"
                     'nxml-forward-element
                     nil))

  ;; Fix HTML folding
  (dolist (mode '(sgml-mode
                  html-mode
                  html-erb-mode))
    (add-to-list 'hs-special-modes-alist
                 (list mode
                       "<!--\\|<[^/>]*[^/]>"
                       "-->\\|</[^/>]*[^/]>"
                       "<!--"
                       'sgml-skip-tag-forward
                       nil))))

(use-package editorconfig)

;; Enable erase-buffer function
(put 'erase-buffer 'disabled nil)
