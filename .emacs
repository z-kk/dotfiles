;; パッケージ管理
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(custom-set-variables
 '(load-home-init-file t t)
; '(package-selected-packages (quote (evil auto-complete)))
)
(custom-set-faces
 )

;; 文字コード
(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; 行数を表示する
(global-linum-mode t)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; 現在の関数名表示
(which-function-mode 1)

;; マウス有効化
(xterm-mouse-mode 1)

;; bash起動
(global-set-key (kbd "C-c t") '(lambda ()
				 (interactive)
				 (shell)))

;; iswitchb ON
;; (バッファ切り替え(C-x b)支援)
(iswitchb-mode 1)
;; 候補切り替え
(add-hook 'iswitchb-define-mode-map-hook
	  (lambda ()
	    (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
	    (define-key iswitchb-mode-map "\C-b" 'iswitchb-next-match)))

;; ウィンドウリサイズ
(global-set-key [(ctrl up)] '(lambda (arg)
			       (interactive "p")
			       (shrink-window arg)))
(global-set-key [(ctrl down)] '(lambda (arg)
				 (interactive "p")
				 (shrink-window (- arg))))

;; org mode
;(setq org-startup-indented t)
;; agenda
;(define-key global-map "\C-ca" 'org-agenda)
;(setq org-agenda-files (list (expand-file-name "~/hoge")))
;(setq org-agenda-span 'day)
;(setq org-enforce-todo-dependencies t)
;; 完了時刻
;(setq org-log-done 'time)
;(defun org-change-truncation()
;  (interactive)
;  (cond ((eq truncate-lines nil)
;	 (setq truncate-lines t))
;	(t
;	 (setq truncate-lines nil))))

;; evil
;(require 'evil)
;(evil-mode 1)
;(require 'evil-mode-line)
;(require 'evil-org)
;(define-key evil-motion-state-map (kbd ";") 'evil-window-map)

;; auto-complete
;(require 'auto-complete)
;(require 'auto-complete-config)
;(ac-config-default)
;(global-auto-complete-mode t)
;(add-to-list 'ac-modes 'org-mode)
;(add-to-list 'ac-modes 'latex-mode)
