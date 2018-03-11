;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; File:     ~/.emacs -or- ~/.emacs.d/init.el - Emacs Configuration Template
;; Ref:  https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html
;; Created:  2018-003-08 by: Alisha Awen
;;;
;; Info:
;;   This is an example .emacs -or- init.el which Emacs will use when it starts.
;;   You could possibly even have both and choose to do different initializations
;;   within both if you so choose.  I use this template to create Emacs init
;;   files on MacOS, Linux (for development), and also on remote VPS web-servers
;;   (Ubuntu 16.04) where I need to do a lot of editing...
;;;
;;   This file is broken into two major sevtions:
;;;
;;   An Automated Section:
;;
;;     DO not hand edit this section.  This is where configurations are/will be
;;     programatically written by the Emacs Package Manager or other scripts...
;;
;;     NOTE: You may need to use existing "automated code blocks" from your
;;     existing emacs config file(s) in place of my custom settings below...
;;     For most cases, you will want to replace my provided settings.  Hoever if
;;     you are just statting out, leave the section below "as is" and try it out.
;;     You can ajusst them later on the fly, as you are using emacs...
;;
;;     For existing setups, remove everything between the BEGIN and END Automated
;;     Section: below and replace it with your existing "automated section(s)".
;;     Then leave it alone...  You will from then on have one tidy desiginated
;;     place for all your emacs automated customizations to be written...
;;
;;   Manual Custom Configurations Section:
;;
;;     Keep it Simple: The next section below the "Automated Section" is where
;;     you may add your Manual emacs configuratios...  That's it!  Enjoy ;-)
;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; BEGIN Automated Section: - Do Not Edit!
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(cua-mode t nil (cua-base))
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

 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("a6e31e808b22de1f6cab0ef3f0a997a83c96946c0cf2299b850ef2dc2b4b25ed" "7e413972e568937edb\
6813cdb4f1969428de89ad67b735cbbe35d765fd371c02" "68a560c46983f2cbba2e01e436573367d40abe01cc\
b416769cf127a0140f67ea" "6989ce11c92f2274d95bd515c90ef3480008ea2c189700dd667890796c68848b" \
"85bf45c8d657b8a583a5fa0dce4407d53b75d6408879beaf8b6ea75133b55d61" "65344229ccf8dd1996f671b\
bdf99779a93f8a1c2a91e4db68c1bfadfcead0ca5" "280fc63ffeccd6857dc4d4c4be759561fdffb832808e369\
ec14c5b472da533b6" "3bad407ed1e526f3ab7b0cd353fc4777cba4386820003ec21b4fe5b65756b94c" defau\
lt))))

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; END Automated Section.
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; BEGIN Manual Configurations Section: (add your custom scripts below)
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; Load OS X Environment Vars if we are on OS X...
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Use GPG Version 2 (gpg2) instead of gpg.
;(setq epg-gpg-program "gpg2")

;; Global Keybindings:
;(global-set-key (kbd "M-n") 'vmd-mode) 
;(global-set-key (kbd "M-N") 'org-md-export-as-markdown) 

;; Alist of parameters for special frames.
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


;; Load OS X Environment Vars if we are on OS X:
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; *** Super Emacs ***
(defvar super-emacs/invokation-time
  (current-time))

;; Load Super Emacs Configuration files:
(load-file "~/path/to/proj-repo/super-emacs/repositories.el")
(load-file "~/path/to/proj-repo/super-emacs/packages.el")
(load-file "~/path/to/proj-repo/super-emacs/interface.el")
(load-file "~/path/to/proj-repo/super-emacs/misc.el")
(load-file "~/path/to/proj-repo/super-emacs/key-bindings.el")

;; Configure Alisha's custom elisp library load path.
;;   Note: This is the path on my iMac.  Adjust to fit
;;   your particular environment:
(add-to-list 'load-path "~/.emacs.d/lisp/")

(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; Load path for themes. (adjust this as necessary)
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


;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; *** Enable this section if you need to disable mouse wheel:
;; 
;; Disable mouse wheel (and two finger swipe) scrolling because
;; it scrolls horribly and I would rather work without it.
;;
;(mouse-wheel-mode -1)
;(global-set-key [wheel-up] 'ignore)
;(global-set-key [wheel-down] 'ignore)
;(global-set-key [wheel-right] 'ignore)
;(global-set-key [wheel-left] 'ignore)
;(global-set-key [double-wheel-up] 'ignore)
;(global-set-key [double-wheel-down] 'ignore)
;(global-set-key [double-wheel-right] 'ignore)
;(global-set-key [double-wheel-left] 'ignore)
;(global-set-key [triple-wheel-up] 'ignore)
;(global-set-key [triple-wheel-down] 'ignore)
;(global-set-key [triple-wheel-right] 'ignore)
;(global-set-key [triple-wheel-left] 'ignore)

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

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; END Manual Configurations Section: 
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; END ~/.emacs -or- ~/.emacs.d/init.el 
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

