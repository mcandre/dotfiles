;; ln -s .../emacsen-ispell-dicts.el /var/cache/dictionaries-common/emacsen-ispell-dicts.el

;; Prevent error during Emacs launch
;; by commenting out all dictionary code
;;
;; ;;; This file is part of the dictionaries-common package.
;; ;;; It has been automatically generated.
;; ;;; DO NOT EDIT!

;; ;; Adding aspell dicts

;; (add-to-list 'debian-aspell-only-dictionary-alist
;;   '("english"
;;      "[a-zA-Z]"
;;      "[^a-zA-Z]"
;;      "[']"
;;      nil
;;      ("-d" "en")
;;      nil
;;      iso-8859-1))
;; (add-to-list 'debian-aspell-only-dictionary-alist
;;   '("canadian"
;;      "[a-zA-Z]"
;;      "[^a-zA-Z]"
;;      "[']"
;;      nil
;;      ("-d" "en_CA")
;;      nil
;;      iso-8859-1))
;; (add-to-list 'debian-aspell-only-dictionary-alist
;;   '("british"
;;      "[a-zA-Z]"
;;      "[^a-zA-Z]"
;;      "[']"
;;      nil
;;      ("-d" "en_GB")
;;      nil
;;      iso-8859-1))
;; (add-to-list 'debian-aspell-only-dictionary-alist
;;   '("american"
;;      "[a-zA-Z]"
;;      "[^a-zA-Z]"
;;      "[']"
;;      nil
;;      ("-d" "en_US")
;;      nil
;;      iso-8859-1))


;; ;; Adding hunspell dicts

;; (add-to-list 'debian-hunspell-only-dictionary-alist
;;   '("australian"
;;      "[A-Za-z]"
;;      "[^A-Za-z]"
;;      "[']"
;;      nil
;;      ("-d" "en_AU")
;;      nil
;;      iso-8859-1))



;; ;; No emacsen-aspell-equivs entries were found


;; ;; An alist that will try to map hunspell locales to emacsen names

;; (setq debian-hunspell-equivs-alist '(
;;      ("en" "australian")
;;      ("en_AU" "australian")
;; ))

;; ;; Get default value for debian-hunspell-dictionary. Will be used if
;; ;; spellchecker is hunspell and ispell-local-dictionary is not set.
;; ;; We need to get it here, after debian-hunspell-equivs-alist is loaded

;; (setq debian-hunspell-dictionary (debian-ispell-get-hunspell-default))

