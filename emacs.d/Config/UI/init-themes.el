;; If you want to use powerline, (require 'powerline) must be
;; before (require 'moe-theme).
;;;Code:
(add-to-list 'load-path "~/.emacs.d/themes/powerline/")
(require 'powerline)
(powerline-default-theme)

;; Moe-theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/moe-theme.el/")
(add-to-list 'load-path "~/.emacs.d/themes/moe-theme.el/")
(require 'moe-theme)

;; Show highlighted buffer-id as decoration. (Default: nil)
(setq moe-theme-highlight-buffer-id t)

;; Choose a color for mode-line.(Default: blue)
;; (Available colors: blue, orange, green ,magenta, yellow, purple, red, cyan, w/b.)
(moe-theme-set-color 'orange)

;; Finally, apply moe-theme now.
;; Choose what you like, (moe-light) or (moe-dark)
(moe-light)

(provide 'init-themes)
;;; init-themes.el ends here


