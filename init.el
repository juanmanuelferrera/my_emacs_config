;; Author: Rahul Martim Juliato
;; URL: https://github.com/LionyxML/emacs-solo
;; Package-Requires: ((emacs "30.1"))
;; Keywords: config


;;; -------------------- GENERAL EMACS CONFIG
;;; EMACS
(use-package emacs
  :ensure nil
  :bind
  (("M-o" . other-window)
   ("C-g" . keyboard-quit)  ; Ensure C-g is bound to keyboard-quit
   ("M-g r" . recentf)
   ("M-s g" . grep)
   ("M-s f" . find-name-dired)
   ("C-x C-b" . ibuffer)
   ("C-x w t"  . transpose-window-layout)            ; EMACS-31
   ("C-x w r"  . rotate-windows)                     ; EMACS-31
   ("C-x w f h"  . flip-window-layout-horizontally)  ; EMACS-31
   ("C-x w f v"  . flip-window-layout-vertically)    ; EMACS-31
   ("RET" . newline-and-indent)
   ("C-z" . nil)
   ("C-x C-z" . nil)
   ("C-x C-k RET" . nil))
  :custom
  (ad-redefinition-action 'accept)
  (column-number-mode nil)
  (line-number-mode nil)
  (completion-ignore-case t)
  (completions-detailed t)
  (delete-by-moving-to-trash t)
  (display-line-numbers-width 3)
  (display-line-numbers-widen t)
  (delete-selection-mode 1)
  (enable-recursive-minibuffers t)
  (find-ls-option '("-exec ls -ldh {} +" . "-ldh"))  ; find-dired results with human readable sizes
  (frame-resize-pixelwise t)
  (global-auto-revert-non-file-buffers t)
  (help-window-select t)
  (history-length 300)
  (inhibit-startup-message t)
  (initial-scratch-message "")
  (ispell-dictionary "en_US")
  (kill-do-not-save-duplicates t)
  (create-lockfiles nil)   ; No backup files
  (make-backup-files nil)  ; No backup files
  (backup-inhibited t)     ; No backup files
  (pixel-scroll-precision-mode t)
  (pixel-scroll-precision-use-momentum nil)
  (ring-bell-function 'ignore)
  (read-answer-short t)
  (recentf-max-saved-items 300) ; default is 20
  (recentf-max-menu-items 15)
  (recentf-auto-cleanup (if (daemonp) 300 'never))
  (recentf-exclude (list "^/\\(?:ssh\\|su\\|sudo\\)?:"))
  (remote-file-name-inhibit-delete-by-moving-to-trash t)
  (remote-file-name-inhibit-auto-save t)
  (resize-mini-windows 'grow-only)
  (ring-bell-function #'ignore)
  (scroll-conservatively 8)
  (scroll-margin 5)
  (savehist-save-minibuffer-history t)    ; t is default
  (savehist-additional-variables
   '(kill-ring                            ; clipboard
     register-alist                       ; macros
     mark-ring global-mark-ring           ; marks
     search-ring regexp-search-ring))     ; searches
  (save-place-file (expand-file-name "saveplace" user-emacs-directory))
  (save-place-limit 600)
  (set-mark-command-repeat-pop t) ; So we can use C-u C-SPC C-SPC C-SPC... instead of C-u C-SPC C-u C-SPC...
  (split-width-threshold 170)     ; So vertical splits are preferred
  (split-height-threshold nil)
  (shr-use-colors nil)
  (switch-to-buffer-obey-display-actions t)
  (tab-always-indent 'complete)
  (tab-width 4)
  (tab-bar-close-button-show nil)
  (tab-bar-new-button-show nil)
  (tab-bar-tab-hints t)
  (treesit-font-lock-level 4)
  (truncate-lines t)
  (undo-limit (* 13 160000))
  (undo-strong-limit (* 13 240000))
  (undo-outer-limit (* 13 24000000))
  (use-dialog-box nil)
  (use-file-dialog nil)
  (use-short-answers t)
  (visible-bell nil)
  (window-combination-resize t)
  (window-resize-pixelwise nil)
  (xref-search-program 'ripgrep)
  (grep-command "rg -nS --no-heading ")
  (grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "node_modules" "build" "dist"))
  :config
  ;; Makes everything accept utf-8 as default, so buffers with tsx and so
  ;; won't ask for encoding (because undecided-unix) every single keystroke
  (modify-coding-system-alist 'file "" 'utf-8)
 (setq default-directory "~/.emacs.d/my-org-files/")
 (setq command-line-default-directory "~/.emacs.d/my-org-files/")



;; rewrite
(setq gptel-rewrite-default-action 'accept) ;; or 'merge, 'diff, etc.

;; google translate
 ;; (global-set-key (kbd "C-c ñ") 'google-translate-region)

;; Openrouter gptel
(gptel-make-openai "OpenRouter"
  :host "openrouter.ai"
  :endpoint "/api/v1/chat/completions"
  :stream t
  :key "your api key"
  :models '(deepseek/deepseek-chat-v3-0324:free
            deepseek/deepseek-r1:free
            meta-llama/llama-4-maverick:free
            meta-llama/llama-4-scout:free
            meta-llama/llama-3.3-70b-instruct:free
            meta-llama/llama-3.2-11b-vision-instruct:free
            microsoft/mai-ds-r1:free
            qwen/qwen3-30b-a3b:free
            nvidia/llama-3.1-nemotron-ultra-253b-v1:free
            google/gemini-2.5-pro-preview-03-25
            google/gemini-2.5-flash-preview
            google/gemini-2.0-flash-exp:free))

;; disable fringe mode
(fringe-mode -1)



;; borrar hast setface
  (defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


  ;; (set-face-attribute 'default nil :family "RobotoMono Nerd Font" :height 105)
  (set-face-attribute 'default nil :family "RobotoMono Nerd Font" :height 200 :weight 'regular)

  (when (eq system-type 'darwin)
    (setq insert-directory-program "gls")
    (setq mac-command-modifier 'meta)
    (set-face-attribute 'default nil :family "RobotoMono Nerd Font" :height 220))

  ;; Save manual customizations to other file than init.el
  (setq custom-file (locate-user-emacs-file "custom-vars.el"))
  (load custom-file 'noerror 'nomessage)

;; Task Manager Configuration
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp/task-manager"))
(require 'task-manager2)
(add-hook 'emacs-startup-hook 'task-manager2-init)
(global-set-key (kbd "C-c t") 'task-manager2-init)

;; buscar imágenes
(defun buscar-imagenes (palabra)
  "Buscar imágenes de PALABRA en Google e iniciar el navegador."
  (interactive "sBuscar imágenes de: ")
  (browse-url (concat "https://www.google.com/search?tbm=isch&q=" (url-hexify-string palabra))))

;; visual line mode
;; Enable Visual Line mode globally
(global-visual-line-mode 1)

;; Optional: make it look better
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(setq-default word-wrap t)
(setq-default truncate-lines nil)

  ;; Set line-number-mode with relative numbering
;;  (setq display-line-numbers-type 'relative)
;;  (add-hook 'prog-mode-hook #'display-line-numbers-mode)
  ;; Enable global line numbers

;; Enable Global Tab Line mode at startup - add this near the top of init.el
(global-tab-line-mode 1)  ; Use 1 instead of t to ensure it's enabled
(setq global-tab-line-mode t)  ; Make sure it stays enabled



;; Add this to your existing use-package emacs block, in the :init section
(use-package emacs
  :init
  (global-tab-line-mode 1)
  ;; ... rest of your init configuration ...
  )


  ;; A Protesilaos life savier HACK
  ;; Add option "d" to whenever using C-x s or C-x C-c, allowing a quick preview
  ;; of the diff (if you choose `d') of what you're asked to save.
  (add-to-list 'save-some-buffers-action-alist
               (list "d"
                     (lambda (buffer) (diff-buffer-with-file (buffer-file-name buffer)))
                     "show diff between the buffer and its file"))

  ;; On Terminal: changes the vertical separator to a full vertical line
  ;;              and truncation symbol to a right arrow
  (set-display-table-slot standard-display-table 'vertical-border ?\u2502)
  (set-display-table-slot standard-display-table 'truncation ?\u2192)

  ;; Ibuffer filters
  (setq ibuffer-saved-filter-groups
        '(("default"
           ("org" (or
                   (mode . org-mode)
                   (name . "^\\*Org Src")
                   (name . "^\\*Org Agenda\\*$")))
           ("tramp" (name . "^\\*tramp.*"))
           ("emacs" (or
                     (name . "^\\*scratch\\*$")
                     (name . "^\\*Messages\\*$")
                     (name . "^\\*Warnings\\*$")
                     (name . "^\\*Shell Command Output\\*$")
                     (name . "^\\*Async-native-compile-log\\*$")
                     (name . "^\\*straight-")))
           ("ediff" (or
                     (name . "^\\*ediff.*")
                     (name . "^\\*Ediff.*")))
           ("dired" (mode . dired-mode))
           ("terminal" (or
                        (mode . term-mode)
                        (mode . shell-mode)
                        (mode . eshell-mode)))
           ("help" (or
                    (name . "^\\*Help\\*$")
                    (name . "^\\*info\\*$")
                    (name . "^\\*helpful"))))))
  (add-hook 'ibuffer-mode-hook
            (lambda ()
              (ibuffer-switch-to-saved-filter-groups "default")))
  (setq ibuffer-show-empty-filter-groups nil) ; don't show empty groups


  ;; So eshell git commands open an instance of THIS config of Emacs
  (setenv "GIT_EDITOR" (format "emacs --init-dir=%s " (shell-quote-argument user-emacs-directory)))
  ;; So rebase from eshell opens with a bit of syntax highlight
  (add-to-list 'auto-mode-alist '("/git-rebase-todo\\'" . conf-mode))


  ;; Runs 'private.el' after Emacs inits
  (add-hook 'after-init-hook
            (lambda ()
              (let ((private-file (expand-file-name "private.el" user-emacs-directory)))
                (when (file-exists-p private-file)
                  (load private-file)))))

  :init
  (set-window-margins (selected-window) 2 0)

  (toggle-frame-maximized)
  (select-frame-set-input-focus (selected-frame))
  (global-auto-revert-mode 1)
  (indent-tabs-mode -1)
  (recentf-mode 1)
  (repeat-mode 1)
  (savehist-mode 1)
  (save-place-mode 1)
  (winner-mode)
  (xterm-mouse-mode 1)
  (file-name-shadow-mode 1) ; allows us to type a new path without having to delete the current one

  (with-current-buffer (get-buffer-create "*scratch*")
    (insert (format ";;
;;   Loading time : %s
;;   Packages     : %s
"
                    (emacs-init-time)
                    (number-to-string (length package-activated-list)))))

  (message (emacs-init-time)))


;;; AUTH-SOURCE
;; (use-package auth-source
;;   :ensure nil
;;   :defer t
;;   :config
;;   (setq auth-sources
;;         (list (expand-file-name ".authinfo.gpg" user-emacs-directory)))
;;   (setq user-full-name "Rahul Martim Juliato"
;;         user-mail-address "rahul.juliato@gmail.com")

;;   ;; Use `pass` as an auth-source
;;   (when (file-exists-p "~/.password-store")
;;     (auth-source-pass-enable)))


;;; CONF
(use-package conf-mode
  :ensure nil
  :mode ("\\.env\\..*\\'" "\\.env\\'")
  :init
  (add-to-list 'auto-mode-alist '("\\.env\\'" . conf-mode)))



;;; WINDOW
(use-package window
  :ensure nil
  :custom
  (display-buffer-alist
   '(
     ("\\*container\\*"
      (display-buffer-in-side-window)
      (window-width . 120)
      (side . left)
      (slot . -1))
     ("\\*\\(Backtrace\\|Warnings\\|Compile-Log\\|Messages\\|Bookmark List\\|Occur\\|eldoc\\)\\*"
      (display-buffer-in-side-window)
      (window-height . 0.25)
      (side . bottom)
      (slot . 0))
     ("\\*\\([Hh]elp\\)\\*"
      (display-buffer-in-side-window)
      (window-width . 75)
      (side . right)
      (slot . 0))
     ("\\*\\(Ibuffer\\)\\*"
      (display-buffer-in-side-window)
      (window-width . 100)
      (side . right)
      (slot . 1))
     ("\\*\\(Flymake diagnostics\\|xref\\|Completions\\)"
      (display-buffer-in-side-window)
      (window-height . 0.25)
      (side . bottom)
      (slot . 1))
     ("\\*\\(grep\\|find\\)\\*"
      (display-buffer-in-side-window)
      (window-height . 0.25)
      (side . bottom)
      (slot . 2))
     )))



;;; ICOMPLETE
(use-package icomplete
  :bind (:map icomplete-minibuffer-map
              ("C-n" . icomplete-forward-completions)
              ("C-p" . icomplete-backward-completions)
              ("C-v" . icomplete-vertical-toggle)
              ("RET" . icomplete-force-complete-and-exit)
              ("C-j" . exit-minibuffer)) ;; So we can exit commands like `multi-file-replace-regexp-as-diff'
  :hook
  (after-init . (lambda ()
                  (fido-mode -1)
                  (icomplete-vertical-mode 1)))
  :config
  (setq icomplete-delay-completions-threshold 0)
  (setq icomplete-compute-delay 0)
  (setq icomplete-show-matches-on-no-input t)
  (setq icomplete-hide-common-prefix nil)
  (setq icomplete-prospects-height 10)
  (setq icomplete-separator " . ")
  (setq icomplete-with-completion-tables t)
  (setq icomplete-in-buffer t)
  (setq icomplete-max-delay-chars 0)
  (setq icomplete-scroll t)

  ;; EMACS-31
  (when (and (>= emacs-major-version 31)
             (boundp 'icomplete-vertical-in-buffer-adjust-list))

             (setq icomplete-vertical-in-buffer-adjust-list t)
             (setq icomplete-vertical-render-prefix-indicator t)
             ;; (setq icomplete-vertical-selected-prefix-indicator   " @ ")
             ;; (setq icomplete-vertical-unselected-prefix-indicator "   ")
             )

  (if icomplete-in-buffer
      (advice-add 'completion-at-point
                  :after #'minibuffer-hide-completions))

  ;; https://lists.gnu.org/archive/html/bug-gnu-emacs/2025-03/msg02638.html
  ;;
  ;; I'm currently proposing these features on bug#75784 (bug-gnu-emacs).
  ;; If they get accepted we can get rid of this giant block.
  ;;
  ;; === FIXME: I'm reviewing it to the icomplete PATCH

  ;; EMACS-31
  (when (or (< emacs-major-version 31)
            (not (boundp 'icomplete-vertical-in-buffer-adjust-list)))

    (defface icomplete-vertical-selected-prefix-indicator-face
      '((t :inherit font-lock-keyword-face :weight bold :foreground "cyan"))
      "Face used for the prefix set by `icomplete-vertical-selected-prefix-indicator'."
      :group 'icomplete
      :version "31.1")

    (defface icomplete-vertical-unselected-prefix-indicator-face
      '((t :inherit font-lock-keyword-face :weight normal :foreground "gray"))
      "Face used for the prefix set by `icomplete-vertical-unselected-prefix-indicator'."
      :group 'icomplete
      :version "31.1")

    (defcustom icomplete-vertical-in-buffer-adjust-list t
      "Control whether in-buffer completion should align the cursor position.
If this is t and `icomplete-in-buffer' is t, and `icomplete-vertical-mode'
is activated, the in-buffer vertical completions are shown aligned to the
cursor position when the completion started, not on the first column, as
the default behaviour."
      :type 'boolean
      :group 'icomplete
      :version "31.1")

    (defcustom icomplete-vertical-render-prefix-indicator t
      "Control whether a indicator is added as a prefix to each candidate.
If this is t and `icomplete-vertical-mode' is activated, a indicator,
controlled by `icomplete-vertical-selected-prefix-indicator' is shown
as a prefix to the current under selection candidate, while the
remaining of the candidates will receive the indicator controlled
by `icomplete-vertical-unselected-prefix-indicator'."
      :type 'boolean
      :group 'icomplete
      :version "31.1")

    (defcustom icomplete-vertical-selected-prefix-indicator "» "
      "Prefix string used to mark the selected completion candidate.
If `icomplete-vertical-render-prefix-indicator' is t, the string
defined here is used as a prefix of the currently selected entry in the
list.  It can be further customized by the face
`icomplete-vertical-selected-prefix-indicator-face'."
      :type 'string
      :group 'icomplete
      :version "31.1")

    (defcustom icomplete-vertical-unselected-prefix-indicator "  "
      "Prefix string used on the unselected completion candidates.
If `icomplete-vertical-render-prefix-indicator' is t, the string
defined here is used as a prefix for all unselected entries in the list.
list.  It can be further customized by the face
`icomplete-vertical-unselected-prefix-indicator-face'."
      :type 'string
      :group 'icomplete
      :version "31.1")

    ;; FIXME: make this into PATCH - OK
    (defun icomplete-vertical--adjust-lines-for-column (lines buffer data)
      "Adjust the LINES to align with the column in BUFFER based on DATA."
      (if icomplete-vertical-in-buffer-adjust-list
          (let* ((column (current-column))
                 (prefix-indicator-width
                  (if icomplete-vertical-render-prefix-indicator
                      (max (length icomplete-vertical-selected-prefix-indicator)
                           (length icomplete-vertical-unselected-prefix-indicator))
                    0))
                 (wrapped-line (with-current-buffer buffer
                                 (save-excursion
                                   (goto-char (car data))
                                   (beginning-of-line)
                                   (count-screen-lines (point) (car data)))))
                 (window-width (+ (window-hscroll) (window-body-width)))
                 (longest-line-width (apply #'max (mapcar #'length lines)))
                 (spaces-to-add
                  (if (> wrapped-line 1)
                      (- column (* (- wrapped-line 1) (- window-width 5)))
                    column))
                 (spaces-to-add-avoiding-scrolling
                  (if (>= (+ spaces-to-add longest-line-width prefix-indicator-width) window-width)
                      (- spaces-to-add longest-line-width)
                    spaces-to-add)))

            (mapcar (lambda (line)
                      (concat (make-string spaces-to-add-avoiding-scrolling ?\s) line))
                    lines))
        lines))

    ;; FIXME: what to demo/test:
    ;;
    ;; This patch provides two more new features, which improves icomplete-vertical-mode, 1 and 2,
    ;; explained below:
    ;;
    ;;
    ;; 1.) Improve feature provided by `icomplete-in-buffer'.
    ;;     If user, besides setting `icomplete-in-buffer' to t, also set the
    ;;     new `icomplete-vertical-in-buffer-adjust-list' to t, the following are fixed/ improved:
    ;;
    ;; Without the new `icomplete-vertical-in-buffer-adjust-list':
    ;; - [ ] wrapped lines   - completion candidates on different columns always shows candidates at column 0
    ;; - [ ] wrapped lines   - completion candidates on different lines always shows candidates at column 0
    ;; - [ ] wrapped lines   - completion candidates close to the end of buffer won't be printed
    ;; - [ ] truncated lines - completion candidates on different columns always shows candidates at column 0
    ;; - [ ] truncated lines - completion candidates on horizontally scrolled windows won't appear on buffer
    ;;                         as they're on column 0
    ;; - [ ] truncated lines - completion candidates close to the end of buffer wont be shown
    ;;
    ;;
    ;; With the new `icomplete-vertical-in-buffer-adjust-list':
    ;; - [ ] wrapped lines   - fix    : completion candidates on different columns will always be printed
    ;;                                  under the cursor
    ;; - [ ] wrapped lines   - feature: completion candidates on different columns close to the end
    ;;                                  of the buffer will adjust so they stay visible
    ;; - [ ] wrapped lines   - fix:   : completion candidates on different lines always be printed under
    ;;                                  the cursor
    ;; - [ ] wrapped lines   - fix    : if icomplete-prospects-height won't fit from current line to the
    ;;                                  end of vertical space, our window will be scrolled so we have at
    ;;                                  least this amount of lines. This ensures our candidates list is
    ;;                                  always visible
    ;; - [ ] truncated lines - fix    : completion candidates on different columns will always be printed
    ;;                                  under the cursor
    ;; - [ ] truncated lines - feature: completion candidates on different columns close to the end
    ;;                                  of the buffer will adjust so they stay visible even when we scroll
    ;;                                  horizontally
    ;; - [ ] truncated lines - feature: completion candidates on horizontally scrolled windows will be
    ;;                                  printed under the cursor
    ;; - [ ] wrapped lines   - feature: if icomplete-prospects-height won't fit from current line to the
    ;;                                  end of vertical space, our window will be scrolled so we have at
    ;;                                  least this amount of lines. This ensures our candidates list is
    ;;                                  always visible
    ;; - [ ] from wrapped    - feature: if we are on wrapped lines and manually horiontal scroll, the lines
    ;;       to truncated               will become automatically truncated, in this case, all the features
    ;;                                  above still works from either mode (wrapped or truncated).
    ;;
    ;;
    ;; 2.) Implements new feature which provides customizable prefix indicators
    ;;
    ;; Setting `icomplete-vertical-render-prefix-indicator' to t will provide a prefix indicator
    ;; to indicate the current selected candidate, by default "» ".
    ;;
    ;; This prefix is customizable through the variable `icomplete-vertical-selected-prefix-indicator'
    ;; and de face `icomplete-vertical-selected-prefix-indicator-face'.
    ;;
    ;; Users can also customize an indicator to the not selected candidates trhough the use of
    ;; the variable `icomplete-vertical-unselected-prefix-indicator', by default: "  ", and the face
    ;; `icomplete-vertical-unselected-prefix-indicator-face'.
    ;;

    ;; set margins buffer
(setq left-margin-width 3
      right-margin-width 3)
(set-window-buffer (selected-window) (current-buffer))


    ;; FIXME: remove this after patch
    (defun icomplete-vertical--ensure-visible-lines-inside-buffer ()
      "Ensure the completion list is visible in regular buffers only.
Scrolls the screen to be at least `icomplete-prospects-height' real lines
away from the bottom.  Counts wrapped lines as real lines."
      (unless (minibufferp)
        (let* ((window-height (window-body-height))
               (current-line (count-screen-lines (window-start) (point)))
               (lines-to-bottom (- window-height current-line)))
          (when (< lines-to-bottom icomplete-prospects-height)
            (scroll-up (- icomplete-prospects-height lines-to-bottom))))))


    (defun icomplete-vertical--add-indicator-to-selected (comp)
      "Add indicators to the selected/unselected COMP completions."
      (if (and icomplete-vertical-render-prefix-indicator
               (get-text-property 0 'icomplete-selected comp))
          (concat (propertize icomplete-vertical-selected-prefix-indicator
                              'face 'icomplete-vertical-selected-prefix-indicator-face)
                  comp)
        (concat (propertize icomplete-vertical-unselected-prefix-indicator
                            'face 'icomplete-vertical-unselected-prefix-indicator-face)
                comp)))


    (cl-defun icomplete--render-vertical
        (comps md &aux scroll-above scroll-below
               (total-space ; number of mini-window lines available
                (1- (min
                     icomplete-prospects-height
                     (truncate (max-mini-window-lines) 1)))))
      ;; Welcome to loopapalooza!
      ;;
      ;; First, be mindful of `icomplete-scroll' and manual scrolls.  If
      ;; `icomplete--scrolled-completions' and `icomplete--scrolled-past'
      ;; are:
      ;;
      ;; - both nil, there is no manual scroll;
      ;; - both non-nil, there is a healthy manual scroll that doesn't need
      ;;   to be readjusted (user just moved around the minibuffer, for
      ;;   example);
      ;; - non-nil and nil, respectively, a refiltering took place and we
      ;;   may need to readjust them to the new filtered `comps'.
      (when (and icomplete-scroll                                    ;; FIXME: remove this after patch
                 (not icomplete--scrolled-completions)
                 (not icomplete--scrolled-past))
        (icomplete-vertical--ensure-visible-lines-inside-buffer))
      (when (and icomplete-scroll
                 icomplete--scrolled-completions
                 (null icomplete--scrolled-past))
        (icomplete-vertical--ensure-visible-lines-inside-buffer)     ;; FIXME: remove this after patch
        (cl-loop with preds
                 for (comp . rest) on comps
                 when (equal comp (car icomplete--scrolled-completions))
                 do
                 (setq icomplete--scrolled-past preds
                       comps (cons comp rest))
                 (completion--cache-all-sorted-completions
                  (icomplete--field-beg)
                  (icomplete--field-end)
                  comps)
                 and return nil
                 do (push comp preds)
                 finally (setq icomplete--scrolled-completions nil)))
      ;; Then, in this pretty ugly loop, collect completions to display
      ;; above and below the selected one, considering scrolling
      ;; positions.
      (cl-loop with preds = icomplete--scrolled-past
               with succs = (cdr comps)
               with space-above = (- total-space
                                     1
                                     (cl-loop for (_ . r) on comps
                                              repeat (truncate total-space 2)
                                              while (listp r)
                                              count 1))
               repeat total-space
               for neighbor = nil
               if (and preds (> space-above 0)) do
               (push (setq neighbor (pop preds)) scroll-above)
               (cl-decf space-above)
               else if (consp succs) collect
               (setq neighbor (pop succs)) into scroll-below-aux
               while neighbor
               finally (setq scroll-below scroll-below-aux))
      ;; Halfway there...
      (let* ((selected (propertize (car comps) 'icomplete-selected t))
             (chosen (append scroll-above (list selected) scroll-below))
             (tuples (icomplete--augment md chosen))
             max-prefix-len max-comp-len lines nsections)
        (add-face-text-property 0 (length selected)
                                'icomplete-selected-match 'append selected)
        ;; Figure out parameters for horizontal spacing
        (cl-loop
         for (comp prefix) in tuples
         maximizing (length prefix) into max-prefix-len-aux
         maximizing (length comp) into max-comp-len-aux
         finally (setq max-prefix-len max-prefix-len-aux
                       max-comp-len max-comp-len-aux))
        ;; Serialize completions and section titles into a list
        ;; of lines to render
        (cl-loop
         for (comp prefix suffix section) in tuples
         when section
         collect (propertize section 'face 'icomplete-section) into lines-aux
         and count 1 into nsections-aux
         for comp = (icomplete-vertical--add-indicator-to-selected comp)
         when (get-text-property 0 'icomplete-selected comp)
         do (add-face-text-property 0 (length comp)
                                    'icomplete-selected-match 'append comp)
         collect (concat prefix
                         (make-string (max 0 (- max-prefix-len (length prefix))) ? )
                         (completion-lazy-hilit comp)
                         (make-string (max 0 (- max-comp-len (length comp))) ? )
                         suffix)
         into lines-aux
         finally (setq lines lines-aux
                       nsections nsections-aux))
        ;; Kick out some lines from the beginning due to extra sections.
        ;; This hopes to keep the selected entry more or less in the
        ;; middle of the dropdown-like widget when `icomplete-scroll' is
        ;; t.  Funky, but at least I didn't use `cl-loop'
        (setq lines
              (nthcdr
               (cond ((<= (length lines) total-space) 0)
                     ((> (length scroll-above) (length scroll-below)) nsections)
                     (t (min (ceiling nsections 2) (length scroll-above))))
               lines))
        (when icomplete--in-region-buffer
          (setq lines (icomplete-vertical--adjust-lines-for-column
                       lines icomplete--in-region-buffer completion-in-region--data)))
        ;; At long last, render final string return value.  This may still
        ;; kick out lines at the end.
        (concat " \n"
                (cl-loop for l in lines repeat total-space concat l concat "\n")))))

;; end use-package
)
;; api key for folder app
;;(setq folder-index-llm-openai-key "kk-m3qFJtos6WMEG-6NwRM-ga80Q2E53EM1798AS8ZHR6Q")

;;; DIRED
(use-package dired
  :ensure nil
  :bind
  (("M-i" . emacs-solo/window-dired-vc-root-left))
  :custom
  (dired-dwim-target t)
  (dired-guess-shell-alist-user
   '(("\\.\\(png\\|jpe?g\\|tiff\\)" "feh" "xdg-open" "open")
     ("\\.\\(mp[34]\\|m4a\\|ogg\\|flac\\|webm\\|mkv\\)" "mpv" "xdg-open" "open")
     (".*" "xdg-open" "open")))
  (dired-kill-when-opening-new-dired-buffer t)
  (dired-listing-switches "-al --group-directories-first")
  (dired-omit-files "^\\.")                                ; with dired-omit-mode (C-x M-o)
  (dired-hide-details-hide-absolute-location t)            ; EMACS-31
  :init
  (add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1))) ;; Turning this ON also sets the C-x M-o binding.

  (defun emacs-solo/dired-rsync-copy (dest)
  "Copy marked files in Dired to DEST using rsync async, with real-time processing of output."
  (interactive
   (list (expand-file-name (read-file-name "rsync to: "
                                           (dired-dwim-target-directory)))))
  (let* ((files (dired-get-marked-files nil current-prefix-arg))
         (command (append '("rsync" "-hPur") (mapcar #'shell-quote-argument files) (list (shell-quote-argument dest))))
         (buffer (get-buffer-create "*rsync*")))
    (with-current-buffer buffer
      (erase-buffer)
      (insert "Running rsync...\n"))

    (defun rsync-process-filter (proc string)
      (with-current-buffer (process-buffer proc)
        (goto-char (point-max))
        (insert string)
        (goto-char (point-max))
        (while (re-search-backward "\r" nil t)
          (replace-match "\n" nil nil))))

    (make-process
     :name "dired-rsync"
     :buffer buffer
     :command command
     :filter 'rsync-process-filter
     :sentinel
     (lambda (_proc event)
       (when (string-match-p "finished" event)
         (with-current-buffer buffer
           (goto-char (point-max))
           (insert "\n* rsync done *\n"))
         (dired-revert)))
     :stderr buffer)

    (display-buffer buffer)
    (message "rsync started...")))


  (defun emacs-solo/window-dired-vc-root-left (&optional directory-path)
    "Creates *Dired-Side* like an IDE side explorer"
    (interactive)
    (add-hook 'dired-mode-hook 'dired-hide-details-mode)

    (let ((dir (if directory-path
                   (dired-noselect directory-path)
         (if (eq (vc-root-dir) nil)
                     (dired-noselect default-directory)
                   (dired-noselect (vc-root-dir))))))

      (display-buffer-in-side-window
       dir `((side . left)
         (slot . 0)
         (window-width . 30)
         (window-parameters . ((no-other-window . t)
                   (no-delete-other-windows . t)
                   (mode-line-format . (" "
                            "%b"))))))
      (with-current-buffer dir
    (let ((window (get-buffer-window dir)))
          (when window
            (select-window window)
        (rename-buffer "*Dired-Side*")
        )))))

  (defun emacs-solo/window-dired-open-directory ()
    "Open the current directory in *Dired-Side* side window."
    (interactive)
    (emacs-solo/window-dired-vc-root-left (dired-get-file-for-visit)))

  (eval-after-load 'dired
  '(progn
     (define-key dired-mode-map (kbd "C-<return>") 'emacs-solo/window-dired-open-directory))))


;;; WDIRED
(use-package wdired
  :ensure nil
  :commands (wdired-change-to-wdired-mode)
  :config
  (setq wdired-allow-to-change-permissions t)
  (setq wdired-create-parent-directories t))


;;; ISEARCH
(use-package isearch
  :ensure nil
  :config
  (setq isearch-lazy-count t)
  (setq lazy-count-prefix-format "(%s/%s) ")
  (setq lazy-count-suffix-format nil)
  (setq search-whitespace-regexp ".*?")

  (defun isearch-copy-selected-word ()
    "Copy the current `isearch` selection to the kill ring."
    (interactive)
    (when isearch-other-end
      (let ((selection (buffer-substring-no-properties isearch-other-end (point))))
        (kill-new selection)
        (isearch-exit))))

  ;; Bind `M-w` in isearch to copy the selected word, so M-s M-. M-w
  ;; does a great job of 'copying the current word under cursor'.
  (define-key isearch-mode-map (kbd "M-w") 'isearch-copy-selected-word))


;;; VC
(use-package vc
  :ensure nil
  :defer t
  :config
  (setopt
   vc-git-diff-switches '("--patch-with-stat" "--histogram")  ;; add stats to `git diff'
   vc-git-log-switches '("--stat")                            ;; add stats to `git log'
   vc-git-log-edit-summary-target-len 50
   vc-git-log-edit-summary-max-len 70
   vc-git-print-log-follow t
   vc-git-revision-complete-only-branches nil
   vc-annotate-display-mode 'scale
   add-log-keep-changes-together t
   vc-make-backup-files nil)                                  ;; Do not backup version controlled files

  (with-eval-after-load 'vc-annotate
    (setopt vc-annotate-color-map
          '((20 . "#c3e88d")
            (40 . "#89DDFF")
            (60 . "#82aaff")
            (80 . "#676E95")
            (100 . "#c792ea")
            (120 . "#f78c6c")
            (140 . "#79a8ff")
            (160 . "#f5e0dc")
            (180 . "#a6e3a1")
            (200 . "#94e2d5")
            (220 . "#89dceb")
            (240 . "#74c7ec")
            (260 . "#82aaff")
            (280 . "#b4befe")
            (300 . "#b5b0ff")
            (320 . "#8c9eff")
            (340 . "#6a81ff")
            (360 . "#5c6bd7"))))

  ;; This one is for editing commit messages
  (require 'log-edit)
  (setopt log-edit-confirm 'changed
          log-edit-keep-buffer nil
          log-edit-require-final-newline t
          log-edit-setup-add-author nil)

  ;; Removes the bottom window with modified files list
  (remove-hook 'log-edit-hook #'log-edit-show-files)

  (with-eval-after-load 'vc-dir
    ;; In vc-git and vc-dir for git buffers, make (C-x v) a run git add, u run git
    ;; reset, and r run git reset and checkout from head.
    (defun emacs-solo/vc-git-command (verb fn)
      "Execute a Git command with VERB as action description and FN as operation on files."
      (let* ((fileset (vc-deduce-fileset t)) ;; Deduce fileset
             (backend (car fileset))
             (files (nth 1 fileset)))
        (if (eq backend 'Git)
            (progn
              (funcall fn files)
              (message "%s %d file(s)." verb (length files)))
          (message "Not in a VC Git buffer."))))

    (defun emacs-solo/vc-git-add (&optional revision vc-fileset comment)
      (interactive "P")
      (emacs-solo/vc-git-command "Staged" 'vc-git-register))

    (defun emacs-solo/vc-git-reset (&optional revision vc-fileset comment)
      (interactive "P")
      (emacs-solo/vc-git-command "Unstaged"
                                 (lambda (files) (vc-git-command nil 0 files "reset" "-q" "--"))))


    ;; Bind S and U in vc-dir-mode-map
    (define-key vc-dir-mode-map (kbd "S") #'emacs-solo/vc-git-add)
    (define-key vc-dir-mode-map (kbd "U") #'emacs-solo/vc-git-reset)

    ;; Bind S and U in vc-prefix-map for general VC usage
    (define-key vc-prefix-map (kbd "S") #'emacs-solo/vc-git-add)
    (define-key vc-prefix-map (kbd "U") #'emacs-solo/vc-git-reset)

    ;; Bind g to hide up to date files after refreshing in vc-dir
    (define-key vc-dir-mode-map (kbd "g")
                (lambda () (interactive) (vc-dir-refresh) (vc-dir-hide-up-to-date)))


    (defun emacs-solo/vc-git-visualize-status ()
      "Show the Git status of files in the `vc-log` buffer."
      (interactive)
      (let* ((fileset (vc-deduce-fileset t))
             (backend (car fileset))
             (files (nth 1 fileset)))
        (if (eq backend 'Git)
            (let ((output-buffer "*Git Status*"))
              (with-current-buffer (get-buffer-create output-buffer)
                (read-only-mode -1)
                (erase-buffer)
                ;; Capture the raw output including colors using 'git status --color=auto'
                (call-process "git" nil output-buffer nil "status" "-v")
                (pop-to-buffer output-buffer)))
          (message "Not in a VC Git buffer."))))

    (define-key vc-dir-mode-map (kbd "V") #'emacs-solo/vc-git-visualize-status)
    (define-key vc-prefix-map (kbd "V") #'emacs-solo/vc-git-visualize-status))

  (defun emacs-solo/vc-git-reflog ()
    "Show git reflog in a new buffer with ANSI colors and custom keybindings."
    (interactive)
    (let* ((root (vc-root-dir)) ;; Capture VC root before creating buffer
           (buffer (get-buffer-create "*vc-git-reflog*")))
      (with-current-buffer buffer
        (setq-local vc-git-reflog-root root) ;; Store VC root as a buffer-local variable
        (let ((inhibit-read-only t))
          (erase-buffer)
          (vc-git-command buffer nil nil
                          "reflog"
                          "--color=always"
                          "--pretty=format:%C(yellow)%h%Creset %C(auto)%d%Creset %Cgreen%gd%Creset %s %Cblue(%cr)%Creset")
          (goto-char (point-min))
          (ansi-color-apply-on-region (point-min) (point-max)))

        (let ((map (make-sparse-keymap)))
          (define-key map (kbd "/") #'isearch-forward)
          (define-key map (kbd "p") #'previous-line)
          (define-key map (kbd "n") #'next-line)
          (define-key map (kbd "q") #'kill-buffer-and-window)

          (use-local-map map))

        (setq buffer-read-only t)
        (setq mode-name "Git-Reflog")
        (setq major-mode 'special-mode))
      (pop-to-buffer buffer)))
  (global-set-key (kbd "C-x v R") 'emacs-solo/vc-git-reflog)


  (defun emacs-solo/vc-pull-merge-current-branch ()
  "Pull the latest change from origin for the current branch and display output in a buffer."
  (interactive)
  (let* ((branch (vc-git--symbolic-ref "HEAD"))
         (buffer (get-buffer-create "*Git Pull Output*"))
         (command (format "git pull origin %s" branch)))
    (if branch
        (progn
          (with-current-buffer buffer
            (erase-buffer)
            (insert (format "$ %s\n\n" command))
            (call-process-shell-command command nil buffer t))
          (display-buffer buffer))
      (message "Could not determine current branch."))))


  (defun emacs-solo/vc-browse-remote (&optional current-line)
  "Open the repository's remote URL in the browser.
If CURRENT-LINE is non-nil, point to the current branch, file, and line.
Otherwise, open the repository's main page."
  (interactive "P")
  (let* ((remote-url (string-trim (vc-git--run-command-string nil "config" "--get" "remote.origin.url")))
         (branch (string-trim (vc-git--run-command-string nil "rev-parse" "--abbrev-ref" "HEAD")))
         (file (string-trim (file-relative-name (buffer-file-name) (vc-root-dir))))
         (line (line-number-at-pos)))
    (message "Opening remote on browser: %s" remote-url)
    (if (and remote-url (string-match "\\(?:git@\\|https://\\)\\([^:/]+\\)[:/]\\(.+?\\)\\(?:\\.git\\)?$" remote-url))
        (let ((host (match-string 1 remote-url))
              (path (match-string 2 remote-url)))
          ;; Convert SSH URLs to HTTPS (e.g., git@github.com:user/repo.git -> https://github.com/user/repo)
          (when (string-prefix-p "git@" host)
            (setq host (replace-regexp-in-string "^git@" "" host)))
          ;; Construct the appropriate URL based on CURRENT-LINE
          (browse-url
           (if current-line
               (format "https://%s/%s/blob/%s/%s#L%d" host path branch file line)
             (format "https://%s/%s" host path))))
      (message "Could not determine repository URL"))))
  (global-set-key (kbd "C-x v B") 'emacs-solo/vc-browse-remote)
  (global-set-key (kbd "C-x v o")
                  '(lambda () (interactive) (emacs-solo/vc-browse-remote 1)))


  (defun emacs-solo/vc-diff-on-current-hunk ()
    "Show the diff for the current file and jump to the hunk containing the current line."
    (interactive)
    (let ((current-line (line-number-at-pos)))
      (message "Current line in file: %d" current-line)
      (vc-diff) ; Generate the diff buffer
      (with-current-buffer "*vc-diff*"
        (goto-char (point-min))
        (let ((found-hunk nil))
          (while (and (not found-hunk)
                      (re-search-forward "^@@ -\\([0-9]+\\), *[0-9]+ \\+\\([0-9]+\\), *\\([0-9]+\\) @@" nil t))
            (let* ((start-line (string-to-number (match-string 2)))
                   (line-count (string-to-number (match-string 3)))
                   (end-line (+ start-line line-count)))
              (message "Found hunk: %d to %d" start-line end-line)
              (when (and (>= current-line start-line)
                         (<= current-line end-line))
                (message "Current line %d is within hunk range %d to %d" current-line start-line end-line)
                (setq found-hunk t)
                (goto-char (match-beginning 0))))) ; Jump to the beginning of the hunk
          (unless found-hunk
            (message "Current line %d is not within any hunk range." current-line)
            (goto-char (point-min)))))))
  (global-set-key (kbd "C-x v =") 'emacs-solo/vc-diff-on-current-hunk))

;; ;;; SMERGE
;; (use-package smerge-mode
;;   :ensure nil
;;   :bind (:map smerge-mode-map
;;               ("C-c ^ u" . smerge-keep-upper)
;;               ("C-c ^ l" . smerge-keep-lower)
;;               ("C-c ^ n" . smerge-next)
;;               ("C-c ^ p" . smerge-previous)))

;;; DIFF
(use-package diff-mode
  :ensure nil
  :defer t
  :config
  (setq diff-default-read-only t)
  (setq diff-advance-after-apply-hunk t)
  (setq diff-update-on-the-fly t)
  (setq diff-font-lock-syntax 'hunk-also)
  (setq diff-font-lock-prettify nil))

;;; EDIFF
(use-package ediff
  :ensure nil
  :commands (ediff-buffers ediff-files ediff-buffers3 ediff-files3)
  :init
  (setq ediff-split-window-function 'split-window-horizontally)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  :config
  (setq ediff-keep-variants nil)
  (setq ediff-make-buffers-readonly-at-startup nil)
  (setq ediff-merge-revisions-with-ancestor t)
  (setq ediff-show-clashes-only t))

;;; ELDOC
(use-package eldoc
  :ensure nil
  :init
  (global-eldoc-mode))



;;; WHITESPACE
(use-package whitespace
  :ensure nil
  :defer t
  :hook (before-save . whitespace-cleanup)
  ;; if we wanna remove this hook at any time, eval:
  ;; (remove-hook 'before-save-hook #'whitespace-cleanup)
  )


;;; GNUS
(use-package gnus
  :ensure nil
  :defer t
  :custom
  (gnus-init-file (concat user-emacs-directory ".gnus.el"))
  (gnus-startup-file (concat user-emacs-directory ".newsrc"))
  (gnus-init-file (concat user-emacs-directory ".newsrc.eld"))
  (gnus-activate-level 3)
  (gnus-message-archive-group nil)
  (gnus-check-new-newsgroups nil)
  (gnus-check-bogus-newsgroups nil)
  (gnus-show-threads nil)
  (gnus-use-cross-reference nil)
  (gnus-nov-is-evil nil)
  (gnus-group-line-format "%1M%5y  : %(%-50,50G%)\12")
  (gnus-logo-colors '("#2fdbde" "#c0c0c0"))
  (gnus-permanently-visible-groups ".*")
  (gnus-summary-insert-entire-threads t)
  (gnus-thread-sort-functions
   '(gnus-thread-sort-by-most-recent-number
     gnus-thread-sort-by-subject
     (not gnus-thread-sort-by-total-score)
     gnus-thread-sort-by-most-recent-date))
  (gnus-summary-line-format "%U%R%z: %[%d%] %4{ %-34,34n%} %3{  %}%(%1{%B%}%s%)\12")
  (gnus-user-date-format-alist '((t . "%d-%m-%Y %H:%M")))
  (gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references)
  (gnus-sum--tree-indent " ")
  (gnus-sum-thread-tree-indent " ")
  (gnus-sum-thread-tree-false-root "○ ")
  (gnus-sum-thread-tree-single-indent "◎ ")
  (gnus-sum-thread-tree-leaf-with-other "├► ")
  (gnus-sum-thread-tree-root "● ")
  (gnus-sum-thread-tree-single-leaf "╰► ")
  (gnus-sum-thread-tree-vertical "│)")
  (gnus-select-method '(nnnil nil))
  (gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
  (gnus-secondary-select-methods
   '((nntp "news.gwene.org"))))


;;; MAN
(use-package man
  :ensure nil
  :commands (man)
  :config
  (setq Man-notify-method 'pushy)) ; does not obey `display-buffer-alist'


;;; MINIBUFFER
(use-package minibuffer
  :ensure nil
  :custom
  (completion-styles '(partial-completion flex initials))
  (completion-ignore-case t)
  (completion-show-help t)
  (completions-max-height 20)
  (completions-format 'one-column)
  (enable-recursive-minibuffers t)
  (read-file-name-completion-ignore-case t)
  (read-buffer-completion-ignore-case t)
  :config
  ;; Keep the cursor out of the read-only portions of the.minibuffer
  (setq minibuffer-prompt-properties
        '(read-only t intangible t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Keep minibuffer lines unwrapped, long lines like on M-y will be truncated
  (add-hook 'minibuffer-setup-hook
          (lambda () (setq truncate-lines t)))

  ;; Properly handle C-g in minibuffer
  (defun my-minibuffer-keyboard-quit ()
    "Abort the current minibuffer operation and clear its content."
    (interactive)
    (abort-recursive-edit)
    (setq minibuffer-history-variable nil)
    (setq minibuffer-history-position 0))

  (define-key minibuffer-local-map (kbd "C-g") 'my-minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map (kbd "C-g") 'my-minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map (kbd "C-g") 'my-minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map (kbd "C-g") 'my-minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map (kbd "C-g") 'my-minibuffer-keyboard-quit)

  ;; Clear minibuffer history when switching to main buffer
  (defun my-clear-minibuffer-history ()
    "Clear minibuffer history when switching to main buffer."
    (when (minibufferp)
      (setq minibuffer-history-variable nil)
      (setq minibuffer-history-position 0)))

  (add-hook 'minibuffer-exit-hook 'my-clear-minibuffer-history)

  (minibuffer-depth-indicate-mode 1)
  (minibuffer-electric-default-mode 1))


;;; NEWSTICKER
(use-package newsticker
  :ensure nil
  :defer t
  :custom
  (newsticker-treeview-treewindow-width 40)
  :hook
  (newsticker-treeview-item-mode . (lambda ()
                                     (define-key newsticker-treeview-item-mode-map
                                                 (kbd "V")
                                                 'emacs-solo/newsticker-play-yt-video-from-buffer)))
  :init
  (defun emacs-solo/newsticker-play-yt-video-from-buffer ()
    "Plays with mpv async, the current buffer found '* videoId: '."
    (interactive)
    (save-excursion
      (goto-char (point-min))
      (when (re-search-forward "^\\* videoId: \\(\\w+\\)" nil t)
        (let ((video-id (match-string 1)))
          (start-process "mpv-video" nil "mpv" (format "https://www.youtube.com/watch?v=%s" video-id))
          (message "Playing with mpv: %s" video-id))))))


;;; ELEC_PAIR
(use-package elec-pair
  :ensure nil
  :defer
  :hook (after-init . electric-pair-mode))

;;; PAREN
(use-package paren
  :ensure nil
  :hook (after-init . show-paren-mode)
  :custom
  (show-paren-delay 0)
  (show-paren-style 'mixed)
  (show-paren-context-when-offscreen t)) ;; show matches within window splits

;;; PROCED
(use-package proced
  :ensure nil
  :defer t
  :custom
  (proced-enable-color-flag t)
  (proced-tree-flag t)
  (proced-auto-update-flag 'visible)
  (proced-auto-update-interval 1)
  (proced-descent t)
  (proced-filter 'user) ;; We can change interactively with `s'
  :config
  (add-hook 'proced-mode-hook
            (lambda ()
              (proced-toggle-auto-update 1))))

;;; ORG
(use-package org
  :ensure nil
  :defer t
  :mode ("\\.org\\'" . org-mode)
  :init
  (require 'calendar)
  :config
  (setq
   ;; Start collapsed for speed
   org-startup-folded t

   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t

   ;; Calendar settings
   org-read-date-prefer-future t
   org-read-date-popup t
   org-read-date-force-compatible-dates t
   org-read-date-display-live t
   org-read-date-show-calendar t
   org-read-date-with-time nil
   org-read-date-allow-time nil
   org-read-date-inactive nil

   ;; Agenda styling
   org-agenda-tags-column 0
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "◀── now ─────────────────────────────────────────────────")

  ;; Ellipsis styling
  (setq org-ellipsis " ▼ ")
  (set-face-attribute 'org-ellipsis nil :inherit 'default :box nil))
(setq org-use-speed-commands t)


;;; TIME
(use-package time
  :ensure nil
  ;; :hook (after-init . display-time-mode) ;; If we'd like to see it on the modeline
  :custom
  (world-clock-time-format "%A %d %B %r %Z")
  (display-time-day-and-date t)
  (display-time-default-load-average nil)
  (display-time-mail-string "")
  (zoneinfo-style-world-list                ; use `M-x worldclock RET' to see it
   '(("America/Los_Angeles" "Los Angeles")
     ("America/Vancouver" "Vancouver")
     ("Canada/Pacific" "Canada/Pacific")
     ("America/Chicago" "Chicago")
     ("America/Toronto" "Toronto")
     ("America/New_York" "New York")
     ("Canada/Atlantic" "Canada/Atlantic")
     ("Brazil/East" "Brasília")
     ("America/Sao_Paulo" "São Paulo")
     ("UTC" "UTC")
     ("Europe/Lisbon" "Lisbon")
     ("Europe/Brussels" "Brussels")
     ("Europe/Athens" "Athens")
     ("Asia/Riyadh" "Riyadh")
     ("Asia/Tehran" "Tehran")
     ("Asia/Tbilisi" "Tbilisi")
     ("Asia/Yekaterinburg" "Yekaterinburg")
     ("Asia/Kolkata" "Kolkata")
     ("Asia/Singapore" "Singapore")
     ("Asia/Shanghai" "Shanghai")
     ("Asia/Seoul" "Seoul")
     ("Asia/Tokyo" "Tokyo")
     ("Asia/Vladivostok" "Vladivostok")
     ("Australia/Brisbane" "Brisbane")
     ("Australia/Sydney" "Sydney")
     ("Pacific/Auckland" "Auckland"))))


;;; UNIQUIFY
(use-package uniquify
  :ensure nil
  :config
  (setq uniquify-buffer-name-style 'forward)
  (setq uniquify-strip-common-suffix t)
  (setq uniquify-after-kill-buffer-p t))

;;; WHICH-KEY
(use-package which-key
  :defer t
  :ensure nil
  :hook
  (after-init . which-key-mode)
  :config
  (setq which-key-separator "  ")
  (setq which-key-prefix-prefix "... ")
  (setq which-key-max-display-columns 3)
  (setq which-key-idle-delay 1.5)
  (setq which-key-idle-secondary-delay 0.25)
  (setq which-key-add-column-padding 1)
  (setq which-key-max-description-length 40))

;;; WEBJUMP
(use-package webjump
  :defer t
  :ensure nil
  :bind ("C-x /" . webjump)
  :custom
  (webjump-sites
   '(("DuckDuckGo" . [simple-query "www.duckduckgo.com" "www.duckduckgo.com/?q=" ""])
     ("Google" . [simple-query "www.google.com" "www.google.com/search?q=" ""])
     ("YouTube" . [simple-query "www.youtube.com/feed/subscriptions" "www.youtube.com/rnesults?search_query=" ""])
     ("ChatGPT" . [simple-query "https://chatgpt.com" "https://chatgpt.com/?q=" ""]))))

 ;;; THEMES
(use-package modus-themes
  :ensure nil
  :defer t
  :custom
  (modus-themes-italic-constructs t)
  (modus-themes-bold-constructs t)
  (modus-themes-mixed-fonts nil)
  (modus-themes-prompts '(bold intense))
  (modus-themes-common-palette-overrides
   `((bg-main "#272822")                     ; Monokai background
     (bg-active bg-main)
     (fg-main "#F8F8F2")                     ; Primary foreground
     (fg-active fg-main)
     (fg-mode-line-active "#F8F8F2")
     (bg-mode-line-active "#3E3D32")
     (fg-mode-line-inactive "#75715E")
     (bg-mode-line-inactive "#272822")
     (border-mode-line-active nil)
     (border-mode-line-inactive nil)
     (bg-tab-bar      "#3E3D32")
     (bg-tab-current  bg-main)
     (bg-tab-other    "#3E3D32")
     (fg-prompt "#66D9EF")                   ; Cyan prompt
     (bg-prompt unspecified)
     (bg-hover-secondary "#75715E")
     (bg-completion "#49483E")               ; Dark gray
     (fg-completion "#F8F8F2")
     (bg-region "#3E3D32")
     (fg-region "#F8F8F2")

     (fg-line-number-active fg-main)
     (fg-line-number-inactive "#75715E")
     (bg-line-number-active unspecified)
     (bg-line-number-inactive "#272822")
     (fringe "#272822")

     (fg-heading-0 "#F92672")                ; Pink headings
     (fg-heading-1 "#F92672")
     (fg-heading-2 "#A6E22E")                ; Green
     (fg-heading-3 "#E6DB74")                ; Yellow
     (fg-heading-4 "#66D9EF")                ; Cyan

     (fg-prose-verbatim "#A6E22E")           ; Green code
     (bg-prose-block-contents "#3E3D32")
     (fg-prose-block-delimiter "#75715E")
     (bg-prose-block-delimiter bg-prose-block-contents)

     (accent-1 "#AE81FF")                    ; Purple accent

     (keyword "#F92672")                     ; Pink keywords
     (builtin "#66D9EF")                     ; Cyan built-ins
     (comment "#75715E")                     ; Gray comments
     (string "#E6DB74")                      ; Yellow strings
     (fnname "#A6E22E")                      ; Green functions
     (type "#AE81FF")                        ; Purple types
     (variable "#F8F8F2")                    ; Default variables
     (docstring "#75715E")                   ; Gray docs
     (constant "#AE81FF")))                  ; Purple constants
  :config
  (modus-themes-with-colors
    (custom-set-faces
     `(tab-bar
       ((,c
         :background "#3E3D32"
         :foreground "#F8F8F2")))
     `(tab-bar-tab
       ((,c)))
     `(cursor ((t (:background "#fb2874"))))
     `(dired-directory ((t (:foreground "#FD971F"))))
     `(completions-first-difference ((t (:foreground "#FD971F"))))
     `(tab-bar-tab-inactive
       ((,c)))))

  :init
  (load-theme 'modus-vivendi-tinted t))

;; (modus-themes-with-colors
;;   (custom-set-faces
;;    `(cursor ((t (:background "#FF00FF"))))))


;;; -------------------- NON TREESITTER AREA
;;; SASS-MODE
(use-package scss-mode
  :mode "\\.sass\\'"
  :defer t)

;;; -------------------- TREESITTER AREA

;;; JS-TS-MODE
(use-package js-ts-mode
  :ensure js ;; I care about js-base-mode but it is locked behind the feature "js"
  :mode "\\.jsx?\\'"
  :defer 't
  :custom
  (js-indent-level 2)
  :config
  (add-to-list 'treesit-language-source-alist '(javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src"))
  (add-to-list 'treesit-language-source-alist '(jsdoc "https://github.com/tree-sitter/tree-sitter-jsdoc" "master" "src")))

;;; TYPESCRIPT-TS-MODE
(use-package typescript-ts-mode
  :mode "\\.ts\\'"
  :defer 't
  :custom
  (typescript-indent-level 2)
  :config
  (add-to-list 'treesit-language-source-alist '(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src"))
  (unbind-key "M-." typescript-ts-base-mode-map))

;;; TYPESCRIPT-TS-MODE
(use-package tsx-ts-mode
  :mode "\\.tsx\\'"
  :defer 't
  :custom
  (typescript-indent-level 2)
  :config
  (add-to-list 'treesit-language-source-alist '(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))
  (unbind-key "M-." typescript-ts-base-mode-map))


;;; RUST-TS-MODE
(use-package rust-ts-mode
  :ensure rust-ts-mode
  :mode "\\.rs\\'"
  :defer 't
  :custom
  (rust-indent-level 2)
  :config
  (add-to-list 'treesit-language-source-alist '(rust "https://github.com/tree-sitter/tree-sitter-rust" "master" "src")))

;;; TOML-TS-MODE
(use-package toml-ts-mode
  :ensure toml-ts-mode
  :mode "\\.toml\\'"
  :defer 't
  :config
  (add-to-list 'treesit-language-source-alist '(toml "https://github.com/ikatyang/tree-sitter-toml" "master" "src")))

;;; MARKDOWN-TS-MODE - EMACS-31
;;  As I first proposed here:
;;  https://lists.gnu.org/archive/html/emacs-devel/2025-02/msg00810.html
(use-package markdown-ts-mode
  :ensure nil
  :mode "\\.md\\'"
  :defer 't
  :config
  (add-to-list 'major-mode-remap-alist '(markdown-mode . markdown-ts-mode))
  (add-to-list 'treesit-language-source-alist '(markdown "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown/src"))
  (add-to-list 'treesit-language-source-alist '(markdown-inline "https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown-inline/src")))

;;; YAML-TS-MODE
(use-package yaml-ts-mode
  :ensure yaml-ts-mode
  :mode "\\.ya?ml\\'"
  :defer 't
  :config
  (add-to-list 'treesit-language-source-alist '(yaml "https://github.com/tree-sitter-grammars/tree-sitter-yaml" "master" "src")))

;;; DOCKERFILE-TS-MODE
(use-package dockerfile-ts-mode
  :ensure dockerfile-ts-mode
  :mode "\\Dockerfile.*\\'"
  :defer 't
  :config
  (add-to-list 'treesit-language-source-alist '(dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile" "main" "src")))


;;; ------------------- EMACS-SOLO CUSTOMS
;;; EMACS-SOLO-HOOKS
;;
(use-package emacs-solo-hooks
  :ensure nil
  :no-require t
  :defer t
  :init

  (defun emacs-solo/prefer-tabs ()
    "Disables indent-tabs-mode, and prefer spaces over tabs."
    (interactive)
    (indent-tabs-mode -1))

  (add-hook 'prog-mode-hook #'emacs-solo/prefer-tabs))


;;; EMACS-SOLO-MOVEMENTS
;;
;;  Functions to better move around text and Emacs
;;
(use-package emacs-solo-movements
  :ensure nil
  :no-require t
  :defer t
  :init
  (defun emacs-solo/rename-buffer-and-move-to-new-window ()
    "Promotes a side window buffer to a new regular window."
    (interactive)
    (let ((temp-name (make-temp-name "temp-buffer-")))
      (rename-buffer temp-name t)
      (delete-window)
      (split-window-right)
      (switch-to-buffer temp-name)))

  (global-set-key (kbd "C-x x x") 'emacs-solo/rename-buffer-and-move-to-new-window)


  (defun emacs-solo-movements/scroll-down-centralize ()
    (interactive)
    (scroll-up-command)
    (recenter))

  (defun emacs-solo-movements/scroll-up-centralize ()
    (interactive)
    (scroll-down-command)
    (unless (= (window-start) (point-min))
      (recenter))
    (when (= (window-start) (point-min))
      (let ((midpoint (/ (window-height) 2)))
        (goto-char (window-start))
        (forward-line midpoint)
        (recenter midpoint))))

  (global-set-key (kbd "C-v") #'emacs-solo-movements/scroll-down-centralize)
  (global-set-key (kbd "M-v") #'emacs-solo-movements/scroll-up-centralize)

  ;; C-g Prot special

  ;; (interactive)
  ;; (condg
  ;;  ((region-active-p)
  ;;   (keyboard-quit))
  ;;  ((derived-mode-p 'completion-list-mode)
  ;;   (delete-completion-window))
  ;;  ((> (minibuffer-depth) 0)
  ;;   (abort-recursive-edit))
  ;;  (t
  ;;   (keyboard-quit))))

;; (define-key global-map (kbd "C-g") #'prot/keyboard-quit-dwim)

  (defun emacs-solo-movements/format-current-file ()
    "Format the current file using biome if biome.json is present; otherwise, use prettier.
Also first tries the local node_modules/.bin and later the global bin."
    (interactive)
    (let* ((file (buffer-file-name))
           (project-root (locate-dominating-file file "node_modules"))
           (biome-config (and project-root (file-exists-p (expand-file-name "biome.json" project-root))))
           (local-biome (and project-root (expand-file-name "node_modules/.bin/biome" project-root)))
           (global-biome (executable-find "biome"))
           (local-prettier (and project-root (expand-file-name "node_modules/.bin/prettier" project-root)))
           (global-prettier (executable-find "prettier"))
           (formatter nil)
           (source nil)
           (command nil)
           (start-time (float-time))) ;; Capture the start time
      (cond
       ;; Use Biome if biome.json exists
       ((and biome-config local-biome (file-executable-p local-biome))
        (setq formatter local-biome)
        (setq source "biome (local)")
        (setq command (format "%s format --write %s" formatter (shell-quote-argument file))))
       ((and biome-config global-biome)
        (setq formatter global-biome)
        (setq source "biome (global)")
        (setq command (format "%s format --write %s" formatter (shell-quote-argument file))))

       ;; Fall back to Prettier if no biome.json
       ((and local-prettier (file-executable-p local-prettier))
        (setq formatter local-prettier)
        (setq source "prettier (local)")
        (setq command (format "%s --write %s" formatter (shell-quote-argument file))))
       ((and global-prettier)
        (setq formatter global-prettier)
        (setq source "prettier (global)")
        (setq command (format "%s --write %s" formatter (shell-quote-argument file)))))
      (if command
          (progn
            (save-buffer)
            (shell-command command)
            (revert-buffer t t t)
            (let ((elapsed-time (* 1000 (- (float-time) start-time)))) ;; Calculate elapsed time in ms
              (message "Formatted with %s - %.2f ms" source elapsed-time)))
        (message "No formatter found (biome or prettier)"))))

  (global-set-key (kbd "C-c p") #'emacs-solo-movements/format-current-file)


  (defun emacs-solo/transpose-split ()
    "Transpose a horizontal split into a vertical split, or vice versa."
    (interactive)
    (if (> (length (window-list)) 2)
        (user-error "More than two windows present")
      (let* ((this-win (selected-window))
             (other-win (next-window))
             (this-buf (window-buffer this-win))
             (other-buf (window-buffer other-win))
             (this-edges (window-edges this-win))
             (other-edges (window-edges other-win))
             (this-left (car this-edges))
             (other-left (car other-edges))
             (split-horizontally (not (= this-left other-left))))
        (delete-other-windows)
        (if split-horizontally
            (split-window-vertically)
          (split-window-horizontally))
        (set-window-buffer (selected-window) this-buf)
        (set-window-buffer (next-window) other-buf)
        (select-window this-win))))

  (global-set-key (kbd "C-x 4 t") #'emacs-solo/transpose-split))

;; font aporetic
;;(set-frame-font "Aporetic Sans Mono-22" t t)


;; ;;; EMACS-SOLO-MODE-LINE
;; ;;
;; ;;  Customizations to the mode-line
;; ;;
(use-package emacs-solo-mode-line
  :ensure nil
  :no-require t
  :defer t
  :init
  ;; Shorten big branches names
  (defun emacs-solo/shorten-vc-mode (vc)
    "Shorten VC string to at most 20 characters.
 Replacing `Git-' with a branch symbol."
    (let* ((vc (replace-regexp-in-string "^ Git[:-]" "  " vc))) ;; Options:   ᚠ ⎇
      (if (> (length vc) 20)
          (concat (substring vc 0 20) "…")
        vc)))

  ;; Formats Modeline
  (setq-default mode-line-format
                '("%e" "  "
                  ;; (:propertize " " display (raise +0.1)) ;; Top padding
                  ;; (:propertize " " display (raise -0.1)) ;; Bottom padding
                  (:propertize "λ  " face font-lock-keyword-face)

                  (:propertize
                   ("" mode-line-mule-info mode-line-client mode-line-modified mode-line-remote))

                  mode-line-frame-identification
                  mode-line-buffer-identification
                  "   "
                  mode-line-position
                  mode-line-format-right-align
                  "  "
                  (project-mode-line project-mode-line-format)
                  "  "
                  (vc-mode (:eval (emacs-solo/shorten-vc-mode vc-mode)))
                  "  "
                  mode-line-modes
                  mode-line-misc-info
                  "  ")
                project-mode-line t
                mode-line-buffer-identification '(" %b")
                mode-line-position-column-line-format '(" %l:%c"))

  ;; Provides the Diminish functionality
  (defvar emacs-solo-hidden-minor-modes
    '(abbrev-mode
      eldoc-mode
      flyspell-mode
      smooth-scroll-mode
      outline-minor-mode
      which-key-mode))

  (defun emacs-solo/purge-minor-modes ()
    (interactive)
    (dolist (x emacs-solo-hidden-minor-modes nil)
      (let ((trg (cdr (assoc x minor-mode-alist))))
        (when trg
          (setcar trg "")))))

  (add-hook 'after-change-major-mode-hook 'emacs-solo/purge-minor-modes))


;;; EMACS-SOLO-EXEC-PATH-FROM-SHELL
;;
;;  Loads users default shell PATH settings into Emacs. Usefull
;;  when calling Emacs directly from GUI systems.
;;
(use-package emacs-solo-exec-path-from-shell
  :ensure nil
  :no-require t
  :defer t
  :init
  (defun emacs-solo/set-exec-path-from-shell-PATH ()
    "Set up Emacs' `exec-path' and PATH environment the same as user Shell."
    (interactive)
    (let ((path-from-shell
           (replace-regexp-in-string
            "[ \t\n]*$" "" (shell-command-to-string
                            "$SHELL --login -c 'echo $PATH'"))))
      (setenv "PATH" path-from-shell)
      (setq exec-path (split-string path-from-shell path-separator))
      (message ">>> emacs-solo: PATH loaded")))

  (defun emacs-solo/fix-asdf-path ()
  "Ensure asdf shims and active Node.js version's bin directory are first in PATH."
  (interactive)
  (let* ((asdf-shims (expand-file-name "~/.asdf/shims"))
         (node-bin (string-trim (shell-command-to-string "asdf where nodejs 2>/dev/null")))
         (new-paths (list asdf-shims)))

    ;; If Node.js is installed, add its bin path
    (when (file-directory-p node-bin)
      (push (concat node-bin "/bin") new-paths))

    ;; Remove old asdf-related paths from PATH and exec-path
    (setq exec-path (seq-remove (lambda (p) (string-match-p "/\\.asdf/" p)) exec-path))
    (setenv "PATH" (string-join (seq-remove (lambda (p) (string-match-p "/\\.asdf/" p))
                                            (split-string (getenv "PATH") ":"))
                                ":"))

    ;; Add the new paths to exec-path and PATH
    (dolist (p (reverse new-paths))
      (unless (member p exec-path) (push p exec-path))
      (unless (member p (split-string (getenv "PATH") ":"))
        (setenv "PATH" (concat p ":" (getenv "PATH")))))))

  (add-hook 'find-file-hook #'emacs-solo/fix-asdf-path)
  (add-hook 'eshell-mode-hook #'emacs-solo/fix-asdf-path)
  (add-hook 'eshell-pre-command-hook #'emacs-solo/fix-asdf-path)
  (add-hook 'eshell-directory-change-hook #'emacs-solo/fix-asdf-path)

  (add-hook 'after-init-hook #'emacs-solo/set-exec-path-from-shell-PATH)
  (add-hook 'after-init-hook #'emacs-solo/fix-asdf-path))


;;; EMACS-SOLO-RAINBOW-DELIMITERS
;;
;;  Colorizes matching delimiters
;;
;;  FIXME: Make it play nice with treesitter modes
;;
(use-package emacs-solo-rainbow-delimiters
  :ensure nil
  :no-require t
  :defer t
  :init
  (defun emacs-solo/rainbow-delimiters ()
    "Apply simple rainbow coloring to parentheses, brackets, and braces in the current buffer.
Opening and closing delimiters will have matching colors."
    (interactive)
    (let ((colors '(font-lock-keyword-face
                    font-lock-type-face
                    font-lock-function-name-face
                    font-lock-variable-name-face
                    font-lock-constant-face
                    font-lock-builtin-face
                    font-lock-string-face
                    )))
      (font-lock-add-keywords
       nil
       `((,(rx (or "(" ")" "[" "]" "{" "}"))
          (0 (let* ((char (char-after (match-beginning 0)))
                    (depth (save-excursion
                             ;; Move to the correct position based on opening/closing delimiter
                             (if (member char '(?\) ?\] ?\}))
                                 (progn
                                   (backward-char) ;; Move to the opening delimiter
                                   (car (syntax-ppss)))
                               (car (syntax-ppss)))))
                    (face (nth (mod depth ,(length colors)) ',colors)))
               (list 'face face)))))))
    (font-lock-flush)
    (font-lock-ensure))

  (add-hook 'prog-mode-hook #'emacs-solo/rainbow-delimiters))


;;; EMACS-SOLO-PROJECT-SELECT
;;
;;  Interactively finds a project in a Projects folder and sets it
;;  to current `project.el' project.
;;
(use-package emacs-solo-project-select
  :ensure nil
  :no-require t
  :init
  (defvar emacs-solo-default-projects-folder "~/Projects"
    "Default folder to search for projects.")

  (defvar emacs-solo-default-projects-input "**"
    "Default input to use when finding a project.")

  (defun emacs-solo/find-projects-and-switch (&optional directory)
    "Find and switch to a project directory from ~/Projects."
    (interactive)
    (let* ((d (or directory emacs-solo-default-projects-folder))
           ;; (find-command (concat "fd --type d --max-depth 4 . " d))           ; with fd
           (find-command (concat "find " d " -mindepth 1 -maxdepth 4 -type d"))  ; with find
           (project-list (split-string (shell-command-to-string find-command) "\n" t))
           (initial-input emacs-solo-default-projects-input))
      (let ((selected-project
             (completing-read
              "Search project folder: "
              project-list
              nil nil
              initial-input)))
        (when (and selected-project (file-directory-p selected-project))
          (project-switch-project selected-project)))))

  (defun emacs-solo/minibuffer-move-cursor ()
    "Move cursor between `*` characters when minibuffer is populated with `**`."
    (when (string-prefix-p emacs-solo-default-projects-input (minibuffer-contents))
      (goto-char (+ (minibuffer-prompt-end) 1))))

  (add-hook 'minibuffer-setup-hook #'emacs-solo/minibuffer-move-cursor)

  :bind (:map project-prefix-map
         ("P" . emacs-solo/find-projects-and-switch)))


;;; EMACS-SOLO-VIPER-EXTENSIONS
;;
;;  Better VIM (and not VI) bindings for viper-mode
;;
(use-package emacs-solo-viper-extensions
  :ensure nil
  :no-require t
  :defer t
  :after viper
  :init
  (defun viper-operate-inside-delimiters (open close op)
    "Perform OP inside delimiters OPEN and CLOSE (e.g., (), {}, '', or \"\")."
    (save-excursion
      (search-backward (char-to-string open) nil t)
      (forward-char) ;; Move past the opening delimiter
      (let ((start (point)))
        (search-forward (char-to-string close) nil t)
        (backward-char) ;; Move back before the closing delimiter
        (pulse-momentary-highlight-region start (point))
        (funcall op start (point)))))

  ;; FIXME: works for most common cases, misses (  bla bla (bla) |cursor-here| )
  (defun viper-delete-inside-delimiters (open close)
    "Delete text inside delimiters OPEN and CLOSE, saving it to the kill ring."
    (interactive "cEnter opening delimiter: \ncEnter closing delimiter: ")
    (viper-operate-inside-delimiters open close 'kill-region))

  (defun viper-yank-inside-delimiters (open close)
    "Copy text inside delimiters OPEN and CLOSE to the kill ring."
    (interactive "cEnter opening delimiter: \ncEnter closing delimiter: ")
    (viper-operate-inside-delimiters open close 'kill-ring-save))

  (defun viper-delete-line-or-region ()
    "Delete the current line or the selected region in Viper mode.
The deleted text is saved to the kill ring."
    (interactive)
    (if (use-region-p)
        ;; If a region is active, delete it
        (progn
          (pulse-momentary-highlight-region (region-beginning) (region-end))
          (run-at-time 0.1 nil 'kill-region (region-beginning) (region-end)))
      ;; Otherwise, delete the current line including its newline character
      (pulse-momentary-highlight-region (line-beginning-position) (line-beginning-position 2))
      (run-at-time 0.1 nil 'kill-region (line-beginning-position) (line-beginning-position 2))))

  (defun viper-yank-line-or-region ()
    "Yank the current line or the selected region and highlight the region."
    (interactive)
    (if (use-region-p)
        ;; If a region is selected, yank it
        (progn
          (kill-ring-save (region-beginning) (region-end))  ;; Yank the region
          (pulse-momentary-highlight-region (region-beginning) (region-end)))
      ;; Otherwise, yank the current line
      (let ((start (line-beginning-position))
            (end (line-end-position)))
        (kill-ring-save start end)  ;; Yank the current line
        (pulse-momentary-highlight-region start end))))

  (defun viper-visual-select ()
    "Start visual selection from the current position."
    (interactive)
    (set-mark (point)))

  (defun viper-visual-select-line ()
    "Start visual selection from the beginning of the current line."
    (interactive)
    (set-mark (line-beginning-position)))

  (defun viper-delete-inner-word ()
    "Delete the current word under the cursor, handling edge cases."
    (interactive)
    (let ((bounds (bounds-of-thing-at-point 'word)))
      (if bounds
          (kill-region (car bounds) (cdr bounds))
        (message "No word under cursor"))))

  (defun viper-change-inner-word ()
    "Change the current word under the cursor, handling edge cases."
    (interactive)
    (viper-delete-inner-word)
    (viper-insert nil))

  (defun viper-yank-inner-word ()
    "Yank (copy) the current word under the cursor, handling edge cases."
    (interactive)
    (let ((bounds (bounds-of-thing-at-point 'word)))
      (pulse-momentary-highlight-region (car bounds) (cdr bounds))
      (if bounds
          (kill-ring-save (car bounds) (cdr bounds))
        (message "No word under cursor"))))

  (defun viper-delete-inner-compound-word ()
    "Delete the entire compound word under the cursor, including `-` and `_`."
    (interactive)
    (let ((bounds (viper-compound-word-bounds)))
      (if bounds
          (kill-region (car bounds) (cdr bounds))
        (message "No compound word under cursor"))))

  (defun viper-change-inner-compound-word ()
    "Change the entire compound word under the cursor, including `-` and `_`."
    (interactive)
    (viper-delete-inner-compound-word)
    (viper-insert nil))

  (defun viper-yank-inner-compound-word ()
    "Yank the entire compound word under the cursor into the kill ring."
    (interactive)
    (let ((bounds (viper-compound-word-bounds)))
      (pulse-momentary-highlight-region (car bounds) (cdr bounds))
      (if bounds
          (kill-ring-save (car bounds) (cdr bounds))
        (message "No compound word under cursor"))))

  (defun viper-compound-word-bounds ()
    "Get the bounds of a compound word under the cursor.
A compound word includes letters, numbers, `-`, and `_`."
    (save-excursion
      (let* ((start (progn
                      (skip-chars-backward "a-zA-Z0-9_-")
                      (point)))
             (end (progn
                    (skip-chars-forward "a-zA-Z0-9_-")
                    (point))))
        (when (< start end) (cons start end)))))

  (defun viper-go-to-nth-or-first-line (arg)
    "Go to the first line of the document, or the ARG-nth."
    (interactive "P")
    (if arg
        (viper-goto-line arg)
      (viper-goto-line 1))
    (pulse-momentary-highlight-region
     (line-beginning-position) (line-beginning-position 2)))

  (defun viper-go-to-last-line ()
    "Go to the last line of the document."
    (interactive)
    (goto-char (point-max)))

  (defun viper-window-split-horizontally ()
    "Split the window horizontally (mimics Vim's `C-w s`)."
    (interactive)
    (split-window-below)
    (other-window 1))

  (defun viper-window-split-vertically ()
    "Split the window vertically (mimics Vim's `C-w v`)."
    (interactive)
    (split-window-right)
    (other-window 1))

  (defun viper-window-close ()
    "Close the current window (mimics Vim's `C-w c`)."
    (interactive)
    (delete-window))

  (defun viper-window-maximize ()
    "Maximize the current window (mimics Vim's `C-w o`)."
    (interactive)
    (delete-other-windows))

  ;; Delete inside delimiters
  (define-key viper-vi-global-user-map (kbd "di(") (lambda () (interactive) (viper-delete-inside-delimiters ?\( ?\))))
  (define-key viper-vi-global-user-map (kbd "dib") (lambda () (interactive) (viper-delete-inside-delimiters ?\( ?\))))
  (define-key viper-vi-global-user-map (kbd "di{") (lambda () (interactive) (viper-delete-inside-delimiters ?{ ?})))
  (define-key viper-vi-global-user-map (kbd "di\"") (lambda () (interactive) (viper-delete-inside-delimiters ?\" ?\")))
  (define-key viper-vi-global-user-map (kbd "di'") (lambda () (interactive) (viper-delete-inside-delimiters ?' ?')))

  ;; Yank inside delimiters
  (define-key viper-vi-global-user-map (kbd "yi(") (lambda () (interactive) (viper-yank-inside-delimiters ?\( ?\))))
  (define-key viper-vi-global-user-map (kbd "yi{") (lambda () (interactive) (viper-yank-inside-delimiters ?{ ?})))
  (define-key viper-vi-global-user-map (kbd "yi\"") (lambda () (interactive) (viper-yank-inside-delimiters ?\" ?\")))
  (define-key viper-vi-global-user-map (kbd "yi'") (lambda () (interactive) (viper-yank-inside-delimiters ?' ?')))

  ;; Delete/Yank current word
  (define-key viper-vi-global-user-map (kbd "diw") 'viper-delete-inner-word)
  (define-key viper-vi-global-user-map (kbd "yiw") 'viper-yank-inner-word)
  (define-key viper-vi-global-user-map (kbd "ciw") 'viper-change-inner-word)
  (define-key viper-vi-global-user-map (kbd "diW") 'viper-delete-inner-compound-word)
  (define-key viper-vi-global-user-map (kbd "yiW") 'viper-yank-inner-compound-word)
  (define-key viper-vi-global-user-map (kbd "ciW") 'viper-change-inner-compound-word)

  ;; Beginning/End buffer
  (define-key viper-vi-global-user-map (kbd "G") 'viper-go-to-last-line)
  (define-key viper-vi-global-user-map (kbd "g") nil)
  (define-key viper-vi-global-user-map (kbd "gg") 'viper-go-to-nth-or-first-line)

  ;; Delete/Yank current line or region
  (define-key viper-vi-global-user-map (kbd "dd") 'viper-delete-line-or-region)
  (define-key viper-vi-global-user-map (kbd "yy") 'viper-yank-line-or-region)

  ;; Visual mode is actually marking
  (define-key viper-vi-global-user-map (kbd "v") 'viper-visual-select)
  (define-key viper-vi-global-user-map (kbd "V") 'viper-visual-select-line)

  ;; Movements by references and LSP
  (define-key viper-vi-global-user-map (kbd "gd") 'xref-find-references)
  (define-key viper-vi-global-user-map (kbd "SPC c a") 'eglot-code-actions)
  (define-key viper-vi-global-user-map (kbd "SPC s g") 'project-find-regexp)
  (define-key viper-vi-global-user-map (kbd "SPC s f") 'project-find-file)
  (define-key viper-vi-global-user-map (kbd "SPC m p") 'emacs-solo-movements/format-current-file)
  (global-set-key (kbd "C-o") 'xref-go-back)

  ;; Map `C-w` followed by specific keys to window commands in Viper
  (define-key viper-vi-global-user-map (kbd "C-w s") 'viper-window-split-horizontally)
  (define-key viper-vi-global-user-map (kbd "C-w v") 'viper-window-split-vertically)
  (define-key viper-vi-global-user-map (kbd "C-w c") 'viper-window-close)
  (define-key viper-vi-global-user-map (kbd "C-w o") 'viper-window-maximize)

  ;; Add navigation commands to mimic Vim's `C-w hjkl`
  (define-key viper-vi-global-user-map (kbd "C-w h") 'windmove-left)
  (define-key viper-vi-global-user-map (kbd "C-w l") 'windmove-right)
  (define-key viper-vi-global-user-map (kbd "C-w k") 'windmove-up)
  (define-key viper-vi-global-user-map (kbd "C-w j") 'windmove-down)

  ;; Indent region
  (define-key viper-vi-global-user-map (kbd "==") 'indent-region)

  ;; Word spelling
  (define-key viper-vi-global-user-map (kbd "z=") 'ispell-word)

  ;; Keybindings for buffer navigation and switching in Viper mode
  (define-key viper-vi-global-user-map (kbd "] b") 'next-buffer)
  (define-key viper-vi-global-user-map (kbd "[ b") 'previous-buffer)
  (define-key viper-vi-global-user-map (kbd "b l") 'switch-to-buffer)
  (define-key viper-vi-global-user-map (kbd "SPC SPC") 'switch-to-buffer)

  ;; Tabs (like in tmux tabs, not vscode tabs)
  (define-key viper-vi-global-user-map (kbd "C-w t") 'tab-bar-new-tab)
  (define-key viper-vi-global-user-map (kbd "] t") 'tab-next)
  (define-key viper-vi-global-user-map (kbd "[ t") 'tab-previous)

  ;; Flymake
  (define-key viper-vi-global-user-map (kbd "SPC x x") 'flymake-show-buffer-diagnostics)
  (define-key viper-vi-global-user-map (kbd "] d") 'flymake-goto-next-error)
  (define-key viper-vi-global-user-map (kbd "[ d") 'flymake-goto-prev-error)
  (define-key viper-vi-global-user-map (kbd "SPC t i") 'toggle-flymake-diagnostics-at-eol)

  ;; Gutter
  (define-key viper-vi-global-user-map (kbd "] c") 'emacs-solo/goto-next-hunk)
  (define-key viper-vi-global-user-map (kbd "[ c") 'emacs-solo/goto-previous-hunk))



;;; EMACS-SOLO-HIGHLIGHT-KEYWORDS-MODE
;;
;;  Highlights a list of words like TODO, FIXME...
;;  Code borrowed from `alternateved'
;;
(use-package emacs-solo-highlight-keywords-mode
  :ensure nil
  :no-require t
  :defer t
  :init
  (defcustom +highlight-keywords-faces
    '(("TODO" . error)
      ("FIXME" . error)
      ("HACK" . warning)
      ("NOTE" . warning)
      ("HERE" . compilation-info)
      ("EMACS-31" . compilation-info))
    "Alist of keywords to highlight and their face."
    :group '+highlight-keywords
    :type '(alist :key-type (string :tag "Keyword")
                  :value-type (symbol :tag "Face"))
    :set (lambda (sym val)
           (dolist (face (mapcar #'cdr val))
             (unless (facep face)
               (error "Invalid face: %s" face)))
           (set-default sym val)))

  (defvar +highlight-keywords--keywords
    (when +highlight-keywords-faces
      (let ((keywords (mapcar #'car +highlight-keywords-faces)))
        `((,(regexp-opt keywords 'words)
           (0 (when (nth 8 (syntax-ppss))
                (cdr (assoc (match-string 0) +highlight-keywords-faces)))
              prepend)))))
    "Keywords and corresponding faces for `emacs-solo/highlight-keywords-mode'.")

  (defun emacs-solo/highlight-keywords-mode-on ()
    (font-lock-add-keywords nil +highlight-keywords--keywords t)
    (font-lock-flush))

  (defun emacs-solo/highlight-keywords-mode-off ()
    (font-lock-remove-keywords nil +highlight-keywords--keywords)
    (font-lock-flush))

  (define-minor-mode emacs-solo/highlight-keywords-mode
    "Highlight TODO and similar keywords in comments and strings."
    :lighter " +HL"
    :group '+highlight-keywords
    (if emacs-solo/highlight-keywords-mode
        (emacs-solo/highlight-keywords-mode-on)
      (emacs-solo/highlight-keywords-mode-off)))

  :hook
  (prog-mode . (lambda () (run-at-time "1 sec" nil #'emacs-solo/highlight-keywords-mode-on))))

;; yas snippet global
(require 'yasnippet)
(yas-global-mode 1)



;;; EMACS-SOLO-ACE-WINDOW
;;
;;  Based on: https://www.reddit.com/r/emacs/comments/1h0zjvq/comment/m0uy3bo/?context=3
;;
;;  TODO: implement ace-swap like feature
(use-package emacs-solo-ace-window
  :ensure nil
  :no-require t
  :defer t
  :init
  (defvar emacs-solo-ace-window/quick-window-overlays nil
    "List of overlays used to temporarily display window labels.")

  (defun emacs-solo-ace-window/quick-window-jump ()
    "Jump to a window by typing its assigned character label.
Windows are labeled starting from the top-left window and proceeding top to bottom, then left to right."
    (interactive)
    (let* ((window-list (emacs-solo-ace-window/get-windows))
           (window-keys (seq-take '("1" "2" "3" "4" "5" "6" "7" "8")
                                  (length window-list)))
           (window-map (cl-pairlis window-keys window-list)))
      (emacs-solo-ace-window/add-window-key-overlays window-map)
      (let ((key (read-key (format "Select window [%s]: " (string-join window-keys ", ")))))
        (emacs-solo-ace-window/remove-window-key-overlays)
        (if-let* ((selected-window (cdr (assoc (char-to-string key) window-map))))
            (select-window selected-window)
          (message "No window assigned to key: %c" key)))))

  (defun emacs-solo-ace-window/get-windows ()
    "Return a list of windows in the current frame, ordered from top to bottom, left to right."
    (sort (window-list nil 'no-mini)
          (lambda (w1 w2)
            (let ((edges1 (window-edges w1))
                  (edges2 (window-edges w2)))
              (or (< (car edges1) (car edges2)) ; Compare top edges
                  (and (= (car edges1) (car edges2)) ; If equal, compare left edges
                       (< (cadr edges1) (cadr edges2))))))))

  (defun emacs-solo-ace-window/add-window-key-overlays (window-map)
    "Add temporary overlays to windows with their assigned key labels from WINDOW-MAP."
    (setq emacs-solo-ace-window/quick-window-overlays nil)
    (dolist (entry window-map)
      (let* ((key (car entry))
             (window (cdr entry))
             (start (window-start window))
             (overlay (make-overlay start start (window-buffer window))))
        (overlay-put overlay 'after-string
                     (propertize (format " [%s] " key)
                                 'face '(:foreground "#c3e88d"
                                         :background "#232635"
                                         :weight bold
                                         :height default)))
        (overlay-put overlay 'window window)
        (push overlay emacs-solo-ace-window/quick-window-overlays))))

  (defun emacs-solo-ace-window/remove-window-key-overlays ()
    "Remove all temporary overlays used to display key labels in windows."
    (mapc 'delete-overlay emacs-solo-ace-window/quick-window-overlays)
    (setq emacs-solo-ace-window/quick-window-overlays nil))

  (global-set-key (kbd "M-O") #'emacs-solo-ace-window/quick-window-jump))


;;; EMACS-SOLO-OLIVETTI
;;
(use-package emacs-solo-olivetti
  :ensure nil
  :no-require t
  :defer t
  :init
  (defvar emacs-solo-center-document-desired-width 90
    "The desired width of a document centered in the window.")

  (defun emacs-solo/center-document--adjust-margins ()
    ;; Reset margins first before recalculating
    (set-window-parameter nil 'min-margins nil)
    (set-window-margins nil nil)

    ;; Adjust margins if the mode is on
    (when emacs-solo/center-document-mode
      (let ((margin-width (max 0
                               (truncate
                                (/ (- (window-width)
                                      emacs-solo-center-document-desired-width)
                                   2.0)))))
        (when (> margin-width 0)
          (set-window-parameter nil 'min-margins '(0 . 0))
          (set-window-margins nil margin-width margin-width)))))

  (define-minor-mode emacs-solo/center-document-mode
    "Toggle centered text layout in the current buffer."
    :lighter " Centered"
    :group 'editing
    (if emacs-solo/center-document-mode
        (add-hook 'window-configuration-change-hook #'emacs-solo/center-document--adjust-margins 'append 'local)
      (remove-hook 'window-configuration-change-hook #'emacs-solo/center-document--adjust-margins 'local))
    (emacs-solo/center-document--adjust-margins))


;;  (add-hook 'org-mode-hook #'emacs-solo/center-document-mode)
  (add-hook 'gnus-group-mode-hook #'emacs-solo/center-document-mode)
  (add-hook 'gnus-summary-mode-hook #'emacs-solo/center-document-mode)
  (add-hook 'gnus-article-mode-hook #'emacs-solo/center-document-mode)

  ;; (add-hook 'newsticker-treeview-list-mode-hook 'emacs-solo/timed-center-visual-fill-on)
  ;; (add-hook 'newsticker-treeview-item-mode-hook 'emacs-solo/timed-center-visual-fill-on)
  )


;;; EMACS-SOLO-0x0
;;
;; Inspired by: https://codeberg.org/daviwil/dotfiles/src/branch/master/Emacs.org#headline-28
(use-package emacs-solo-0x0
  :ensure nil
  :no-require t
  :defer t
  :init
  (defun emacs-solo/0x0-upload-text ()
    (interactive)
    (let* ((contents (if (use-region-p)
                         (buffer-substring-no-properties (region-beginning) (region-end))
                       (buffer-string)))
           (temp-file (make-temp-file "0x0" nil ".txt" contents)))
      (message "Sending %s to 0x0.st..." temp-file)
      (let ((url (string-trim-right
                  (shell-command-to-string
                   (format "curl -s -F'file=@%s' https://0x0.st" temp-file)))))
        (message "The URL is %s" url)
        (kill-new url)
        (delete-file temp-file))))

  (defun emacs-solo/0x0-upload-file (file-path)
    (interactive "fSelect a file to upload: ")
    (message "Sending %s to 0x0.st..." file-path)
    (let ((url (string-trim-right
                (shell-command-to-string
                 (format "curl -s -F'file=@%s' https://0x0.st" (expand-file-name file-path))))))
      (message "The URL is %s" url)
      (kill-new url))))


;;; EMACS-SOLO-SUDO-EDIT
;;
;; Inspired by: https://codeberg.org/daviwil/dotfiles/src/branch/master/Emacs.org#headline-28
(use-package emacs-solo-sudo-edit
  :ensure nil
  :no-require t
  :defer t
  :init
  (defun emacs-solo/sudo-edit (&optional arg)
    "Edit currently visited file as root.
With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
    (interactive "P")
    (if (or arg (not buffer-file-name))
        (find-file (concat "/sudo:root@localhost:"
                           (completing-read "Find file(as root): ")))
      (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name)))))


;;; EMACS-SOLO-REPLACE-AS-DIFF
;;
(use-package emacs-solo/replace-regexp-as-diff
  :ensure nil
  :no-require t
  :defer t
  :init

  ;; NOTE: improvements wrappers over `multi-file-replace-regexp-as-diff', so
  ;;       we can:
  ;;       1.) Use it with glob pattern matching in files, including inside
  ;;           subfolders (`emacs-solo/multi-file-replace-regexp-as-diff-with-glob')
  ;;       2.) Use it with marked files and or directories in dired
  ;;           (`emacs-solo/dired-do-replace-regexp-as-diff')


  ;; `M-x emacs-solo/multi-file-replace-regexp-as-diff-with-glob RET'
  ;;
  ;; A wrapper for `multi-file-replace-regexp-as-diff' that extends its functionality
  ;; to support glob patterns for file matching. It recursively searches all files
  ;; in the specified directory (including subdirectories) that match the given glob
  ;; pattern (e.g., `*.js`), and displays the replacements as diffs in the
  ;; `*replace-diff*` buffer. This allows for easy review and application of changes
  ;; across multiple files.
  (defun emacs-solo/multi-file-replace-regexp-as-diff-with-glob (dir regexp to-string &optional delimited glob-pattern)
    "Wrapper for `multi-file-replace-regexp-as-diff` that accepts a directory and a glob pattern.
DIR is the directory to search recursively.
REGEXP is the regular expression to replace.
TO-STRING is the replacement string.
DELIMITED is an optional argument passed to `multi-file-replace-regexp-as-diff`.
GLOB-PATTERN is the glob pattern to match files (e.g., \"*.el\")."
    (interactive
     (let ((dir (file-truename (read-directory-name "Directory: ")))
           (common (query-replace-read-args
                    (concat "Replace"
                            (if current-prefix-arg " word" "")
                            " regexp as diff in files")
                    t t))
           (glob-pattern (read-string "Glob pattern (e.g., *.el): " "*")))
       (list dir (nth 0 common) (nth 1 common) (nth 2 common) glob-pattern)))

    (let* ((glob-regexp (wildcard-to-regexp glob-pattern))
           ;; file-expand-wildcards instead of directory-files-recursively, would
           ;; not allow us to traverse directories
           (files (directory-files-recursively dir glob-regexp)))

      (if files
          (multi-file-replace-regexp-as-diff files regexp to-string delimited)
        (message "No files found for glob-pattern: %s" glob-pattern))))


  ;; `M-x dired RET' mark files and/or directories then
  ;; `M-x emacs-solo/multi-file-replace-regexp-as-diff-with-glob RET'
  ;;
  ;; A version of `dired-do-replace-regexp-as-diff' that adds support for selected
  ;; directories in Dired. When directories are marked, it recursively includes all
  ;; files within them (and their subdirectories) in the replacement operation.
  ;; The replacements are displayed as diffs in the `*replace-diff*` buffer, allowing
  ;; for review and application of changes across multiple files and directories.
  (defun emacs-solo/expand-directories (items)
    "Expand ITEMS to include all files within directories (recursively).
Directories themselves are excluded from the final list."
    (cl-loop for item in items
             if (file-directory-p item)
             append (let ((files (directory-files-recursively item ".*" t)))
                      (cl-remove-if #'file-directory-p files))
             else if (file-regular-p item) ; Ensure only regular files are included
             collect item))
  (defun emacs-solo/dired-do-replace-regexp-as-diff (from to &optional delimited)
    "Do `replace-regexp' of FROM with TO as diff, on all marked files and directories.
If a marked item is a directory, all files within it (recursively) are included.
Third arg DELIMITED (prefix arg) means replace only word-delimited matches.
The replacements are displayed in the buffer *replace-diff* that
you can later apply as a patch after reviewing the changes."
    (interactive
     (let ((common
            (query-replace-read-args
             "Replace regexp as diff in marked files and directories" t t t)))
       (list (nth 0 common) (nth 1 common) (nth 2 common))))
    (dired-post-do-command)
    (let* ((marked-items (dired-get-marked-files)) ; Include directories in the list
           (files (emacs-solo/expand-directories marked-items)))
      (if files
          (progn
            (multi-file-replace-regexp-as-diff files from to delimited))
        (message "No files found in marked items.")))))

;;; EMACS-SOLO-WEATHER
;;
(use-package emacs-solo-weather
  :ensure nil
  :no-require t
  :defer t
  :init
  (setq emacs-solo-weather-city "Indaiatuba")

  (defun emacs-solo/weather-buffer ()
    "Open a new Emacs buffer and asynchronously fetch wttr.in weather data."
    (interactive)
    (let* ((city (shell-quote-argument emacs-solo-weather-city))
           (buffer (get-buffer-create "*Weather*"))
           (url1 (format "curl -s 'wttr.in/%s'" city))
           (url2 (format "curl -s 'v2d.wttr.in/%s'" city)))
      (with-current-buffer buffer
        (read-only-mode -1)
        (erase-buffer)
        (insert "Fetching weather data...\n")
        (read-only-mode 1))
      (switch-to-buffer buffer)
<      ;; Fetch both asynchronously
      (emacs-solo--fetch-weather url1 buffer)
      (emacs-solo--fetch-weather url2 buffer t)))

  (defun emacs-solo--fetch-weather (cmd buffer &optional second)
    "Run CMD asynchronously and insert results into BUFFER.
If SECOND is non-nil, separate the results with a newline."
    (make-process
     :name "weather-fetch"
     :buffer (generate-new-buffer " *weather-temp*")
     :command (list "sh" "-c" cmd)
     :sentinel
     (lambda (proc _event)
       (when (eq (process-status proc) 'exit)
         (let ((output (with-current-buffer (process-buffer proc)
                         (buffer-string))))
           (kill-buffer (process-buffer proc))
           (setq output (replace-regexp-in-string "^Follow.*\n" ""
                                                  (replace-regexp-in-string "[\x0f]" "" output)))
           (with-current-buffer buffer
             (read-only-mode -1)
             (when second (insert "\n\n"))
             (insert output)
             (ansi-color-apply-on-region (point-min) (point-max))
             (goto-char (point-min))
             (read-only-mode 1))))))))


;;; EMACS-SOLO-OLLAMA
;;
(use-package emacs-solo-ollama
  :ensure nil
  :no-require t
  :defer t
  :init
  (defun emacs-solo/ollama-run-model ()
    "Run `ollama list`, let the user choose a model, and open it in `ansi-term`.
Asks for a prompt when run. If none is passed (RET), starts it interactive.
If a region is selected, prompt for additional input and pass it as a query."
    (interactive)
    (let* ((output (shell-command-to-string "ollama list"))
           (models (let ((lines (split-string output "\n" t)))
                     (mapcar (lambda (line) (car (split-string line))) (cdr lines))))
           (selected (completing-read "Select Ollama model: " models nil t))
           (region-text (when (use-region-p)
                          (shell-quote-argument
                           (replace-regexp-in-string "\n" " "
                                                     (buffer-substring-no-properties
                                                      (region-beginning)
                                                      (region-end))))))
           (prompt (read-string "Ollama Prompt (leave it blank for interactive): " nil nil nil)))
      (when (and selected (not (string-empty-p selected)))
        (ansi-term "/bin/sh")
        (sit-for 1)
        (let ((args (list (format "ollama run %s"
                                  selected))))
          (when (and prompt (not (string-empty-p prompt)))
            (setq args (append args (list (format "\"%s\"" prompt)))))
          (when region-text
            (setq args (append args (list (format "\"%s\"" region-text)))))

          (term-send-raw-string (string-join args " "))
          (term-send-raw-string "\n"))))))


;;; EMACS-SOLO-DIRED-GUTTER
;;
(use-package emacs-solo-dired-gutter
  :ensure nil
  :no-require t
  :defer t
  :init
  (setq emacs-solo-dired-gutter-enabled t)

  (defvar emacs-solo/dired-git-status-overlays nil
    "List of active overlays in Dired for Git status.")

  (defun emacs-solo/dired--git-status-face (code)
    "Return a cons cell (STATUS . FACE) for a given Git porcelain CODE."
    (let* ((git-status-untracked "??")
           (git-status-modified " M")
           (git-status-modified-alt "M ")
           (git-status-deleted "D ")
           (git-status-added "A ")
           (git-status-renamed "R ")
           (git-status-copied "C ")
           (git-status-ignored "!!")
           (status (cond
                    ((string-match-p "\\?\\?" code) git-status-untracked)
                    ((string-match-p "^ M" code) git-status-modified)
                    ((string-match-p "^M " code) git-status-modified-alt)
                    ((string-match-p "^D" code) git-status-deleted)
                    ((string-match-p "^A" code) git-status-added)
                    ((string-match-p "^R" code) git-status-renamed)
                    ((string-match-p "^C" code) git-status-copied)
                    ((string-match-p "\\!\\!" code) git-status-ignored)
                    (t "  ")))
           (face (cond
                  ((string= status git-status-ignored) 'shadow)
                  ((string= status git-status-untracked) 'warning)
                  ((string= status git-status-modified) 'font-lock-function-name-face)
                  ((string= status git-status-modified-alt) 'font-lock-function-name-face)
                  ((string= status git-status-deleted) 'error)
                  ((string= status git-status-added) 'success)
                  (t 'font-lock-keyword-face))))
      (cons status face)))

  (defun emacs-solo/dired-git-status-overlay ()
    "Overlay Git status indicators on the first column in Dired."
    (interactive)
    (require 'vc-git)
    (let ((git-root (ignore-errors (vc-git-root default-directory))))
      (when (and git-root
                 (not (file-remote-p default-directory))
                 emacs-solo-dired-gutter-enabled)
        (setq git-root (expand-file-name git-root))
        (let* ((git-status (vc-git--run-command-string nil "status" "--porcelain" "--ignored" "--untracked-files=normal"))
               (status-map (make-hash-table :test 'equal)))
          (mapc #'delete-overlay emacs-solo/dired-git-status-overlays)
          (setq emacs-solo/dired-git-status-overlays nil)

          (dolist (line (split-string git-status "\n" t))
            (when (string-match "^\\(..\\) \\(.+\\)$" line)
              (let* ((code (match-string 1 line))
                     (file (match-string 2 line))
                     (fullpath (expand-file-name file git-root))
                     (status-face (emacs-solo/dired--git-status-face code)))
                (puthash fullpath status-face status-map))))

          (save-excursion
            (goto-char (point-min))
            (while (not (eobp))
              (let* ((file (ignore-errors (expand-file-name (dired-get-filename nil t)))))
                (when file
                  (setq file (if (file-directory-p file) (concat file "/") file))
                  (let* ((status-face (gethash file status-map (cons "  " 'font-lock-keyword-face)))
                         (status (car status-face))
                         (face (cdr status-face))
                         (status-str (propertize (format " %s " status) 'face face))
                         (ov (make-overlay (line-beginning-position) (1+ (line-beginning-position)))))
                    (overlay-put ov 'before-string status-str)
                    (push ov emacs-solo/dired-git-status-overlays))))
              (forward-line 1)))))))

  (add-hook 'dired-after-readin-hook #'emacs-solo/dired-git-status-overlay))


;; ------------------------------------------
;; EZ
;; -----------------------------------------
;; Packages
(use-package consult :ensure t :defer t)
(bind-key "C-s" 'consult-line)
(bind-key "M-." 'consult-buffer)
(bind-key* "C-\\" 'consult-ripgrep)


;; M-return for frame maximization toggle
(global-set-key (kbd "<M-return>") 'toggle-frame-fullscreen)
(bind-key "M-," 'find-file)

(bind-key* "M-q" 'save-buffers-kill-terminal)
(bind-key* "M-s" 'save-buffer)

;; buffers
(bind-key "M-[" 'previous-buffer)
(bind-key "M-]" 'next-buffer)
(bind-key "M-0" 'kill-current-buffer)

;; moving in files.
(bind-key "M-n" 'forward-paragraph)
(bind-key "M-p" 'backward-paragraph)

;; ORG MOVE
(bind-key "M-k" 'org-metaup)
(bind-key "M-j" 'org-metadown)
(bind-key "C-j" 'dired-jump)

;;(bind-key "C-c i" (lambda () (interactive) (find-file "~/gitrepos/ezmacs/init.el")))


(defun ez/tab-new ()
  "new tab and call scratch buffer"
  (interactive)
  (tab-new)
  (switch-to-buffer (get-buffer-create "*scratch*")))


(bind-key* "M-t" 'ez/tab-new)
(bind-key* "M-=" 'tab-next)
(bind-key* "M--" 'tab-previous)
(bind-key* "C-M--" 'tab-close)


(bind-key* "C-1" 'delete-other-windows)

(bind-key "C-2" (lambda ()
          (interactive)
          (split-window-below)
          (other-window 1)
          ))

(bind-key "C-3" (lambda ()
          (interactive)
          (split-window-right)
          (other-window 1)
          ))



;; GPTel Configuration
(use-package gptel
  :ensure t
  :config
  ;; Set API key directly (remove auth-sources)
  (setq gptel-api-key "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")  ; Replace with your actual API key

  ;; Set default model and available models
  (setq gptel-model "gpt-4o-mini")  ; Set GPT-4-0-mini as default
  (setq gptel-available-models
        '(("gpt-4o-mini" . "https://api.openai.com/v1/chat/completions")
          ("gpt-4.1-mini" . "https://api.openai.com/v1/chat/completions")
          ("gpt-4" . "https://api.openai.com/v1/chat/completions")
          ("gpt-3.5-turbo" . "https://api.openai.com/v1/chat/completions")))

  (setq gptel-default-mode 'org-mode)  ; responses in org-mode

  ;; Keybindings
  (global-set-key (kbd "C-x s") 'gptel-send)
  (global-set-key (kbd "C-c M-g") 'gptel))



;; reload init file
(defun reload-init-file ()
  (interactive)
  (load-file user-init-file))

;; abrir gptel en un frame
(defun ez/launch-gptel-frame ()
  "Launch gptel in a new frame and prepare it for questions."
  (interactive)
  (let* ((screen-width (display-pixel-width))
         (screen-height (display-pixel-height))
         (frame-width (/ screen-width 3))
         (frame-height screen-height)
         (frame-left (- screen-width frame-width))
         (frame-top 0)
         (chat-frame (make-frame `((top . ,frame-top)
                                   (left . ,frame-left)
                                   (width . (text-pixels . ,frame-width))
                                   (height . (text-pixels . ,frame-height))
                                   (minibuffer . t)))))
    (select-frame chat-frame)
    (add-hook 'gptel-post-response-hook (lambda () (goto-char (point-max))))
    (gptel "GPT Chat" gptel-api-key nil)
    (switch-to-buffer "GPT Chat")
    (delete-other-windows)))

(bind-key* "M-9" ' ez/launch-gptel-frame)

;; global keybindings
(global-set-key (kbd "C-c i")
                (lambda ()
                  (interactive)
                  (find-file "~/.emacs.d/init.el")))

(global-set-key (kbd "C-c n")
                (lambda ()
                  (interactive)
                  (find-file "/Users/juanmanuelferreradiaz/.emacs.d/my-org-files/mis_notas2.org")))


(global-set-key (kbd "C-c t") 'task-manager2-init)

(global-set-key (kbd "C-c f") 'download-facebook-video)

;; Optional: make the gptel buffer appear in a side window
(add-to-list 'display-buffer-alist
             '("\\*gptel-quick\\*"
               (display-buffer-in-side-window)
               (side . right)
               (window-width . 0.4)))


(global-set-key (kbd "C-c w") 'gptel-rewrite)
(global-set-key (kbd "C-x s") 'gptel-send)

;; hook to load abbrev mode
(add-hook 'text-mode-hook 'abbrev-mode)

;; less stutter in scrolling
(customize-set-variable 'scroll-conservatively 101)
(customize-set-variable 'scroll-margin 0)



;; khoj 1

(use-package khoj
  :after org
  :straight (khoj :type git :host github :repo "khoj-ai/khoj"
                  :files (:defaults "src/interface/emacs/khoj.el"))
  :bind ("C-c r" . khoj)
  :config
  (setq khoj-api-key "kk-rjc30lRKdXmyG-8VsKrCw6-KQ7riTXv6EKbeod4oTlg"
        khoj-server-url "https://app.khoj.dev"
        khoj-org-directories '("/Users/juanmanuelferreradiaz/.emacs.d/my-org-files"
                               "/Users/juanmanuelferreradiaz/.emacs.d/my-org-files/denote")
        khoj-org-files '("/Users/juanmanuelferreradiaz/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/my-gtd/tasks.org")))


;; download youtube video
(defun download-youtube-video (url)
  "Download a YouTube video from the given URL using yt-dlp, forcing mp4 format."
  (interactive "sEnter YouTube URL: ")
  (if (string-empty-p url)
      (message "URL cannot be empty.")
    (let ((default-directory "/Users/juanmanuelferreradiaz/Downloads/videos_youtube/"))  ; Adjust as needed
      (start-process "yt-dlp" "*yt-dlp-output*" "yt-dlp" "-f" "mp4" url))))


;; download Facebook video
(defun download-facebook-video (url)
  "Download a Facebook video from the given URL using yt-dlp."
  (interactive "sEnter Facebook video URL: ")
  (let ((output-file (concat "~/Downloads/videos_facebook/" (file-name-nondirectory url) ".mp4")))
    (start-process "yt-dlp" "*yt-dlp-output*" "yt-dlp" "-o" output-file url)
    (message "Downloading video to %s..." output-file)))

;; Enable global-tab-line-mode
(global-tab-line-mode 1)

;; Function to close all tabs except the current one
(defun close-other-tabs ()
  "Close all tabs/buffers except the current one."
  (interactive)
  (let ((current-buffer (current-buffer)))
    (dolist (buffer (buffer-list))
      (unless (or (eq buffer current-buffer)
                  (string-prefix-p " " (buffer-name buffer))
                  (string-prefix-p "*" (buffer-name buffer)))
        (kill-buffer buffer)))
    (message "Closed all other tabs")))

;; Keybindings for tab management
(global-set-key (kbd "C-x k") 'kill-current-buffer)        ; Close current tab
(global-set-key (kbd "C-x C-k") 'kill-buffer)             ; Close tab with prompt
(global-set-key (kbd "C-x C-b k") 'close-other-tabs)      ; Close all except current
(global-set-key (kbd "s-w") 'kill-current-buffer)         ; Cmd + w on Mac

(bind-key* "M-<right>" 'tab-line-switch-to-next-tab)
(bind-key* "M-<left>"  'tab-line-switch-to-prev-tab)


;; Option 1: C-c i (i for init)

;; abrir init.el
;; (global-set-key (kbd "C-c i")
;;                 (lambda ()
;;                   (interactive)
;;                   (find-file "~/.emacs.d/init.el")))

;; Rest of your existing tab-line configuration...
(setq tab-line-tabs-function 'tab-line-tabs-window-buffers)
(setq tab-line-close-button-show t)
(setq tab-line-close-button
      (propertize " ⨂ " 'face '(:foreground "gray50")))
(setq tab-line-separator (propertize " | " 'face '(:foreground "gray60")))



(setq newsticker-url-list
      '(("Stack Overflow - Emacs" "https://stackoverflow.com/feeds/tag?tagnames=emacs&sort=newest" nil nil nil)
        ("Arch Linux News" "https://www.archlinux.org/feeds/news/" nil nil nil)))

;; Enable desktop save mode
(desktop-save-mode 1)

;; Save tabs and buffers
(setq desktop-restore-frames t)
(setq desktop-restore-eager t)
(setq desktop-save t)

;; Set the directory to save the desktop file
(setq desktop-dirname "~/.emacs.d/.desktop/")
(setq desktop-path (list desktop-dirname))

;; Create desktop save directory if it doesn't exist
(unless (file-exists-p desktop-dirname)
  (make-directory desktop-dirname t))

;; Save without asking
(setq desktop-save 'if-exists)

;; teclado español para #
;; Fix Spanish keyboard hash key
(global-set-key (kbd "M-3") "#")  ; Alt + 3
;; Alternative if needed
(global-set-key (kbd "M-S-3") "#")  ; Alt + Shift + 3

;; Save more buffer-local variables
(add-to-list 'desktop-locals-to-save 'buffer-display-time)
(add-to-list 'desktop-locals-to-save 'tab-line-format)

;; Save tab-line state
(defun my-desktop-save-hook ()
  "Save tab-line state when saving desktop."
  (setq desktop-saved-tab-state
        (mapcar (lambda (buffer)
                 (with-current-buffer buffer
                   (when (buffer-file-name)
                     (cons (buffer-file-name) tab-line-format))))
               (buffer-list))))

(defun my-desktop-restore-hook ()
  "Restore tab-line state when loading desktop."
  (when (boundp 'desktop-saved-tab-state)
    (dolist (state desktop-saved-tab-state)
      (when (car state)
        (with-current-buffer (find-file-noselect (car state))
          (setq tab-line-format (cdr state)))))))

;; Add our hooks
(add-hook 'desktop-save-hook #'my-desktop-save-hook)
(add-hook 'desktop-after-read-hook #'my-desktop-restore-hook)

;; Auto-save desktop periodically
(run-with-idle-timer 300 t #'desktop-save-in-desktop-dir)


(provide 'init)
;;; init.el ends here
(put 'downcase-region 'disabled nil)
