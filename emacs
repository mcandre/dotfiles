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

;; Set *scratch* to plain text
(setq initial-major-mode 'text-mode)

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

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

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
            (if (member major-mode '(makefile-mode makefile-gmake-mode))
              (tabify (point-min) (point-max))
              (untabify (point-min) (point-max)))))
;;              (indent-region (point-min) (point-max)))))

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
