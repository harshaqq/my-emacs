
(setq package-archives '(("melpa" . "http://melpa.org/packages")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(let ((gc-cons-threshold (* 256 1024 1024))
      (file-name-handler-alist nil))

  (when (fboundp 'toolbar-mode) (toolbar-mode -1))
  (when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
  (unless  (display-graphic-p) (menu-bar-mode -1))

  (defcustom harshaqq-cache-directory (concat user-emacs-directory ".cache")
    "The storage location for various persistent files."
    :type 'directory
    :group  'harshaqq)

  (defcustom harshaqq-completion-engine
    'company
    "The completion engine."
    :type '(radio
            (const :tag "company-mode" company)
            (const :tag "auto-complete-mode" auto-complete))
    :group 'harshaqq)

  (defcustom harshaqq-switch-engine
    'helm
    "The primary engine to use for narrowing and navigation."
    :type '(radio
            (const :tag "helm" helm)
            (const :tag "ido" ido)
            (const :tag "ivy" ivy))
    :group 'harshaqq)

  (defcustom harshaqq-pair-engine
    'emacs
    "The primary engine to use auto-pairing and parenthesis matching."
    :type ('radio
           (const :tag "emacs" emacs)
           (const :tag "smartparens" smartparens))
    :group 'harshaqq)

  (setq package-enable-at-startup nil)
  (package-initialize)

  (setq custom-file (concat user-emacs-directory "custom.el"))
  (when (file-exists-p custom-file)
    (load custom-file))
