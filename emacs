;; Store as ~/.emacs

;; Disable start screen
(setq inhibit-startup-screen t)

;; Disable backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-inhibited t)

;; *scratch* mostly used for bug report copypasta
(setq initial-major-mode 'markdown-mode)
;; Default *scratch* contents to nil
(setq initial-scratch-message nil)

;; Highlight matching parentheses
(show-paren-mode 1)

;; Always follow symbolic links to version controlled files
(setq vc-follow-symlinks t)

;; Show line numbers
(global-linum-mode t)
;; With a space
(setq linum-format "%d ")
;; Minibuffer line and column
(setq line-number-mode t)
(setq column-number-mode t)

;; Font: Monaco
(set-frame-font "Monaco")
;; Font size: 10pt
(set-face-attribute 'default nil :height 80)

;; Disable version control integration
(remove-hook 'find-file-hooks 'vc-find-file-hook)

;; Auto-refresh dired on file change
(add-hook 'dired-mode-hook
          (lambda ()
            (auto-revert-mode)
            (setq-default auto-revert-interval 1)))

;; Marmalade
;; http://marmalade-repo.org/
(require 'package)
(add-to-list 'package-archives 
             '("marmalade" . "http://marmalade-repo.org/packages/"))
;; MELPA
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; .emacs
(add-to-list 'auto-mode-alist '("emacs$" . emacs-lisp-mode))
;; vimrc
(require 'vimrc-mode)
(add-to-list 'auto-mode-alist '(".vim\\(rc\\)?$" . vimrc-mode))
;; Markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; MS-DOS .BAT files
(require 'ntcmd)
(add-to-list 'auto-mode-alist '("\\.bat\\'" . ntcmd-mode))
;; D
(require 'd-mode)
;; Dart
(require 'dart-mode)
;; F#
(require 'fsharp-mode)
(setq auto-mode-alist (cons '("\\.fs[iylx]?$" . fsharp-mode) auto-mode-alist))
(autoload 'fsharp-mode "fsharp" "Major mode for editing F# code." t)
(autoload 'run-fsharp "inf-fsharp" "Run an inferior F# process." t)
;; Mozart/Oz
(require 'oz)
;; We're Ruby, too!
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))

;; Smooth scrolling
;; ...

;; Monokai
(load-theme 'monokai t)

;; ERB/EJS
(require 'mmm-auto)
(setq mmm-global-mode 'auto)
(mmm-add-mode-ext-class 'html-erb-mode "\\.erb\\'" 'erb)
(mmm-add-mode-ext-class 'html-erb-mode "\\.ejs\\'" 'ejs)
(mmm-add-mode-ext-class 'html-erb-mode nil 'html-js)
(mmm-add-mode-ext-class 'html-erb-mode nil 'html-css)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . html-erb-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'"  . html-erb-mode))

;; Default to Unix LF line endings
(setq default-buffer-file-coding-system 'utf-8-unix)

;; Soft tabs
(setq indent-tabs-mode nil)
;; 2 spaces
(setq tab-width 2)
;; That means JavaScript, too
(setq js-indent-level tab-width)
;; And Erlang
(add-hook 'erlang-mode-hook
          (lambda ()
            (setq erlang-indent-level tab-width)
            (setq load-path (cons "/data/data/org.burbas.erlang/arm_erlang_R14B_rel/lib/tools-2.6.6.1/emacs/" load-path))
            (setq load-path (cons "/usr/local/Cellar/erlang/R15B03-1/lib/erlang/lib/tools-2.6.8/emacs/" load-path))
            (setq load-path (cons "C:/Program Files/erl5.10.1/lib/tools-2.6.10/emacs" load-path))
            (setq load-path (cons "C:/Program Files (x86)/erl5.10.1/lib/tools-2.6.10/emacs" load-path))
            (require 'erlang-start)))
;; And Haskell
(require 'haskell-mode)
(add-hook 'haskell-mode-hook
          (lambda ()
            (turn-on-haskell-indentation)
            (setq indent-tabs-mode nil)
            (setq tab-width tab-width)))

;; If mark exists, indent rigidly.
;; Otherwise, insert a hard or soft tab indentation.
(defun traditional-indent ()
  (interactive)
  (if mark-active
    (indent-rigidly (region-beginning) (region-end) tab-width)
    (indent-to-column tab-width)))
;; Inverse.
(defun traditional-outdent ()
  (interactive)
  (if mark-active
    (indent-rigidly (region-beginning) (region-end) (* tab-width -1))
    (delete-backward-char tab-width)))

;; And Markdown
(add-hook 'markdown-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (define-key markdown-mode-map (kbd "<tab>") 'traditional-indent)
            (define-key markdown-mode-map (kbd "<S-tab>") 'traditional-outdent)))

;; And PostScript
(add-hook 'ps-mode-hook
          (lambda () (setq ps-mode-tab tab-width)))
;; And Mozart/Oz
(add-hook 'oz-mode-hook
          (lambda () (setq oz-indent-chars tab-width)))
;; But not Makefiles
(defun hard-tabs ()
  (setq indent-tabs-mode t)
  (setq-default indent-tabs-mode t)
  (setq tab-width 2))
(add-hook 'makefile-mode-hook 'hard-tabs)
(add-hook 'makefile-gmake-mode-hook 'hard-tabs)
(add-hook 'makefile-bsdmake-mode-hook 'hard-tabs)

;; Convert hard tabs to spaces on save
(add-hook 'before-save-hook
          (lambda ()
            ;; But not Makefiles
            (if (member major-mode '(makefile-mode makefile-gmake-mode makefile-bsdmake-mode))
              (tabify (point-min) (point-max))
              (untabify (point-min) (point-max)))))
;;              (indent-region (point-min) (point-max)))))

;; Fix C family autoindent
;;
;; K&R style, and
;; Line up parentheses as well
(setq gangnam-style
  '((c-basic-offset . tab-width)
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
    (c-add-style "gangnam-style" gangnam-style t)))
;; Dart, too
(add-hook 'dart-mode-hook
  (lambda ()
    (c-add-style "dart" gangnam-style t)))

;; Evil Nerd Commenter
(require 'evil-nerd-commenter)
;; M-; toggles marked region,
;; Or current line if no mark is set.
(global-set-key "\M-;" 'evilnc-comment-or-uncomment-lines)

;; C-x O navigates to previous window
(global-set-key (kbd "C-x O") 'previous-multiframe-window)

;; File tabs
(require 'tabbar)
(tabbar-mode 1)
;; CUA
(global-set-key [C-S-tab] 'tabbar-backward-tab)
(global-set-key [C-tab] 'tabbar-forward-tab)
;; Single tab group
(setq tabbar-buffer-groups-function (lambda () '("group")))
