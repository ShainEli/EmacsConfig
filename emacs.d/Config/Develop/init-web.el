;;; package --- Summary
;;; code:
;;; Commentary:

;;;----------------;;;
;;;    Web Mode    ;;;
;;;----------------;;;
;;; web-beautify is a formatting package of Html Css and Javascript/Json
;; for Emacs

(use-package web-beautify
  :ensure t
  :commands (web-beautify-css
             web-beautify-css-buffer
             web-beautify-html
             web-beautify-html-buffer
             web-beautify-js
             web-beautify-js-buffer))

(use-package web-mode
  :ensure t
  :mode (
	 ("\\.phtml\\'" . web-mode)
	 ("\\.tera\\'" . web-mode)
	 ("\\.tpl\\.php\\'" . web-mode)
	 ("\\.[agj]sp\\'" . web-mode)
	 ("\\.as[cp]x\\'" . web-mode)
	 ("\\.erb\\'" . web-mode)
	 ("\\.mustache\\'" . web-mode)
	 ("\\.djhtml\\'" . web-mode)
	 ("\\.vue\\'" . web-mode)
	 ("\\.css\\'" . css-mode)
	 ("\\.json\\'" . web-mode)
	 ("\\.tsx\\'" . web-mode)
	 ("\\.jsx\\'" . web-mode)
	 )
  :init(progn))

(use-package iedit
  :ensure t
  :config
  (global-set-key (kbd "M-s e") 'iedit-mode))

;;;----------------;;;
;;;     JS Mode    ;;;
;;;----------------;;;

;; improved Javascript editing mode
(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" . js2-mode)
  :init
  (add-hook 'js2-mode-hook 'js2-refactor-mode)
  (add-hook 'js2-mode-hook (lambda ()
                             (tern-mode  t)))
  )

(use-package js2-refactor
  :defer t
  :ensure t
  :init (add-hook 'js2-mode-hook 'js2-refactor-mode))
;;; Javascript auto-completion in Emacs using js2-mode's parser and Skewer-mode

(use-package ac-js2
  :ensure t
  :defer t
  :init (add-hook 'js2-mode-hook 'ac-js2-mode)
  :config (progn
	    (setq ac-js2-evaluate-calls t)
	    ))

;;;----------------;;;
;;;   Html Mode    ;;;
;;;----------------;;;

;;; Generate Html and Css code
(use-package emmet-mode
  :ensure t
  :defer t
  :init (progn
	  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
	  (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
	  (add-hook 'js2-mode-hook 'emmet-mode)
	  (add-hook 'rjsx-mode-hook 'emmet-mode)
	  ))

(defun xah-syntax-color-hex ()
  "Syntax color text of the form 「#ff1100」 and 「#abc」 in current buffer.
URL `http://ergoemacs.org/emacs/emacs_CSS_colors.html'
Version 2017-03-12"
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[[:xdigit:]]\\{3\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background
                      (let* (
                             (ms (match-string-no-properties 0))
                             (r (substring ms 1 2))
                             (g (substring ms 2 3))
                             (b (substring ms 3 4)))
                        (concat "#" r r g g b b))))))
     ("#[[:xdigit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-flush))
(add-hook 'css-mode-hook 'xah-syntax-color-hex)
(add-hook 'php-mode-hook 'xah-syntax-color-hex)
(add-hook 'html-mode-hook 'xah-syntax-color-hex)

(message "loading init-web")

;;;----------------;;;
;;;   Vue Mode     ;;;
;;;----------------;;;

;;;----------------;;;
;;;    TS Mode     ;;;
;;;----------------;;;
(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))


(provide 'init-web)

;;; init-web.el ends here
