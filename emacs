;; Store as ~/.emacs
(setq inhibit-startup-screen t)

;; Marmalade
;; http://marmalade-repo.org/
(require 'package)
(add-to-list 'package-archives 
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

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

;; Default *scratch* as Markdown
(setq initial-major-mode 'markdown-mode)

;; D
(require 'd-mode)

;; F#
(require 'fsharp-mode)
(setq auto-mode-alist (cons '("\\.fs[iylx]?$" . fsharp-mode) auto-mode-alist))
(autoload 'fsharp-mode "fsharp" "Major mode for editing F# code." t)
(autoload 'run-fsharp "inf-fsharp" "Run an inferior F# process." t)

;; Erlang
(setq load-path (cons "/usr/local/Cellar/erlang/R15B03-1/lib/erlang/lib/tools-2.6.8/emacs/" load-path))
(setq load-path (cons "C:/Program Files/erl5.9.3.1/lib/tools-2.6.8/emacs" load-path))
(setq load-path (cons "C:/Program Files (x86)/erl5.9.3.1/lib/tools-2.6.8/emacs" load-path))
(require 'erlang-start)

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

;; Disable backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-inhibited t)

;; Highlight matching parentheses
(show-paren-mode 1)

;; Always follow symbolic links to version controlled files
(setq vc-follow-symlinks t)

;; Soft tabs
(setq indent-tabs-mode nil)
;; 2 spaces
(setq tab-width 2)
;; That means JavaScript, too
(setq js-indent-level 2)
;; And Haskell
(require 'haskell-mode)
(add-hook 'haskell-mode-hook
          (lambda ()
            (turn-on-haskell-indentation)
            (setq indent-tabs-mode nil)
            (setq tab-width 2)))
;; But not Makefiles
(defun hard-tabs ()
  (setq indent-tabs-mode t)
  (setq-default indent-tabs-mode t)
  (setq tab-width 2))
(add-hook 'makefile-mode-hook 'hard-tabs)
(add-hook 'makefile-gmake-mode-hook 'hard-tabs)
(add-hook 'makefile-bsdmake-mode-hook 'hard-tabs)
;; And not Markdown
(add-hook 'markdown-mode-hook
          (lambda ()
            (setq tab-width 4)
            ;; Tabs as literals
            (define-key markdown-mode-map (kbd "TAB") 'self-insert-command)))

;; Convert hard tabs to spaces on save
(add-hook 'before-save-hook
          (lambda ()
            ;; But not Makefiles or Markdown
            (if (member major-mode '(makefile-mode makefile-gmake-mode makefile-bsdmake-mode))
              (tabify (point-min) (point-max))
              (untabify (point-min) (point-max)))))
;;              (indent-region (point-min) (point-max)))))

;; Dart
(require 'dart-mode)

;; Fix C family autoindent
;;
;; K&R style, and
;; Line up parentheses as well
(setq gangnam-style
  '((c-basic-offset . 2)
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

;; Show line numbers
(global-linum-mode t)
;; With a space
(setq linum-format "%d ")

;; Disable version control integration
(remove-hook 'find-file-hooks 'vc-find-file-hook)

;; Default *scratch* contents to nil
(setq initial-scratch-message nil)

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

;; Auto-refresh dired on file change
(add-hook 'dired-mode-hook
          (lambda ()
            (auto-revert-mode)
            (setq-default auto-revert-interval 1)))

;; Default to Unix LF line endings
(setq default-buffer-file-coding-system 'utf-8-unix)

;; We're Ruby, too!
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
