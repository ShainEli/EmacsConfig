;;; package --- Summary
;;; Code:
;;; Commentary:
;; ==============================
;; 基础配置	Start
;; ==============================
;;不显示工具栏
(tool-bar-mode 0)

;;补全
(global-company-mode t)

;;高级补全
(use-package swiper
  :ensure t)
(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode 1))
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
;; more see https://github.com/abo-abo/swiper

;;显示行号，文件大小
(line-number-mode t)
(size-indication-mode t)
(global-linum-mode t)
(column-number-mode t)

;;缩进
(electric-indent-mode t)

;;不生成备份文件，即 xxx.xx~ 类文件
(setq make-backup-files nil)

;;全局语法高亮
(global-hl-line-mode t)

;;开启默认全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;关闭欢迎界面
(setq inhibit-splash-screen t)

;;关闭 auto-fill-mode，拒绝自动折行
(auto-fill-mode 0)

;;开启 whitespace-mode 对制表符和行为空格高亮
(whitespace-mode t)

;;开启 hl-line-mode 对当前行进行高亮
(hl-line-mode t)

;;改变光标
(setq-default cursor-type 'bar)

;;更改选中内容
(delete-selection-mode t)

;;自动将光标移动到，新创建的窗口中
(require 'popwin)
(popwin-mode 1)

;;打开上次保存的文件
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 20)
(global-set-key "\C-X\ \C-r" 'recentf-open-files)

;;自动检查匹配括号，也可手动点击 Options -> Highlight Matching Parentheses
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;关闭exec-path-from-shell从启动文件中读取PATH
(use-package exec-path-from-shell
  :ensure t
  :init
  :config
  (setq exec-path-from-shell-check-startup-files nil))

;;删除长段空格
(require 'hungry-delete)
(global-hungry-delete-mode t)
(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
   )
;;可使用customize-group进行相关配置

;; ==============================
;; 基础配置	Ends
;; ==============================

(provide 'init-base)
;;; init-base ends here
