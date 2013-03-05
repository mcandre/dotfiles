; Store as ~/.emacs

(setq inhibit-startup-screen t)

; Marmalade
; http://marmalade-repo.org/
(require 'package)
(add-to-list 'package-archives 
  '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

; MELPA
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

; vimrc
(require 'vimrc-mode)
(add-to-list 'auto-mode-alist '(".vim\\(rc\\)?$" . vimrc-mode))

; Markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
; Set default mode Markdown
(setq-default major-mode 'markdown-mode)
; Set *scratch* to Markdown
(setq initial-major-mode 'markdown-mode)

; F#
(require 'fsharp-mode)
(setq auto-mode-alist (cons '("\\.fs[iylx]?$" . fsharp-mode) auto-mode-alist))
(autoload 'fsharp-mode "fsharp" "Major mode for editing F# code." t)
(autoload 'run-fsharp "inf-fsharp" "Run an inferior F# process." t)

; Erlang
(setq load-path (cons "/usr/local/Cellar/erlang/R15B03-1/lib/erlang/lib/tools-2.6.8/emacs/" load-path))
(setq load-path (cons "C:/Program Files/erl5.9.3.1/lib/tools-2.6.8/emacs" load-path))
(setq load-path (cons "C:/Program Files (x86)/erl5.9.3.1/lib/tools-2.6.8/emacs" load-path))
(require 'erlang-start)

; Smooth scrolling
(require 'smooth-scrolling)

; Monokai
; Fix green background
(load-theme 'monokai t)

; Disable backup files
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-inhibited t)

; Highlight matching parentheses
(show-paren-mode 1)

; Always follow symbolic links to version controlled files
(setq vc-follow-symlinks t)

; Soft tabs
(setq indent-tabs-mode nil)
;(setq-default indent-tabs-mode nil)
; 2 spaces
(setq tab-width 2)
; That means JavaScript, too
(setq js-indent-level 2)
; And Haskell
(add-hook 'haskell-mode-hook
  (lambda ()
    (turn-on-haskell-indentation)
    (setq indent-tabs-mode nil)
    (setq tab-width 2)))
; But not Makefiles
(add-hook 'makefile-mode-hook
  (lambda ()
    (setq indent-tabs-mode t)
    (setq-default indent-tabs-mode t)
    (setq tab-width 2)))
(add-hook 'makefile-gmake-mode-hook
  (lambda ()
    (setq indent-tabs-mode t)
    (setq-default indent-tabs-mode t)
    (setq tab-width 2)))
; And not Markdown
(add-hook 'markdown-mode-hook
  (lambda ()
    (setq indent-tabs-mode t)
    (setq-default indent-tabs-mode t)
    (setq tab-width 2)))
; Convert hard tabs to spaces on save
(add-hook 'before-save-hook
  (lambda ()
    ; But not Makefiles or Markdown
    (if (member major-mode '(makefile-mode makefile-gmake-mode markdown-mode))
      (tabify (point-min) (point-max))
      (untabify (point-min) (point-max))
    (indent-region (point-min) (point-max)))))

; Show line numbers
(global-linum-mode t)
; With a space
(setq linum-format "%d ")

; Disable version control integration
(remove-hook 'find-file-hooks 'vc-find-file-hook)
