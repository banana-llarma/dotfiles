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

;; (use-package ivy
;;   :config
;;   (setq ivy-use-virtual-buffers t))

(use-package swiper
:ensure t)

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

(use-package avy
  :config
  (setq avy-keys '(?a ?o ?e ?u ?h ?t ?n ?s))
  (setq avy-background t)
  (setq avy-highlight-first t)
  (setq avy-orders-alist
        '((avy-goto-char . avy-order-closest)
          (avy-goto-word-0 . avy-order-closest)))
  (evil-define-key 'normal 'global
    (kbd "C-l") 'ma/avy-goto-line
    (kbd "C-f") 'ma/avy-goto-word-1))

(use-package prescient)
(use-package company-prescient
  :config
  (company-prescient-mode))
(use-package selectrum-prescient
  :config
  (selectrum-prescient-mode))
(use-package selectrum
  :config
  (selectrum-mode +1))
(use-package evil-snipe
  :config
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))

(use-package dimmer
  :config
  (setq dimmer-adjustment-mode :foreground)
  (setq dimmer-fraction 0.5)
  (dimmer-mode t))

(use-package smart-hungry-delete
  :config
  (smart-hungry-delete-add-default-hooks)
  (evil-define-key 'insert 'global
    (kbd "<backspace>") 'smart-hungry-delete-backward-char))

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("js" . "src javascipt"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(general-define-key
 :keymaps 'normal
 "C-s" 'save-buffer
 "C-w" 'delete-window
 ":" 'execute-extended-command
 "SPC" nil
 "<M-left>" 'evil-window-left
 "<M-down>" 'evil-window-down
 "<M-up>" 'evil-window-up
 "<M-right>" 'evil-window-right
 "gd" 'lsp-find-implementation
 "u" 'undo-tree-undo
 "C-r" 'undo-tree-redo
 "n" 'evil-search-previous
 "N" 'evil-search-next
 "SPC s n" 'yas-new-snippet
 "/" 'swiper)

(general-define-key
 :keymaps 'insert
 "C-s" 'emmet-expand-line
 "C-SPC" 'yas-maybe-expand
 "<up>" 'evil-previous-line
 "<down>" 'evil-next-line)

(general-define-key
 :prefix "SPC"
 :keymaps 'normal
 "f f" 'find-file
 "h v" 'describe-variable
 "h k" 'describe-key
 "h m" 'describe-mode
 "r c" 'eval-buffer
 "r f" 'counsel-recentf)

(setq inhibit-startup-message t)
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))
(setq show-paren-style 'expression)
(setq enable-recursive-minibuffers t)
(setq org-hide-emphasis-markers t)
(setq make-backup-files nil)
;; (setq-default display-line-numbers-type 'visual)
(setq-default display-line-numbers-current-absolute t)
(setq-default display-line-numbers-width 1)
(setq-default display-line-numbers-widen t)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(scroll-bar-mode -1) ; Disable visible scrollbar
(tool-bar-mode -1) ; Disable the toolbar
(tooltip-mode -1) ; Disable tooltips
(set-fringe-mode 10) ; Give some breathing room
(menu-bar-mode -1) ; Disable the menu bar
(set-face-attribute 'default nil :font "Hack" :height 110)
(show-paren-mode t)

;; org title font size
(dolist (face '((org-level-1 . 1.4)
                (org-level-2 . 1.35)
                (org-level-3 . 1.3)
                (org-level-4 . 1.25)
                (org-level-5 . 1.2)
                (org-level-6 . 1.15)
                (org-level-7 . 1.1)
                (org-level-8 . 1.05))))
;; org bulleted list start with a •
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
;; (add-hook 'window-setup-hook 'dashboard-refresh-buffer)
(add-hook 'before-save-hook 'format-all-buffer)

;; (defun ma/org-babel-tangle-config ()
  ;; (when (string-equal (buffer-file-name)
                      ;; (expand-file-name "~/dotfiles/emacs/init.org"))
    ;; (let ((org-confirm-babel-evaluate nil))
      ;; (org-babel-tangle))))
;; 
;; (add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'ma/org-babel-tangle-config)))

(evil-define-motion evil-next-line (count)
  "Move the cursor COUNT lines down."
  :type line
  (let (line-move-visual)
    (evil-line-move (or count 1)))
  (recenter))

(evil-define-motion evil-previous-line (count)
  "Move the cursor COUNT lines up."
  :type line
  (let (line-move-visual)
    (evil-line-move (- (or count 1))))
  (recenter))

(evil-define-motion evil-next-visual-line (count)
  "Move the cursor COUNT screen lines down."
  :type exclusive
  (let ((line-move-visual t))
    (evil-line-move (or count 1)))
  (recenter))

(evil-define-motion evil-previous-visual-line (count)
  "Move the cursor COUNT screen lines up."
  :type exclusive
  (let ((line-move-visual t))
    (evil-line-move (- (or count 1))))
  (recenter))

(defun reload-config ()
  (when (string-equal
         (buffer-file-name)
         (expand-file-name "~/dotfiles/emacs/init.org"))
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(defun ma/avy-goto-char-2 (char1 char2 &optional arg beg end)
  (interactive (list (let ((c1 (read-char "char 1: " t)))
                       (if (memq c1 '(? ?\b))
                           (keyboard-quit)
                         c1))
                     (let ((c2 (read-char "char 2: " t)))
                       (cond ((eq c2 ?)
                              (keyboard-quit))
                             ((memq c2 avy-del-last-char-by)
                              (keyboard-escape-quit)
                              (call-interactively 'avy-goto-char-2))
                             (t
                              c2)))
                     current-prefix-arg
                     nil nil))
  (when (eq char1 ?)
    (setq char1 ?\n))
  (when (eq char2 ?)
    (setq char2 ?\n))
  (avy-with avy-goto-char-2
    (avy-jump
     (regexp-quote (string char1 char2))
     :window-flip arg
     :beg beg
     :end end))
  (recenter))

(defun ma/avy-goto-word-1 (char &optional arg beg end symbol)
  (interactive (list (read-char "char: " t)
                     current-prefix-arg))
  (avy-with avy-goto-word-1
    (let* ((str (string char))
           (regex (cond ((string= str ".")
                         "\\.")
                        ((and avy-word-punc-regexp
                              (string-match avy-word-punc-regexp str))
                         (regexp-quote str))
                        ((<= char 26)
                         str)
                        (t
                         (concat
                          (if symbol "\\_<" "\\b")
                          str)))))
      (avy-jump regex
                :window-flip arg
                :beg beg
                :end end)))
  (recenter))

(defun ma/avy-goto-line ()
  (interactive)
  (avy-goto-line)
  (recenter))

(defun my/config-reload ()
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))


(use-package iedit)

(use-package general)
(message "hello")
(message "hello")
(message "hello")
(message "hello")
(message "hello")
(message "hello")
(message "hello")
