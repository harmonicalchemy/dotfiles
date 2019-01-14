;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; File: ~/.emacs.d/init.el - Emacs Configuration for Linux and MacOS.
;; Author:   Alisha Awen - siren1@disroot.org
;; First Created:  2018-011-13
;; Info:
;;   This is my default Emacs Initialisation file for Linux & OSX.  I don't use
;;   any MS Windows machines so I don't know if this works there as well.  If
;;   you try this on Windows and get it to work, please drop me a message and I
;;   will work with you as my Windows OS test engineer.  If we get a good
;;   version of this file working on Windows I will include it in this repo
;;   and credit you as the author of any Windows config files you provide.
;;   B-)  Thanks in advance!
;;
;; Reference: Emacs Manual - 49.4 - The Emacs Initialization File
;;   https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-File.html
;;
;; Change Log: (decending cronological order)
;;
;;   2019-001-06 - Version Q1.0-2019:
;;      This new 2019 version is completely different from the current init.el
;;      commited to my dotfiles repo.  I will push this new modified file as
;;      soon as I have it working and tested.  This version finally gets the
;;      custom.el (for automated internal emacs updates) working correctly so
;;      that the emacs system leaves your init.el (this file) alone for your own
;;      custom manual configurations...
;;
;;   2018-011-13 - Version Q4.0-2018:
;;      This represents a BIG departure from my previous emacs configurations.
;;      I need to use this file to update my default init.el in my dotfiles
;;      Github repository...
;;      
;; NOTE: (mostly to self) If you change the Version (as in Change Log: above)
;;       change the Window Title to reflect that so you will know which version
;;       you are running quickly when comparing different emacs windows from
;;       different machines or VPS.
;;
;;       Change title by editing: ~/.emacs.d/lisp/super-emacs/03-interface.el 
;;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; *** Load Start time for Super Emacs ***
(defvar config-start-time
  (current-time))

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; BEGIN Emacs Manual Configurations: (add your custom scripts below)
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; Map Alt key to Meta:
;; Note: Comment this out on MacOS!. Mac already works fine with the option key.
(setq x-alt-keysym 'meta)

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; Enable this section if you need to disable mouse wheel:
;; 
;; Disable mouse wheel (and two finger swipe) scrolling because
;; it scrolls horribly and I would rather work without it. %~)
;;
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
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; Use GPG Version 2 (gpg2) instead of gpg.
;; Note: If you are using GnuPG later than V2.2 you may have to change
;; below from "gpg2" back to "gpg". (After version 2.2, the default GnuPG
;; command defaults back to "gpg" (like GnuPG was before V2).
;; However some systems have both gpg & gpg2 installed so it is best to
;; leave it below the way it is. (you could also create an alias in .bashrc)
(setq epg-gpg-program "gpg2")

;; Configure custom elisp library load path.
(add-to-list 'load-path "~/.emacs.d/lisp/")

(let ((default-directory  "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; Load path for your custom colour themes:
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/themes/")

;; Automatically sense SSH config files and set ssh-config-mode:
 (add-to-list 'auto-mode-alist '("~/.ssh/config\\'" . ssh-config-mode))

;; Alist of parameters for special frames. (Sets default Frame Dimensions)
;; You may have to play with this depending on your total screen size etc...
(setq default-frame-alist
      '((width . 101)
        (height . 38)
        (menu-bar-lines . 1)))

;; highlight current line
(global-hl-line-mode +1)

;;turn off highlight long lines
(setq whitespace-line-column 10000)

;; change all prompts to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; Turn on Visual Line Mode for text modes only
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Toggle imenu-list (and its window) on and off:
(global-set-key (kbd "C-'") #'imenu-list-smart-toggle)

;; Toggle olivetti minor mode (for writing) on and off:
(global-set-key (kbd "C-`") #'olivetti-mode)


;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; Dired Extras - (added 2018-011-04 by Alisha)

;; auto load dired-jump and dired-jump-other-window:
(autoload 'dired-jump "dired-x"
  "Jump to Dired buffer corresponding to current buffer." t)

(autoload 'dired-jump-other-window "dired-x"
  "Like \\[dired-jump] (dired-jump) but in other window." t)

(define-key global-map "\C-x\C-j" 'dired-jump)
(define-key global-map "\C-x4\C-j" 'dired-jump-other-window)

;; Load direx-x.el when dired is first invoked (e.g., when you first type C-x d)
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here:
            ;; For example:
            ;;   (setq dired-guess-shell-gnutar "gtar")
            ;;   (setq dired-x-hands-off-my-keys nil)
            ;;
            ;; Specify default ls swithes for dired to use:
            (setq-default dired-omit-files-p t)
            (setq dired-listing-switches
                  "-laB --ignore='#*' --ignore='.DS_Store' --ignore='Icon*' --group-directories-first")
            ;;
            ;; Specify which files get omitted in Dired mode:
            (setq dired-omit-files "^\\.?#\\|\\.DS_STORE\\|Icon*")
            ))
;;
(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here:
            ;; For example:
            ;;   (dired-omit-mode 1)
            ;;
            ;; Begin new dired sessions with dired-omit-mode `on` by default...
            (dired-omit-mode 1)
	    (define-key dired-mode-map (kbd "h") #'dired-omit-mode)
            ))


;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; Load Super Emacs Configuration files:
(load-file "~/.emacs.d/lisp/super-emacs/00-system.el")
(load-file "~/.emacs.d/lisp/super-emacs/01-repositories.el")
(load-file "~/.emacs.d/lisp/super-emacs/02-packages.el")
(load-file "~/.emacs.d/lisp/super-emacs/03-interface.el")
(load-file "~/.emacs.d/lisp/super-emacs/04-misc.el")
(load-file "~/.emacs.d/lisp/super-emacs/05-key-bindings.el")

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; Load Blackboard Color Theme.
;; This line Moved to: ~/.emacs.d/lisp/super-emacs/03.interface.el
;; (My Favorite - White Chalk Comments! Serious Code Colors! ;-)
;; My custom blackboard.el is loaded into my custom-themes folder...
;(load-theme 'blackboard t)

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; Load Environment Vars from shell:
;; If we are using unix in a POSIX compliant shell...
;; (e.g., OS X, Linux, BSD, with POSIX: Bash, or Zsh etc.)
;; Reference: GitHub:Purcell/exec-path-from-shell
;; Install: from MELPA exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;;Set F1 key to load man page for keyword at current curson position (woman):
(global-set-key (kbd "<f1>")
                (lambda ()
                  (interactive)
                  (let ((woman-use-topic-at-point t))
                    (woman))))


;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; mmd-mode - Multimarkdown extensions to markdown-mode:
;; Reference: GitHub:jmquigley/mmd-mode
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(add-to-list 'load-path "{~/.emacs.d/lisp/mmd-mode/}")
(require 'mmd-mode)

(add-to-list 'auto-mode-alist '("\\.md\\'" . mmd-mode))
(add-to-list 'auto-mode-alist '("\\.mdwn\\'" . mmd-mode))
(add-to-list 'auto-mode-alist '("\\.mdt\\'" . mmd-mode))
(add-to-list 'auto-mode-alist '("\\.mmd\\'" . mmd-mode))

;; Enable Smart Tabs for all supported languages:
(smart-tabs-insinuate 'c 'c++ 'javascript 'java 'cperl 'python 'ruby
                      'nxml)


;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; Org-Mode Configurations...
;;
;; Note: Org Mode is currently disabled. It's best to wait
;;       until you have a workng emacs first then try enabling
;;       ORG mode by removing comments where approprate within
;;       this init file...
;;       btw, `vmd-mode` is an ORG mode related thing...
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

;; Global Keybindings:

(global-set-key (kbd "M-N") 'org-md-export-as-markdown)
(global-set-key (kbd "M-n") 'vmd-mode) 

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; Spelling:
;;   Note: I use aspell instead of hunspell
;;   because it works better in code...
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; turn on flyspell in desired modes
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; Flyspell Correct Helm key binding:
(require 'flyspell-correct-helm)
(define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-previous-word-generic)

(setq-default ispell-program-name "aspell")

(setq ispell-program-name "aspell")
(setq ispell-dictionary "en_US")
(setq ispell-check-comments t)
(setq ispell-local-dictionary-alist
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
 
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; change case of letters:
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

;; Set Global key for Letter Case Toggle to M-c:
(global-set-key "\M-c" 'toggle-letter-case)


;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; Magit Customisation Section:
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; So far I only set a global key for git status: (more may come)
(global-set-key (kbd "C-x g") 'magit-status)


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

;; Assign j to move down, and k to move up.
(defun ora-ediff-hook ()
  (ediff-setup-keymap)
  (define-key ediff-mode-map "j" 'ediff-next-difference)
  (define-key ediff-mode-map "k" 'ediff-previous-difference))

(add-hook 'ediff-mode-hook 'ora-ediff-hook)

;; Restore Original Window Configuration after Ediff quits:
(winner-mode)
(add-hook 'ediff-after-quit-hook-internal 'winner-undo)

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; END Emacs Manual Configurations:
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; Print Welcome With Computed Emacs Load Time this configuration took:
(princ (cl-concatenate 'string
                       "Startup completed in "
                       (number-to-string (cadr (time-subtract (current-time)
                                                              config-start-time)))
                       " seconds\n\n"
                       "Welcome to [Your Machine Name] Emacs!!!\n\n"
                       "Today's date: "
                       (format-time-string "%Y %B %d"))
       (get-buffer-create (current-buffer)))

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; END ~/.emacs.d/init.el 
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
