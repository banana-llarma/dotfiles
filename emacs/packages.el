;; all my packages
;; install use-package and package-archives

(require 'package)
(setq package-archives '(
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
;; (require 'use-package)
(setq use-package-always-ensure t)

(require 'package)
(setq package-archives '(
                         ("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
;; }}}



;; packages and packages config {{{

;; language
(use-package js2-mode)
(use-package rjsx-mode)
(use-package web-mode)

(use-package evil
  :config
  (evil-mode 1)
  (evil-set-initial-state 'help-mode 'normal))

;; extra
(use-package counsel
  :config
  (evil-define-key 'normal 'global
    (kbd "SPC SPC") 'counsel-fzf
    (kbd "SPC r f") 'counsel-recentf
    (kbd "SPC c b") 'counsel-switch-buffer))

(use-package all-the-icons
  :ensure t
  :config
  (when (not (member "all-the-icons" (font-family-list)))
    (all-the-icons-install-fonts t)))

(use-package cl-lib)

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  (load-theme 'doom-gruvbox t))


(use-package lsp-mode
  :ensure t
  :defer t
  :commands (lsp lsp-deferred)
  :hook ((html-mode-hook . lsp-deferred)
         (web-mode-hook . lsp-deferred)
         (js2-mode-hook . lsp-deferred)
         (c-mode-hook . lsp-deferred)
         (css-mode-hook . lsp-deferred))
  :config
  (setq lsp-keymap-prefix "C-l"))


(use-package company
  :config
  (global-company-mode)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (company-tng-configure-default))

(use-package saveplace
  :config
  (save-place-mode))


(use-package evil-commentary
  :config
  (evil-commentary-mode))

(use-package undo-tree
  :config
  (global-undo-tree-mode 1))

(use-package ivy
  :config
  (setq ivy-use-virtual-buffers t))

;; (use-package ivy-prescient
;;   :after counsel
;;   :config
;;   (ivy-prescient-mode))

(use-package org
  :hook ((org-mode-hook . (lambda () (add-hook 'after-save-hook #'reload-config))))
  :config
  (setq org-ellipsis " ▾"))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package telephone-line
  :config
  (setq telephone-line-primary-right-separator 'telephone-line-abs-left
        telephone-line-secondary-right-separator 'telephone-line-abs-hollow-left)
  (setq telephone-line-height 24
        telephone-line-evil-use-short-tag t)
  (telephone-line-mode 1))

(use-package projectile
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package emmet-mode
  :hook ((sgml-mode-hook . emmet-mode)
         (css-mode-hook . emmet-mode)))
:config
(setq emmet-self-closing-tag-style "/")
(setq emmet-expand-jsx-className? t)
(setq emmet-move-cursor-between-quotes t)

(use-package yasnippet
  :config
  (yas-global-mode 1)
  (setq yas-snippet-dirs '("~/dotfiles/emacs/snippets"))
  (yas-reload-all))

(use-package evil-multiedit
  :config
  (evil-define-key 'normal 'global
    (kbd "C-n") 'evil-multiedit-match-and-next
    (kbd "C-p") 'evil-multiedit-match-and-prev
    (kbd "C-a") 'evil-multiedit-match-all))

(use-package format-all
  :config
  (format-all-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  (load-theme 'doom-gruvbox t))

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("js" . "src javascipt"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))
;; }}}