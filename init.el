;Record startup timestamp

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Load OS X Environment Vars if we are on OS X...
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(defvar super-emacs/invokation-time
  (current-time))

;Load configuration files
(load-file "~/.emacs.d/lisp/super-emacs/repositories.el")
(load-file "~/.emacs.d/lisp/super-emacs/packages.el")
(load-file "~/.emacs.d/lisp/super-emacs/interface.el")
(load-file "~/.emacs.d/lisp/super-emacs/misc.el")
(load-file "~/.emacs.d/lisp/super-emacs/key-bindings.el")

;; Configure Alisha's custom elisp library load path.
;;   Note: This now works on my iMac but may have to be
;;         tweaked to be portable to Linux.
(add-to-list 'load-path "~/.emacs.d/lisp/")

(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; Load path for themes.
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/my-lisp-lib/themes/")

;; Load Blackboard Color Theme.
(load-theme 'blackboard t)

;Print welcome message
(princ (cl-concatenate 'string
                       "Startup completed in "
                       (number-to-string (cadr (time-subtract (current-time)
                                                              super-emacs/invokation-time)))
                       " seconds\n\n"
                       "Welcome to Alisha's New iMac emacs!\n\n"
                       "Today's date: "
                       (format-time-string "%Y %B %d"))
       (get-buffer-create (current-buffer)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(org-tags-column 0)
 '(package-selected-packages
   (quote
    (markdown-mode+ markdown-mode htmlize use-package olivetti fountain-mode exec-path-from-shell vmd-mode theme-looper myterminal-controls meta-presenter which-key dired-launch material-theme neotree undo-tree ztree auto-complete buffer-move switch-window powerline ace-jump-mode multiple-cursors helm)))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120)))))

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; Alisha's Custom Configs:
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; Use GPG Version 2 (gpg2) instead of gpg.
;; TODO: upgrade GPG on Pythagoras... Make new GPG2 Keys...
(setq epg-gpg-program "gpg")

;; Global Keybindings:
(global-set-key (kbd "M-n") 'vmd-mode) 
(global-set-key (kbd "M-N") 'org-md-export-as-markdown) 

;; Load OS X Environment Vars if we are on OS X...
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(defvar super-emacs/invokation-time
  (current-time))

;Load configuration files
(load-file "~/.emacs.d/lisp/super-emacs/repositories.el")
(load-file "~/.emacs.d/lisp/super-emacs/packages.el")
(load-file "~/.emacs.d/lisp/super-emacs/interface.el")
(load-file "~/.emacs.d/lisp/super-emacs/misc.el")
(load-file "~/.emacs.d/lisp/super-emacs/key-bindings.el")

;; Configure Alisha's custom elisp library load path.
;;   Note: This now works on my iMac but may have to be
;;         tweaked to be portable to Linux.
(add-to-list 'load-path "~/.emacs.d/lisp/")

(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; Load path for themes.
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/my-lisp-lib/themes/")

;; Load Blackboard Color Theme.
(load-theme 'blackboard t)

;Print welcome message
(princ (cl-concatenate 'string
                       "Startup completed in "
                       (number-to-string (cadr (time-subtract (current-time)
                                                              super-emacs/invokation-time)))
                       " seconds\n\n"
                       "Welcome to Alisha's New iMac emacs!\n\n"
                       "Today's date: "
                       (format-time-string "%Y %B %d"))
       (get-buffer-create (current-buffer)))


;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; Alisha's Custom Configs:
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; Use GPG Version 2 (gpg2) instead of gpg.
;; TODO: upgrade GPG on Pythagoras... Make new GPG2 Keys...
(setq epg-gpg-program "gpg")

;; Global Keybindings:
(global-set-key (kbd "M-n") 'vmd-mode) 
(global-set-key (kbd "M-N") 'org-md-export-as-markdown) 

;; Alist of parameters for the initial X window frames.
;; Parameters specified here supersede the values given in
;;   `default-frame-alist'.
(setq initial-frame-alist
      '((top . 400) (left . 1067) (width . 90) (height . 47)))

;; Alist of parameters for special frames.
;; Parameters specified here supersede the values given in
;;   `default-frame-alist'.
(setq special-display-frame-alist '((width . 90) (height . 55)))

;; Alist of parameters for the Minibuffer Frame.
;;(setq minibuffer-frame-alist
;;      '((top . 1) (left . 1) (width . 90) (height . 2)))

;Set defult font to Hermit medium 13
(set-frame-font
    "-*-Hermit-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")

;; highlight current line
(global-hl-line-mode +1)

;; change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;;turn off highlight long lines
(setq whitespace-line-column 10000)

;; Disable mouse wheel (and two finger swipe) scrolling because
;; it scrolls horribly and I would rather work without it.
(mouse-wheel-mode -1)

(global-set-key [wheel-up] 'ignore)
(global-set-key [wheel-down] 'ignore)
(global-set-key [wheel-right] 'ignore)
(global-set-key [wheel-left] 'ignore)
(global-set-key [double-wheel-up] 'ignore)
(global-set-key [double-wheel-down] 'ignore)
(global-set-key [double-wheel-right] 'ignore)
(global-set-key [double-wheel-left] 'ignore)
(global-set-key [triple-wheel-up] 'ignore)
(global-set-key [triple-wheel-down] 'ignore)
(global-set-key [triple-wheel-right] 'ignore)
(global-set-key [triple-wheel-left] 'ignore)

;;
;; Org-Mode Configurations...
;;

;; Org Mode Exporters
(require 'ox-md)
(require 'ox-latex)

;; speed keys for quick navigation
(setq org-use-speed-commands 1)

;; set maximum indentation for org-mode description lists
(setq org-list-description-max-indent 5)

;; prevent org-mode demoting heading also shifting text inside sections
(setq org-adapt-indentation nil)

;; stop inline images being too big
(setq org-image-actual-width '(500))

;; automatically refresh inline images
;; http://emacs.stackexchange.com/questions/3302/live-refresh-of-inline-images-with-org-display-inline-images
(defun shk-fix-inline-images ()
  (when org-inline-image-overlays
    (org-redisplay-inline-images)))

(add-hook 'org-babel-after-execute-hook 'shk-fix-inline-images)

;; export options
;; syntax highlight code blocks
(setq org-src-fontify-natively t)
;; put caption below in tables
(setq org-export-latex-table-caption-above nil)
(setq org-latex-table-caption-above nil)
;; don't export tags
(setq org-export-with-tags nil)

;;
;; Use Custom CSS:
;;
;; Uncomment the below when you have a CSS set up...
;(setq org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"http://www.example.com/css/your-custom.css\" />
;<link rel=\"stylesheet\" type=\"text/css\" href=\"your-custom.css\" />")

;; Org-Bullets Mode:
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Github flavored Markdown preview minor-mode.
(require 'vmd-mode)

;; Turn on Visual Line Mode for text modes only
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; spelling - Taken from bjm-starter-init.el
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(use-package flyspell
             :diminish (flyspell-mode . "spell")
             :config
             (set-face-attribute 'flyspell-incorrect nil :background
                                 "selectedKnobColor" :underline '(:color "red") :weight 'bold)
             )

;; turn on flyspell in desired modes
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(setq ispell-dictionary "british")
(setq ispell-check-comments t)
(setq ispell-really-hunspell t)
(setq ispell-program-name "hunspell")
(setq ispell-local-dictionary-alist
      `(("british" "[[:alpha:]]" "[^[:alpha:]]" "[']" t ("-d" "en_GB") nil
         utf-8)))

;; change case of letters
;; http://ergoemacs.org/emacs/modernization_upcase-word.html
(defun toggle-letter-case ()
  "Toggle the letter case of current word or text selection.
Toggles between: “all lower”, “Init Caps”, “ALL CAPS”."
  (interactive)
  (let (p1 p2 (deactivate-mark nil) (case-fold-search nil))
    (if (region-active-p)
        (setq p1 (region-beginning) p2 (region-end))
      (let ((bds (bounds-of-thing-at-point 'word) ) )
        (setq p1 (car bds) p2 (cdr bds)) ) )

    (when (not (eq last-command this-command))
      (save-excursion
        (goto-char p1)
        (cond
         ((looking-at "[[:lower:]][[:lower:]]") (put this-command 'state "all lower"))
         ((looking-at "[[:upper:]][[:upper:]]") (put this-command 'state "all caps") )
         ((looking-at "[[:upper:]][[:lower:]]") (put this-command 'state "init caps") )
         ((looking-at "[[:lower:]]") (put this-command 'state "all lower"))
         ((looking-at "[[:upper:]]") (put this-command 'state "all caps") )
         (t (put this-command 'state "all lower") ) ) )
      )

    (cond
     ((string= "all lower" (get this-command 'state))
      (upcase-initials-region p1 p2) (put this-command 'state "init caps"))
     ((string= "init caps" (get this-command 'state))
      (upcase-region p1 p2) (put this-command 'state "all caps"))
     ((string= "all caps" (get this-command 'state))
      (downcase-region p1 p2) (put this-command 'state "all lower")) )
    )
  )
;;set this to M-c
(global-set-key "\M-c" 'toggle-letter-case)

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; Ediff Customizations:
;; From: https://oremacs.com/2015/01/17/setting-up-ediff/
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; Macro for setting custom variables:
(defmacro csetq (variable value)
  `(funcall (or (get ',variable 'custom-set)
                'set-default)
            ',variable ,value))

;; Don't use the weird setup with the control panel in a separate frame.
(csetq ediff-window-setup-function 'ediff-setup-windows-plain)

;; Split the windows horizontally instead of vertically.
;; (easier to follow changes)
(csetq ediff-split-window-function 'split-window-horizontally)

;; Ignore white space. (can cause problems with python)
;; If you need to view diffs of Python code you need to disable this!
(csetq ediff-diff-options "-w")

;; Restore Original Window Configuration after Ediff quits:
(winner-mode)
(add-hook 'ediff-after-quit-hook-internal 'winner-undo)
