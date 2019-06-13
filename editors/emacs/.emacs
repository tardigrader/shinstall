(require 'package)

(setq package-archives '(("gnu"       . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)

(package-initialize)

(org-babel-load-file (expand-file-name
	 "~/.emacs.d/emacs_ini.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (gruvbox-dark-medium)))
 '(custom-safe-themes
   (quote
	("8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "2a9039b093df61e4517302f40ebaf2d3e95215cb2f9684c8c1a446659ee226b9" "a622aaf6377fe1cd14e4298497b7b2cae2efc9e0ce362dade3a58c16c89e089c" "595617a3c537447aa7e76ce05c8d43146a995296ea083211225e7efc069c598f" "fd3c7bd752f48dcb7efa5f852ef858c425b1c397b73851ff8816c0580eab92f1" "3da031b25828b115c6b50bb92a117f5c0bbd3d9d0e9ba5af3cd2cb9db80db1c2" default)))
 '(display-time-mode t)
 '(inhibit-startup-screen t)
 '(org-agenda-files
   (quote
	("/home/krister/.emacs.d/org/computer/dator.org" "/home/krister/.emacs.d/org/Getting Started with Orgzly.org" "/home/krister/.emacs.d/org/articles.org" "/home/krister/.emacs.d/org/kom-ihåg.org" "/home/krister/.emacs.d/org/meeting-notes.org" "/home/krister/.emacs.d/org/notes.org" "/home/krister/.emacs.d/org/refile.org" "/home/krister/.emacs.d/org/todo/study-todo.org" "/home/krister/.emacs.d/org/todo/föreningsarbete.org" "/home/krister/.emacs.d/org/todo/computer_todo.org")))
 '(package-selected-packages
   (quote
	(gruvbox-theme gopher yasnippet-snippets which-key web-mode use-package slime robe quack paredit org-ref latex-preview-pane elpy elfeed counsel company-php company-math company-lua company-inf-ruby company-auctex ac-inf-ruby)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Liberation Mono" :foundry "1ASC" :slant normal :weight normal :height 100 :width normal)))))
