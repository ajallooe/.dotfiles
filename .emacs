(when (>= emacs-major-version 24)
  ; start package.el with emacs
  (require 'package)
  ; add MELPA to repository list
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  ; initialize package.el
  (package-initialize)
)
; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
; lets's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'autocomplete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1")
  (add-to-list 'achead:include-directories '" /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/6.0/include")
  (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include")
  (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr/include")
)
; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;old configs
; (add-to-list 'load-path "~/.emacs.d/")
; (require 'auto-complete-config)
; (add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
; (ac-config-default)
