<<<<<<< HEAD
					; Store as ~/.emacs

=======
; Store as ~/.emacs
>>>>>>> 33b4bd6744e47054642c6e10e1fb44f024ad817f
(setq inhibit-startup-screen t)

					; Marmalade
					; http://marmalade-repo.org/
(require 'package)
(add-to-list 'package-archives 
<<<<<<< HEAD
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
=======
             '("marmalade" . "http://marmalade-repo.org/packages/"))
>>>>>>> 33b4bd6744e47054642c6e10e1fb44f024ad817f
(package-initialize)

					; MELPA
(require 'package)
(add-to-list 'package-archives
<<<<<<< HEAD
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
=======
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
>>>>>>> 33b4bd6744e47054642c6e10e1fb44f024ad817f
(package-initialize)

					; vimrc
(require 'vimrc-mode)
(add-to-list 'auto-mode-alist '(".vim\\(rc\\)?$" . vimrc-mode))

					; Markdown
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
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

<<<<<<< HEAD
					; Smooth scrolling
(require 'smooth-scrolling)

					; Monokai
					; Fix green background
=======
; ERB/EJS
(require 'mmm-auto)
(setq mmm-global-mode 'auto)
(mmm-add-mode-ext-class 'html-erb-mode "\\.erb\\'" 'erb)
(mmm-add-mode-ext-class 'html-erb-mode "\\.ejs\\'" 'ejs)
(mmm-add-mode-ext-class 'html-erb-mode nil 'html-js)
(mmm-add-mode-ext-class 'html-erb-mode nil 'html-css)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . html-erb-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'"  . html-erb-mode))

; Smooth scrolling
(require 'smooth-scrolling)

; Monokai
>>>>>>> 33b4bd6744e47054642c6e10e1fb44f024ad817f
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
<<<<<<< HEAD
					;(setq-default indent-tabs-mode nil)
					; 2 spaces
=======
; 2 spaces
>>>>>>> 33b4bd6744e47054642c6e10e1fb44f024ad817f
(setq tab-width 2)
					; That means JavaScript, too
(setq js-indent-level 2)
					; And Haskell
(add-hook 'haskell-mode-hook
<<<<<<< HEAD
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
=======
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
;(add-hook 'before-save-hook
;          (lambda ()
;                                        ; But not Makefiles or Markdown
;            (if (member major-mode '(makefile-mode makefile-gmake-mode markdown-mode))
;                (tabify (point-min) (point-max))
;              (untabify (point-min) (point-max))
;              (indent-region (point-min) (point-max)))))

; Show line numbers
>>>>>>> 33b4bd6744e47054642c6e10e1fb44f024ad817f
(global-linum-mode t)
					; With a space
(setq linum-format "%d ")

					; Disable version control integration
(remove-hook 'find-file-hooks 'vc-find-file-hook)

					; Default *scratch* contents to nil
(setq initial-scratch-message nil)
