;;; package --- Summary
;;; Code:
;;; Commentary:
;;代码片段
(require 'yasnippet)
(yas-global-mode t)
;;enable flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; ========================================
;; AucTeX settings
;; ========================================
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))
(setq TeX-PDF-Mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq reftex-plug-into-auctex t)
(setq TeX-view-program-list
      '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))
(eval-after-load 'tex
  '(progn
     (assq-delete-all 'output-pdf TeX-view-program-selection)
     (add-to-list 'TeX-view-program-selection '(output-pdf "PDF Viewer"))))
(add-hook 'LaTeX-mode-hook
          #'(lambda ()
	      (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
              (setq TeX-command-extra-options "-file-line-error -shell-escape")
              (setq TeX-command-default "XeLaTeX")
              (setq TeX-save-query  nil ) 
              ))
(custom-set-variables
 '(TeX-source-correlate-method 'synctex)
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t))
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-cdlatex)   ; with Emacs latex mode
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq-default TeX-master nil)

(provide 'init-latex)
;;; init-latex ends here
