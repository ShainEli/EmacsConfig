;;; package --- Summary
;;; Code:
;;; Commentary:
;; the package manager
;;Tex配置
(require 'package)
(setq
 package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
		    ("gnu2" . "https://melpa.org/packages/")
		    ("gnu-cn" . "https://elpa.emacs-china.org/gnu/")
		    ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")
		    ("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
		    ("org-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
 ;;包初始化
 (package-initialize)
 ;;更新仓库里面的package
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(load "~/.emacs.d/init.el")
;;; .emacs ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(exec-path-from-shell-check-startup-files t)
 '(package-selected-packages
   (quote
    (spinner slime tide web-mode web-beautify use-package toml-mode shrink-path pos-tip popwin org lsp-ui js2-refactor iedit hungry-delete flymake-easy flycheck exec-path-from-shell emmet-mode deferred counsel cdlatex cargo auctex all-the-icons ac-js2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
