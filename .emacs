;; Store as ~/.emacs

;; Show line numbers
(global-linum-mode t)

;; Highlight matching parentheses
(show-paren-mode 1)

(setq
 ;; Always display error backtraces
 debug-on-error t

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

 ;; Line format: N <contents>
 linum-format "%d "
 ;; Minibuffer line and column
 line-number-mode t
 column-number-mode t

 ;; Smoother mouse scrolling
 mouse-wheel-scroll-amount '(0.01)

 ;; Default to Unix LF line endings
 default-buffer-file-coding-system 'utf-8-unix
 ;; Soft tabs
 indent-tabs-mode nil
 ;; Width: 2 spaces
 sws-tab-width 2
 ;; And JavaScript
 js-indent-level 2)

;; I said, soft tabs, width 2 spaces!
(setq-default indent-tabs-mode nil
              tab-width 2)

;; And CSS
(add-hook 'css-mode-hook
          (lambda ()
            (setq css-indent-offset 2)))
;; And Perl
(fset 'perl-mode 'cperl-mode)
;; And Python
(add-hook 'python-mode-hook
          (lambda ()
            (setq tab-width 2
                  python-indent 2
                  python-indent-offset 2)))
;; And Rust
(add-hook 'rust-mode-hook
          (lambda () (setq rust-indent-unit 2)))
;; And Go
(add-hook 'go-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
;; And Erlang
(add-hook 'erlang-mode-hook
          (lambda ()
            (setq erlang-indent-level tab-width)))
;; And Haskell
(add-hook 'haskell-mode-hook
          (lambda ()
            (turn-on-haskell-indentation)
            (setq tab-width tab-width)))
;; And PostScript
(add-hook 'ps-mode-hook
          (lambda () (setq ps-mode-tab tab-width)))
;; And Mozart/Oz
(add-hook 'oz-mode-hook
          (lambda () (setq oz-indent-chars tab-width)))
;; But not Makefiles
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

;; Force save.
(defadvice save-buffer (before save-buffer-always activate)
  (set-buffer-modified-p t))

(require 'package)
(setq package-archives
      (append '(("melpa" . "http://melpa.milkbox.net/packages/")
                ("marmalade" . "http://marmalade-repo.org/packages/"))
              package-archives))
(package-initialize)

;; Open project file by fuzzy name
(condition-case nil
    (progn
      (require 'fiplr)
      (global-set-key (kbd "C-p") 'fiplr-find-file)

      (setq fiplr-ignored-globs '((directories (".git"
                                                ".svn"
                                                ".hg"
                                                ".bzr"

                                                ;; Maven
                                                "target"
                                                "resources"))
                                  (files       (".#*"
                                                "*~"
                                                "*.so"
                                                "*.jpg"
                                                "*.png"
                                                "*.gif"
                                                "*.pdf"
                                                "*.gz"
                                                "*.zip")))))
    (error (warn "fiplr is not installed")))

(when window-system
  ;; Hide GUI toolbar
  (tool-bar-mode -1)

  ;; Monokai
  (condition-case nil
      (load-theme 'monokai t)
    (error (warn "monokai-theme is not installed")))

  ;; Font: Monaco
  (condition-case nil
      (progn
        ;; Font size: 10pt
        (set-face-attribute 'default nil :height
                            (if (eq system-type 'darwin)
                                120
                              80))
        (set-frame-font "Monaco"))
    (error (warn "Monaco font is not installed")))

  ;; File tabs
  (condition-case nil
      (progn
        (require 'tabbar)
        (tabbar-mode 1)
        ;; CUA
        (global-set-key [C-tab] 'tabbar-forward-tab)
        (global-set-key [C-S-tab] 'tabbar-backward-tab)
        (global-set-key [C-M-tab] 'tabbar-forward-group)
        (global-set-key [C-M-S-tab] 'tabbar-backward-group)
        (global-set-key (kbd "s-}") 'tabbar-forward-tab)
        (global-set-key (kbd "s-{") 'tabbar-backward-tab)
        (global-set-key (kbd "M-s-‘") 'tabbar-forward-group)
        (global-set-key (kbd "M-s-“") 'tabbar-backward-group)
        (global-set-key (kbd "s-w") 'kill-buffer)

        ;; Tab groups: irc, emacs, user
        (defun tabbar-buffer-groups ()
          (list (cond
                 ;; IRC
                 ((eq major-mode 'rcirc-mode) "irc")
                 ;; Emacs-internal / dired
                 ((or (string-match "^\\*" (buffer-name)) (eq major-mode 'dired-mode)) "emacs")
                 ;; all other buffers
                 (t "user"))))

        (condition-case nil
            (progn
              (require 'cl)
              (setq tabbar-ruler-invert-deselected nil)
              (require 'tabbar-ruler))
        (error (warn "tabbar-ruler is not installed"))))
    (error (warn "tabbar is not installed")))

  ;;
  ;; Folding
  ;;
  ;;
  ;; If hideshowvis is not installed, do not attempt to configure it,
  ;; as this will prevent packages (including hideshowvis itself)
  ;; from compiling.
  (condition-case nil
      (when (not (string-match "unknown" system-configuration))
        (require 'hideshowvis)

        (autoload 'hideshowvis-enable
          "hideshowvis"
          "Highlight foldable regions")

        (autoload 'hideshowvis-minor-mode
          "hideshowvis"
          "Will indicate regions foldable with hideshow in the fringe."
          'interactive)

        (dolist (hook '(emacs-lisp-mode-hook
                        lisp-mode-hook
                        scheme-mode-hook
                        c-mode-hook
                        c++-mode-hook
                        java-mode-hook
                        js-mode-hook
                        perl-mode-hook
                        php-mode-hook
                        tcl-mode-hook
                        vhdl-mode-hook
                        fortran-mode-hook
                        python-mode-hook))
          (add-hook hook
                    (lambda ()
                      (condition-case nil
                          (progn
                            ;; More syntax definitions
                            (require 'fold-dwim)
                            (hideshowvis-enable))
                        (error (warn "fold-dwim not installed"))))))

        ;;
        ;; +/- fold buttons
        ;;

        (define-fringe-bitmap 'hs-marker [0 24 24 126 126 24 24 0])

        (defcustom hs-fringe-face 'hs-fringe-face
          "*Specify face used to highlight the fringe on hidden regions."
          :type 'face
          :group 'hideshow)

        (defface hs-fringe-face
          '((t (:foreground "#888" :box (:line-width 2 :color "grey75" :style released-button))))
          "Face used to highlight the fringe on folded regions"
          :group 'hideshow)

        (defcustom hs-face 'hs-face
          "*Specify the face to to use for the hidden region indicator"
          :type 'face
          :group 'hideshow)

        (defface hs-face
          '((t (:background "#ff8" :box t)))
          "Face to hightlight the ... area of hidden regions"
          :group 'hideshow)

        (defun display-code-line-counts (ov)
          (when (eq 'code (overlay-get ov 'hs))
            (let* ((marker-string "*fringe-dummy*")
                   (marker-length (length marker-string))
                   (display-string (format "(%d)..." (count-lines (overlay-start ov) (overlay-end ov))))
                   )
              (overlay-put ov 'help-echo "Hidden text. C-c,= to show")
              (put-text-property 0 marker-length 'display (list 'left-fringe 'hs-marker 'hs-fringe-face) marker-string)
              (overlay-put ov 'before-string marker-string)
              (put-text-property 0 (length display-string) 'face 'hs-face display-string)
              (overlay-put ov 'display display-string))))

        (setq hs-set-up-overlay 'display-code-line-counts))
    (error (warn "hideshowvis is not installed"))))

;; Alt+F4 quits.
(global-set-key (kbd "M-<f4>") 'save-buffers-kill-terminal)

;; Improved undo
(condition-case nil
    (progn
      (require 'undo-tree)
      (global-undo-tree-mode)

      ;; CUA
      (global-unset-key (kbd "C-z"))
      (global-set-key (kbd "C-z") 'undo-tree-undo)
      (global-set-key (kbd "C-S-z") 'undo-tree-redo)
      (global-set-key (kbd "s-z") 'undo-tree-undo)
      (global-set-key (kbd "s-Z") 'undo-tree-redo))
  (error (warn "undo-tree not installed")))

;; Markdown
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; If mark exists, indent rigidly.
;; Otherwise, insert a hard or soft tab indentation.
(defun traditional-indent ()
  (interactive)
  (if mark-active
    (indent-rigidly (region-beginning) (region-end) tab-width)))
;; Inverse.
(defun traditional-outdent ()
  (interactive)
  (if mark-active
    (indent-rigidly (region-beginning) (region-end) (* tab-width -1))
    (delete-backward-char tab-width)))

;; Block indent for Markdown
(add-hook 'markdown-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil
                  tab-width 4)
          (define-key markdown-mode-map (kbd "<tab>") 'traditional-indent)
          (define-key markdown-mode-map (kbd "<backtab>") 'traditional-outdent)))

;; Use markdown-mode for *scratch*.
(condition-case nil
    (setq initial-scratch-message nil
          initial-major-mode 'markdown-mode)
  (error (warn "markdown-mode not installed")))

;; M-; toggles commenting for marked region or current line.
(autoload 'evilnc-comment-or-uncomment-lines "evil-nerd-commenter" "" t)
(global-set-key (kbd "\M-;") 'evilnc-comment-or-uncomment-lines)

;; Single dired buffer
(autoload 'dired-single-buffer "dired-single" "" t)
(autoload 'dired-single-buffer-mouse "dired-single" "" t)

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
            (setq-default auto-revert-interval 1)

            (condition-case nil
                (progn
                  ;; Hide dired file permissions
                  (require 'dired-details)
                  (dired-details-install)
                  (setq dired-details-hidden-string ""))
              (error (warn "dired-details is not installed")))

            (condition-case nil
                (progn
                  ;; Hide dired current directory (.)
                  (require 'dired+)

                  ;; Fix color theme
                  (setq-default dired-omit-files-p t)
                  (setq font-lock-maximum-decoration (quote ((dired-mode) (t . t)))
                        dired-omit-files (concat dired-omit-files "\\.")))
              (error (warn "dired+ is not installed")))))

;;
;; Syntax highlighting
;;

(add-to-list 'auto-mode-alist '(".vim\\(rc\\)?$" . vimrc-mode))

(autoload 'gitignore-mode "gitignore-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.jshintignore\\'" . gitignore-mode))
(add-to-list 'auto-mode-alist '("\\.ackrc\\'" . conf-mode))

(autoload 'ntcmd-mode "ntcmd" "" t)
(add-to-list 'auto-mode-alist '("\\.bat\\'" . ntcmd-mode))

(autoload 'oz-mode "oz" "Major mode for interacting with Oz code." t)
(add-to-list 'auto-mode-alist '("\\.oz\\'" . oz-mode))

(autoload 'R-mode "ess-site.el" "" t)
(add-to-list 'auto-mode-alist '("\\.R\\'" . R-mode))

;; We're Makefile, too!
(add-to-list 'auto-mode-alist '("\\.mf\\'" . makefile-mode))
;; We're Ruby, too!
(dolist (extension
         '("\\.rake$"
           "Rakefile$"
           "\\.gemspec$"
           "\\.ru$"
           "Gemfile$"
           "Guardfile"
           "guardrc"
           "Vagrantfile$"))
  (add-to-list 'auto-mode-alist (cons extension 'ruby-mode)))
;; We're Erlang, too!
(dolist (extension
         '("\\.hrl$"
           "\\.yrl$"
           "\\.app$"
           "\\.appSrc$"
           "\\.app.src$"
           "\\.rel$"
           "rebar.config"))
  (add-to-list 'auto-mode-alist (cons extension 'erlang-mode)))

;; We're YAML, too!
(autoload 'yaml-mode "yaml-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.reek\\'" . yaml-mode))
;; We're JavaScript, too!
(add-to-list 'auto-mode-alist '("\\.jshintrc\\'" . js-mode))

;; ERB/EJS
(condition-case nil
    (progn
      (require 'mmm-auto)
      (setq mmm-global-mode 'auto)

      ;; Handle PHP, CSS
      (mmm-add-group
       'fancy-html
       '(
         (html-php-tagged
          :submode php-mode
          :face mmm-code-submode-face
          :front "<[?]php"
          :back "[?]>")
         (html-css-attribute
          :submode css-mode
          :face mmm-declaration-submode-face
          :front "styleREMOVEME=\""
          :back "\"")))

      (mmm-add-mode-ext-class 'html-erb-mode "\\.erb\\'" 'erb)
      (mmm-add-mode-ext-class 'html-erb-mode "\\.ejs\\'" 'ejs)
      (mmm-add-mode-ext-class 'html-erb-mode nil 'html-js)
      (mmm-add-mode-ext-class 'html-erb-mode nil 'html-css)
      (add-to-list 'auto-mode-alist '("\\.erb\\'" . html-erb-mode))
      (add-to-list 'auto-mode-alist '("\\.ejs\\'"  . html-erb-mode))
      (add-to-list 'auto-mode-alist '("\\.php\\'" . html-mode))
      (add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-js))
      (add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil embedded-css))
      (add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil fancy-html)))
  (error (warn "mmm-mode is not installed")))

;; Convert hard tabs to spaces on save
(add-hook 'before-save-hook
          (lambda ()
            ;; But not Makefiles
            (if (member major-mode '(makefile-mode
                                     makefile-gmake-mode
                                     makefile-bsdmake-mode))
              (tabify (point-min) (point-max))
              (untabify (point-min) (point-max)))))
;;              (indent-region (point-min) (point-max)))))

;; Fix C family autoindent
;;
;; K&R style, and
;; Line up parentheses as well
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
    (c-add-style "gangnam-style" gangnam-style t)))
;; Dart, too
(autoload 'dart-mode "dart-mode" "" t)
(add-hook 'dart-mode-hook
  (lambda ()
    (c-add-style "dart" gangnam-style t)))

(condition-case nil
    (progn
      (require 'ack-and-a-half)
      (global-set-key (kbd "C-x C-a") 'ack-and-a-half)
      (global-set-key (kbd "s-F") 'ack-and-a-half))
  (error (warn "ack-and-a-half is not installed")))

(eval-after-load "grep"
  '(progn
     (add-to-list 'grep-find-ignored-directories "node_modules")
     (add-to-list 'grep-find-ignored-files "*.min.js")
     (add-to-list 'grep-find-ignored-files "*-min.js")))

;; (condition-case nil
;;     (load "~/Desktop/src/yaws/two-mode-mode.el")
;;   (error (warn "two-mode is not installed")))

(add-to-list 'auto-mode-alist '("\\.yaws$" . two-mode-mode))

;; IRC Authentication
(setq rcirc-default-nick "preyalone")
(setq rcirc-default-user-name "preyalone")
(setq rcirc-default-full-name "Prey Alone")

(add-hook 'rcirc-mode-hook
          (lambda ()
            (condition-case nil
                (load "~/rcirc-auth.el")
              (error (warn "~/rcirc-auth.el is not configured")))

            ;; Don't indent long messages
            (setq rcirc-fill-flag nil)

            (when window-system
              ;; Don't hide tabbar with connection rate.
              (when tabbar-header-line-format
                (setq header-line-format tabbar-header-line-format)))))

(custom-set-variables
 ;; Don't join #rcirc by default
 '(rcirc-server-alist (quote (("irc.freenode.net" :channels nil)))))
