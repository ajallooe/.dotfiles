;; Set up package load path
(add-to-list 'load-path "~/.emacs.d/lisp/")

(when (>= emacs-major-version 24)
  ;; Start package.el with emacs
  (require 'package)
  ;; Add MELPA to repository list
  (add-to-list
    'package-archives
    '("melpa" . "http://melpa.org/packages/")
    t)
  ;; Initialize package.el
  (package-initialize)
)

;; List of the packages
(setq package-list 
  '(
    base16-theme
    linum
    neotree
    yasnippet
    auto-yasnippet
    helm
    smartparens
    company
    irony
    company-irony
    company-jedi
    virtualenvwrapper
    paredit
    common-lisp-snippets
    sly
    haskell-mode
    git-gutter
    ;magit
    ag
    auctex
    auctex-latexmk
    company-auctex
    powerline
    airline-themes
    cedet
    ecb
  )
)

;; Fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents)
)

;; Install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)
  )
)

;; Set base16 ocean dark theme
(load-theme 'base16-ocean-dark t)

;; Show line numbers
(global-linum-mode t)

;; Highlight current line
(global-hl-line-mode 1)

;;; NeoTree
;(require 'neotree')
;(add-to-list 'load-path "/some/path/neotree")
;(global-set-key [f8] 'neotree-toggle')

;;; Initialize YASnippet
;(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
;(require 'yasnippet')
;(yas-global-mode 1)

;; Keys for Auto-YASnippet
(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "H-y") #'aya-expand)

(global-set-key (kbd "C-o") #'aya-open-line)

;; Start Helm
(require 'helm)

;; Smartparens
(require 'smartparens-config)

;; Start Irony
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Use comapny everywhere
(add-hook 'after-init-hook 'global-company-mode)

;; Configure company Irony backend
(eval-after-load 'company 
  '(add-to-list 'company-backends 'company-irony))

;; Setup Jedi with company
(defun my/python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

;;; Virtualenvwrapper
;(require 'virtualenvwrapper)
;(venv-initialize-interactive-shells) ;; if you want interactive shell support
;(venv-initialize-eshell) ;; if you want eshell support
;(setq venv-location "/path/to/your/virtualenvs/")

;; ParEdit    
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-moe-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; YASnippet for Python
(require 'common-lisp-snippets)

;;; Start Sly
;(add-to-list 'load-path "~/dir/to/cloned/sly")
;(require 'sly-autoloads)
;(setq inferior-lisp-program "/opt/sbcl/bin/sbcl")

;;; Haskell Mode
;(add-to-list 'load-path "~/lib/emacs/haskell-mode/")
;(require 'haskell-mode-autoloads)
;(add-to-list 'Info-default-directory-list "~/lib/emacs/haskell-mode/")

;;; Structured Haskell mode
;(add-to-list 'load-path "/path/to/structured-haskell-mode/elisp")
;(require 'shm)

;(add-hook 'haskell-mode-hook 'structured-haskell-mode)

;; Use git-gutter
(global-git-gutter-mode +1)

;; Magit


;;; Enable ag
;(add-to-list 'load-path "/path/to/ag.el")
;(require 'ag)

;; AucTeX
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; PDF mode
(setq TeX-PDF-mode t)

;; AucTex with company
(require 'company-auctex)
(company-auctex-init)

;; Powerline
(require 'powerline)
;(powerline-default-theme)

;; Airline themes
(require 'airline-themes)
(load-theme 'airline-light t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; CEDET
;; get
;; https://gist.githubusercontent.com/alexott/3930120/raw/a38d68b9af06ed42d9155c5aafbe1e14331806f4/minimial-cedet-config.el
;; put in ~/.emacs.d/config/cedet.el

;; this is intended for configuration snippets
; (add-to-list 'load-path "~/.emacs.d/"')
; ...
;(load "config/cedet.el")

;;; ECB
;(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/ecb-alexott/"))
;(require 'ecb)
;;(require 'ecb-autoloads)

;; Correct NW appearance
(custom-set-faces (if (not window-system) '(default ((t (:background
"nil"))))))
