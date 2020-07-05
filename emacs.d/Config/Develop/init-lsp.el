;;; init-lsp.el ---                                  -*- lexical-binding: t; -*-
;;; package --- Summary
;;; Commentary:
;;; Code:
(exec-path-from-shell-copy-env "PATH")
(use-package company-lsp
  :ensure t
  :config (progn
	    (push 'company-lsp company-backends)))

(use-package lsp-mode
  :ensure t
  :defines (lsp-clients-typescript-server lsp-clients-typescript-server-args)
  :hook (rust-mode . lsp)
  :init
  (setq lsp-auto-guess-root t)       ; Detect project root
  (add-hook 'rust-mode-hook #'lsp)
  (setq lsp-rust-server 'rust-analyzer)
  (setq lsp-enable-file-watchers nil)
  (setq lsp-enable-completion-at-point t)
  (setq lsp-enable-imenu t)
  (setq lsp-rust-analyzer-cargo-watch-enable nil)
  (set-face-attribute 'lsp-face-highlight-textual nil
  		      :background "#666" :foreground "#ffffff")
  )
;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :config (progn
	    ;; It seems that sideline-mode has a bug, just disable it
	    ;; bind peek key
	    (define-key lsp-ui-mode-map [remap evil-repeat-pop-next] #'lsp-ui-peek-find-definitions)
	    (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

	    (setq lsp-ui-peek-fontify 'always)
	    (setq lsp-eldoc-enable-hover nil)
	    (setq lsp-ui-doc-enable nil)
	    (setq
	     lsp-ui-sideline-enable nil
	     lsp-enable-completion-at-point nil
	     lsp-ui-doc-position 'at-point
	     lsp-ui-doc-header nil
	     lsp-ui-doc-border nil)
	    (setq lsp-ui-doc-frame-parameters '((left . -1)
						(top . -1)
						(no-accept-focus . t)
						(min-width . 0)
						(width . 0)
						(min-height . 0)
						(height . 0)
						(internal-border-width . 5)
						(vertical-scroll-bars)
						(horizontal-scroll-bars)
						(left-fringe . 0)
						(right-fringe . 0)
						(menu-bar-lines . 0)
						(tool-bar-lines . 0)
						(line-spacing . 0.1)
						(unsplittable . t)
						(undecorated . t)
						(visibility . nil)
						(mouse-wheel-frame . nil)
						(no-other-frame . t)
						(cursor-type)
						(no-special-glyphs . t)))
	    (setq lsp-ui-doc-include-signature nil)
	    )
  )

(message "loading init-lsp")
(provide 'init-lsp)
;;; init-lsp.el ends here
