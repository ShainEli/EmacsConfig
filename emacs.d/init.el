;;; package --- Summary
;;; Code:
;;; Commentary:
(package-initialize)
;;加载插件配置存放路径
(add-to-list 'load-path "~/.emacs.d/Config/Develop/")
(add-to-list 'load-path "~/.emacs.d/Config/UI/")
;;加载配置
(require 'init-base)
(require 'init-latex)
(require 'init-themes)
(require 'init-web)
(require 'init-lsp)
(require 'init-rust)
(require 'init-lisp)

;;; init ends here
