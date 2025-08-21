;; Initialize the package system (this is typically done once)
(package-initialize)

;; Add MELPA to the package archives
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(unless package-archive-contents
  (package-refresh-contents))

;; autoloaded, but requiring the package management functions package just in case
(require 'package)

(require 'nerd-icons)

;move to trash
(setq-default delete-by-moving-to-trash t)

;disable the startup screen
;(setq inhibit-startup-screen t)

;setting height and width of startup frame size
;(add-to-list 'default-frame-alist '(height . 25))
;(add-to-list 'default-frame-alist '(width . 80))

;change below to 0 to hide menu and tool bar
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(fringe-mode 0)

;; (setq display-line-numbers-type 'visual)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;; Main theme defined by custom-set-faces
;; This will apply to everything EXCEPT where we override it for the terminal.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background "black" :foreground "gainsboro" :weight regular :height 120 :width normal :family "JetBrains Mono" :foundry "JB" :slant normal))))
 '(Info-quoted ((t (:foreground "sky blue" :weight light :family "Cascadia Code"))))
 '(ac-candidate-face ((t (:background "darkgray" :foreground "black"))))
 '(ac-completion-face ((t (:foreground "DodgerBlue" :underline t))))
 '(column-enforce-face ((t (:background "goldenrod1" :foreground "black"))))
 '(comint-highlight-input ((t (:slant italic))))
 '(comint-highlight-prompt ((((min-colors 88) (background dark)) (:foreground "CornflowerBlue"))))
 '(company-echo-common ((t (:inherit flx-highlight-face))))
 '(company-preview ((t (:background "SteelBlue" :foreground "azure"))))
 '(company-preview-common ((t (:inherit company-preview :foreground "cyan"))))
 '(company-scrollbar-bg ((t (:background "gray80"))) t)
 '(company-tooltip ((t (:background "Grey18"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :foreground "white" :weight bold))))
 '(company-tooltip-scrollbar-track ((t (:background "gray80"))))
 '(company-tooltip-selection ((default (:inherit company-tooltip)) (((class color) (min-colors 88)) (:background "royal blue"))))
 '(completions-common-part ((t (:inherit default :foreground "LimeGreen"))))
 '(completions-first-difference ((t (:foreground "LawnGreen"))))
 '(copilot-overlay-face ((t (:inherit combobulate-refactor-cursor-face))))
 '(creole-heading-level-1 ((t (:foreground "LawnGreen"))))
 '(csv-separator-face ((((class color)) (:foreground "LawnGreen"))))
 '(cursor ((t (:background "red"))))
 '(dictionary-button-face ((t (:inherit font-lock-keyword-face :weight bold))))
 '(dictionary-reference-face ((t (:inherit font-lock-doc-face))))
 '(dictionary-word-definition-face ((t (:inherit variable-pitch))))
 '(dictionary-word-entry-face ((t (:slant oblique :height 1.2))))
 '(diff-added ((t (:foreground "Lawngreen"))))
 '(diff-changed ((nil (:foreground "DeepSkyBlue"))))
 '(diff-context ((((class color grayscale) (min-colors 88)) nil)))
 '(diff-file-header ((((class color) (min-colors 88) (background dark)) (:foreground "Gold" :weight bold))))
 '(diff-header ((((class color) (min-colors 88) (background dark)) (:foreground "LightGoldenrod"))))
 '(diff-refine-change ((((class color) (min-colors 88) (background dark)) (:background "gray10"))) t)
 '(diff-refine-changed ((((class color) (min-colors 88) (background dark)) (:background "gray10"))))
 '(diff-removed ((t (:foreground "OrangeRed"))))
 '(edebug-enabled-breakpoint ((t (:background "red" :foreground "antiquewhite"))))
 '(ediff-even-diff-A ((t (:background "grey20"))))
 '(ediff-even-diff-B ((t (:background "Gray25"))))
 '(ediff-even-diff-C ((t (:background "grey20"))))
 '(ediff-odd-diff-A ((t (:background "grey20"))))
 '(ediff-odd-diff-C ((t (:background "grey20"))))
 '(eglot-highlight-symbol-face ((t (:background "DodgerBlue4" :foreground "DodgerBlue1"))))
 '(eldoc-highlight-function-argument ((t (:foreground "coral" :weight bold))))
 '(erc-default-face ((t nil)))
 '(erc-input-face ((t (:foreground "Orange" :family "Consolas"))))
 '(erc-my-nick-face ((t (:foreground "Orangered" :weight bold))))
 '(erc-notice-face ((t (:foreground "dim gray" :weight normal))))
 '(erc-prompt-face ((t (:background "Blue" :foreground "white" :weight bold))))
 '(fixed-pitch ((t nil)))
 '(flx-highlight-face ((t (:foreground "lawn green" :underline t :weight bold))))
 '(flycheck-error ((t (:inherit flymake-errline :underline nil))))
 '(flycheck-info ((t (:underline nil))))
 '(flycheck-posframe-background-face ((t (:background "gray10"))))
 '(flycheck-warning ((t (:inherit flymake-warnline :underline nil))))
 '(flymake-errline ((((class color) (background dark)) (:background "firebrick"))) t)
 '(flymake-error ((((class color) (background dark)) (:background "firebrick"))))
 '(flymake-infoline ((t (:background "black"))))
 '(flymake-warning ((((class color) (background dark)) (:background "MidnightBlue"))))
 '(flymake-warnline ((((class color) (background dark)) (:background "MidnightBlue"))) t)
 '(flyspell-incorrect ((t (:inherit error :underline (:color foreground-color :style wave)))))
 '(font-lock-builtin-face ((((class color) (min-colors 88) (background dark)) (:foreground "cadetblue"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "LawnGreen"))))
 '(font-lock-comment-face ((t (:foreground "LawnGreen"))))
 '(font-lock-constant-face ((((class color) (min-colors 88) (background dark)) (:foreground "DeepSkyBlue"))))
 '(font-lock-doc-face ((t (:foreground "orange"))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "SlateGray"))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "SlateBlue"))))
 '(font-lock-negation-char-face ((t (:foreground "#F9EE98"))))
 '(font-lock-punctuation-face ((t (:foreground "SteelBlue"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "NavajoWhite1"))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "AntiqueWhite1"))))
 '(font-lock-string-face ((t (:foreground "OrangeRed"))))
 '(font-lock-type-face ((((class color) (min-colors 88) (background dark)) (:foreground "CadetBlue"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "SkyBlue2"))))
 '(font-lock-warning-face ((((class color) (min-colors 88) (background dark)) (:foreground "orangered" :weight bold))))
 '(gnus-button ((t (:foreground "salmon" :weight bold))))
 '(gnus-cite-1 ((t (:foreground "deep sky blue"))))
 '(gnus-cite-2 ((t (:foreground "deep sky blue"))))
 '(gnus-cite-3 ((t (:foreground "gold1"))))
 '(gnus-cite-4 ((t (:foreground "chartreuse1"))))
 '(gnus-cite-5 ((t (:foreground "turquoise1"))))
 '(helm-candidate-number ((t (:background "dark orchid" :foreground "black"))))
 '(helm-grep-match ((t (:inherit match))))
 '(helm-rg-file-match-face ((t (:inherit xref-line-number))))
 '(helm-rg-title-face ((t (:background "black"))))
 '(helm-selection ((t (:background "steel blue"))))
 '(helm-separator ((t (:foreground "red"))))
 '(highlight ((((class color) (min-colors 88) (background dark)) (:background "DarkBlue"))))
 '(highlight-defined-builtin-function-name-face ((t nil)))
 '(highlight-defined-function-name-face ((t (:foreground "gray80"))))
 '(holiday ((((class color) (background dark)) (:background "blueviolet"))))
 '(icomplete-first-match ((t (:foreground "orangered" :weight bold))))
 '(ido-only-match ((((class color)) (:foreground "SpringGreen1"))))
 '(ido-subdir ((((min-colors 88) (class color)) (:foreground "DeepSkyBlue"))))
 '(info-title-4 ((t (:inherit Consolas :weight bold))))
 '(jabber-activity-personal-face ((t (:foreground "green"))))
 '(jabber-chat-prompt-foreign ((t (:foreground "orangered"))))
 '(jabber-chat-prompt-local ((t (:foreground "deep sky blue"))))
 '(jabber-chat-prompt-system ((t (:foreground "limegreen"))))
 '(jabber-rare-time-face ((t (:foreground "limegreen" :underline t))))
 '(jabber-roster-user-away ((t (:foreground "limegreen"))))
 '(jabber-roster-user-chatty ((t (:foreground "dark orange"))))
 '(jabber-roster-user-online ((t (:foreground "skyblue"))))
 '(link ((((class color) (min-colors 88) (background dark)) (:foreground "SkyBlue" :underline t))))
 '(log-view-file ((t (:foreground "cornsilk" :weight bold))))
 '(log-view-message ((t (:foreground "SteelBlue" :weight bold))))
 '(lsp-face-highlight-read ((t (:inherit highlight))))
 '(magit-item-highlight ((t (:background "darkblue"))))
 '(magit-log-head-label-remote ((t (:background "Grey10" :foreground "OliveDrab3" :box 1))))
 '(magit-section-heading ((t (:background "RoyalBlue4"))))
 '(makefile-shell ((t nil)))
 '(mc/cursor-face ((t (:background "seagreen1" :foreground "black"))))
 '(message-cited-text-1 ((t (:inherit gnus-cite-1))))
 '(message-cited-text-2 ((t (:inherit gnus-cite-3))))
 '(message-cited-text-3 ((t (:inherit gnus-cite-4))))
 '(message-cited-text-4 ((t (:inherit gnus-cite-5))))
 '(message-header-name ((t (:foreground "lime green"))))
 '(message-header-other ((((class color) (background dark)) (:foreground "OrangeRed"))))
 '(message-header-subject ((t (:foreground "skyblue" :weight bold))))
 '(minibuffer-prompt ((((background dark)) (:foreground "DarkSlateGray2"))))
 '(mm-uu-extract ((t (:extend t :background "gray10"))))
 '(mode-line ((((class color) (min-colors 88)) (:background "RoyalBlue4" :foreground "azure1" :box (:line-width -1 :color "Royalblue1" :style released-button)))))
 '(mu4e-header-highlight-face ((t (:extend t :background "dodgerblue4" :foreground "Lavenderblush1" :box (:line-width (1 . 1) :color "dodgerblue" :style flat-button)))))
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode2 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode3 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode4 ((((class color) (min-colors 88) (background dark)) nil)))
 '(org-column ((t (:inherit default :background "gray14" :height 143 :family "Consolas"))))
 '(org-date ((((class color) (background dark)) (:foreground "Cornflowerblue" :underline t))))
 '(org-level-1 ((((class color) (min-colors 88) (background dark)) (:foreground "yellow"))))
 '(org-level-2 ((((class color) (min-colors 16) (background dark)) (:foreground "LightGoldenrod"))))
 '(org-level-3 ((((class color) (min-colors 88) (background dark)) (:foreground "chocolate1"))))
 '(org-level-4 ((((class color) (min-colors 88) (background dark)) (:foreground "IndianRed"))))
 '(org-level-5 ((((class color) (min-colors 16) (background dark)) (:foreground "DarkSalmon"))))
 '(org-level-6 ((((class color) (min-colors 16) (background dark)) (:foreground "OrangeRed"))))
 '(org-level-7 ((t (:foreground "chocolate"))))
 '(org-level-8 ((t (:foreground "sienna"))))
 '(org-link ((((class color) (background dark)) (:foreground "DodgerBlue" :underline t))))
 '(org-property-value ((t (:foreground "honeydew1"))))
 '(org-special-keyword ((((class color) (min-colors 16) (background dark)) (:foreground "GreenYellow"))))
 '(org-tag ((t (:background "Darkred" :foreground "FLoralWhite" :weight bold))))
 '(org-todo ((t (:foreground "Steelblue" :weight bold))))
 '(popup-tip-face ((t (:background "gray30"))))
 '(rngalt-validation-header-bottom ((t (:background "gray20"))))
 '(rngalt-validation-header-top ((t (:background "gray20"))))
 '(rst-level-1-face ((t (:foreground "orange"))) t)
 '(rst-level-2-face ((t (:background "black"))) t)
 '(rst-level-3-face ((t (:foreground "OliveDrab1" :background "black"))) t)
 '(rst-level-4-face ((t (:foreground "DarkOliveGreen1" :background "black"))) t)
 '(rst-level-5-face ((t (:foreground "khaki1" :background "black"))) t)
 '(rst-level-6-face ((t (:foreground "LightGoldenrod1" :background "black"))) t)
 '(show-paren-match ((((class color) (background dark)) (:background "RoyalBlue"))))
 '(shr-h1 ((t (:weight bold :height 1.5))))
 '(shr-h2 ((t (:weight bold :height 1.3))))
 '(shr-h3 ((t (:slant italic :height 1.2))))
 '(tab-bar ((t (:inherit font-lock-keyword-face :background "gray20" :foreground "snow4"))))
 '(tab-bar-tab ((t (:inherit tab-bar :foreground "firebrick3" :box (:line-width (1 . 1) :style released-button)))))
 '(tab-bar-tab-group-current ((t (:inherit tab-bar-tab :box nil :weight bold))))
 '(tab-bar-tab-group-inactive ((t (:inherit (shadow tab-bar-tab-inactive) :foreground "SlateBlue"))))
 '(tab-bar-tab-inactive ((t (:inherit tab-bar-tab :background "gray20" :foreground "snow4"))))
 '(table-cell ((t (:background "blue1" :foreground "gray90"))))
 '(tempel-default ((t (:background "darkcyan" :foreground "#a8e5e5" :slant italic))))
 '(tempel-form ((t (:background "darkgreen" :foreground "#b8e2b8"))))
 '(tempo-snippets-editable-face ((((background dark)) (:background "steel blue" :foreground "white"))))
 '(term-color-blue ((t (:background "Steelblue" :foreground "SteelBLue"))))
 '(term-color-cyan ((t (:background "skyblue" :foreground "skyblue"))))
 '(term-color-green ((t (:background "yellowgreen" :foreground "yellowgreen"))))
 '(term-color-magenta ((t (:background "orchid" :foreground "orchid"))))
 '(term-color-red ((t (:background "indianred" :foreground "indianred"))))
 '(term-color-yellow ((t (:background "khaki" :foreground "khaki"))))
 '(tide-hl-identifier-face ((t (:inherit secondary-selection))))
 '(tooltip ((t (:background "grey20" :foreground "grey90"))))
 '(transient-key-exit ((t (:inherit transient-key))))
 '(transient-key-stay ((t (:inherit transient-key))))
 '(tree-sitter-hl-face:function.call ((t (:inherit font-lock-function-name-face :underline nil))))
 '(tree-sitter-hl-face:method.call ((t (:inherit font-lock-function-name-face))))
 '(variable-pitch ((t nil)))
 '(visible-mark-active ((t (:underline "limegreen"))))
 '(visible-mark-face ((((class color) (background dark)) (:underline "lawngreen"))))
 '(visible-mark-non-trailing-face0 ((t (:underline "lawngreen"))) t)
 '(web-mode-css-variable-face ((t (:inherit font-lock-builtin-face :slant italic))))
 '(web-mode-current-element-highlight-face ((t (:background "gray20"))))
 '(which-func ((t (:foreground "yellow"))))
 '(woman-bold ((((background dark)) (:weight bold)))))

;; We copy the color variables from cyberpunk theme so we don't need to install it.
;; ---------------------------------------------------------------------------
(defvar cyberpunk-fg "#dcdccc" "Cyberpunk foreground color.")
(defvar cyberpunk-bg "#000000" "Cyberpunk background color.")
(defvar cyberpunk-bg-1 "#2b2b2b" "Cyberpunk background color variant 1.")
(defvar cyberpunk-red "#ff0000" "Cyberpunk red color.")
(defvar cyberpunk-red-2 "#8b0000" "Cyberpunk red color variant 2.")
(defvar cyberpunk-red-4 "#8c5353" "Cyberpunk red color variant 4.")
(defvar cyberpunk-green "#00ff00" "Cyberpunk green color.")
(defvar cyberpunk-green+2 "#9fc59f" "Cyberpunk green color variant +2.")
(defvar cyberpunk-orange "#ffa500" "Cyberpunk orange color.")
(defvar cyberpunk-yellow "#ffff00" "Cyberpunk yellow color.")
(defvar cyberpunk-blue "#0000ff" "Cyberpunk blue color.")
(defvar cyberpunk-blue-1 "#7b68ee" "Cyberpunk blue color variant 1.")
(defvar cyberpunk-blue-4 "#b2dfee" "Cyberpunk blue color variant 4.")
(defvar cyberpunk-magenta "#dc8cc3" "Cyberpunk magenta color.")
(defvar cyberpunk-cyan "#93e0e3" "Cyberpunk cyan color.")

;; This function will be run by a "hook" every time you open a terminal.
;; ---------------------------------------------------------------------
(defun my-term-mode-cyberpunk-colors ()
  "Set buffer-local faces for term-mode to cyberpunk colors."
  ;; Set the main terminal foreground and background
  (set-face-attribute 'term nil :foreground cyberpunk-fg :background cyberpunk-bg)

  ;; Set the 16 ANSI colors used by terminal applications
  (set-face-attribute 'term-color-black nil :foreground cyberpunk-bg :background cyberpunk-bg-1)
  (set-face-attribute 'term-color-red nil :foreground cyberpunk-red-2 :background cyberpunk-red-4)
  (set-face-attribute 'term-color-green nil :foreground cyberpunk-green :background cyberpunk-green+2)
  (set-face-attribute 'term-color-yellow nil :foreground cyberpunk-orange :background cyberpunk-yellow)
  (set-face-attribute 'term-color-blue nil :foreground cyberpunk-blue-1 :background cyberpunk-blue-4)
  (set-face-attribute 'term-color-magenta nil :foreground cyberpunk-magenta :background cyberpunk-red)
  (set-face-attribute 'term-color-cyan nil :foreground cyberpunk-cyan :background cyberpunk-blue)
  (set-face-attribute 'term-color-white nil :foreground cyberpunk-fg :background cyberpunk-bg-1)
  )

;; This line tells Emacs to run our function whenever `term-mode` is started.
;; ---------------------------------------------------------------------------
(add-hook 'term-mode-hook #'my-term-mode-cyberpunk-colors)

;;default font
;(set-face-attribute 'default nil :font "Cascadia Code-12")

;;disable the error sound
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; Translate C-h to DEL
;(keyboard-translate ?\C-h ?\C-?)
;; Define M-h to help  ---  please don't add an extra ' after help!
;(global-set-key "\M-h" 'help)

;setting single escape key instead of thrice
;(global-set-key (kbd "<escape>")      'keyboard-escape-quit)

; dired
(global-set-key (kbd "C-x C-j") 'dired-jump)

;indeting 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Configure C/C++ modes (and others using c-mode-common-hook) for 4-space indent
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-basic-offset 4)
            (setq indent-tabs-mode nil))) ; Ensure spaces for CC Mode derived modes

;enabling count for search
(setq isearch-lazy-count t)

; considering whitespace everything between search terms(not for regex search)
; for example "bg green" is going equivalent to "bg.*?green"
(setq search-whitespace-regexp ".*?")

; to type "y" or "n" instead of "yes" or "no"
(defalias 'yes-or-no-p 'y-or-n-p)

(put 'upcase-region 'disabled nil)

;; delete the region when typing, just like as we expect nowadays.
(delete-selection-mode t)

;; Enable global visual line mode
(global-visual-line-mode t)

;disable backup
(setq make-backup-files nil)
;disable auto save
(setq auto-save-default nil)
;disable lock files
(setq create-lockfiles nil)
;; Keep all backup and auto-save files in one directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;(setq ediff-split-window-function 'split-window-horizontally)
;(split-window-horizontally)

;; (global-hl-line-mode 0)
;; (set-face-background 'hl-line "midnight blue")

; Smooth scroll
(setq scroll-step 3)

; Stop Emacs from losing undo information by
; setting very high limits for undo buffers
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

;(add-hook 'js2-mode-hook 'skewer-mode)
;(add-hook 'css-mode-hook 'skewer-css-mode)
;(add-hook 'html-mode-hook 'skewer-html-mode)

(require 'multiple-cursors)
;add a cursor to each line
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;add cursor based on keywords(mark the word and add more cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

; C-j to insert new line in multiple-cursor mode, and C-g or <return> to quit.

(global-auto-revert-mode 1)

(add-hook 'html-mode-hook
          (lambda ()
            (setq sgml-basic-offset 4)))

;; goto-chg installed
;(global-set-key (kbd "C-M-,") 'goto-last-change)

(global-set-key (kbd "C-c a") 'rectangle-number-lines)
(global-set-key (kbd "C-c r") 'reverse-region)

;; Function to run async shell commands silently with completion
(defun my-inhibit-async-window (buffer &optional _)
  "Prevent BUFFER from being displayed in a window."
  'inhibit-window)

(defun my-silent-async-shell-command (command)
  "Run COMMAND asynchronously without displaying its buffer.
Supports filename completion for commands."
  (interactive
   (list
    (let ((initial-input ""))
      ;; Use read-shell-command which supports completion
      (read-shell-command "Async Shell command: " initial-input))))

  (let ((display-buffer-alist
         (cons '("\\*Async Shell Command\\*" (my-inhibit-async-window))
               display-buffer-alist)))
    (async-shell-command command)))

(global-set-key (kbd "C-c s") 'my-silent-async-shell-command)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MSSQL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. Load SQL support
(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sql . t))))

;; 2. Use `sqlcmd` for SQL blocks
(setq org-babel-sql-command "sqlcmd")

;; 3. Default header args
(setq org-babel-default-header-args:sql
      '((:engine . "mssql")
        (:cmdline . "-S localhost -U sa -P Mengineering18 -C")
        (:results . "output replace")))

;; (setq org-babel-default-header-args:sql
;;       '((:engine . "mssql")
;;         (:cmdline . "-S localhost -U sa -P Mengineering18 -C")
;;         (:results . "raw replace")))

;; 4. No confirmation prompts
(setq org-confirm-babel-evaluate nil)

;; 5. Auto-start mssql-server (fixed signature)
(defun my/org-babel-start-mssql-server (&rest _args)
  "Ensure the `mssql-server` service is active before running SQL blocks."
  (unless (string= (string-trim
                    (shell-command-to-string
                     "systemctl is-active mssql-server"))
                   "active")
    (message "Starting mssql-server…")
    (shell-command "sudo systemctl start mssql-server")))

(advice-add 'org-babel-execute:sql :before #'my/org-babel-start-mssql-server)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; MSSQL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C/C++ code runner
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add this global variable at the top of your code
(defvar my-last-compiled-executable nil
  "Stores the path of the last compiled executable.")

;; --- Helper function to run the executable after successful compilation ---
(defun my-run-executable-after-compile (buffer status-string executable-to-run)
  "Check compilation status and run EXECUTABLE-TO-RUN if successful.
This function is intended to be used with `compilation-finish-functions'."
  (with-current-buffer buffer ; Operate within the *compilation* buffer context
    (let ((compilation-successful
           ;; Check if status is "finished" and there are no obvious error markers
           ;; Updated to handle GCC/G++ error messages
           (and (string-match-p (regexp-quote "finished") status-string)
                (save-excursion
                  (goto-char (point-min))
                  ;; Search for common GCC/G++ error patterns.
                  ;; 'error:' (lowercase) is common.
                  ;; Also check for 'undefined reference to' for linker errors.
                  ;; And common translated error terms.
                  (not (or (search-forward-regexp "error:" nil t)
                           (search-forward-regexp "エラー:" nil t) ; Japanese
                           (search-forward-regexp "errore:" nil t) ; Italian
                           (search-forward-regexp "erreur:" nil t) ; French
                           (search-forward-regexp "fehler:" nil t) ; German
                           (search-forward-regexp "ошибка:" nil t) ; Russian
                           (search-forward-regexp "błąd:" nil t)   ; Polish
                           (search-forward-regexp "undefined reference to" nil t)))))))

      (if compilation-successful
          (progn
            (goto-char (point-max)) ;; Move to the end of the buffer before inserting
            (insert (format "\nCompilation successful. Running %s ...\n" executable-to-run))
            (message "Running %s ..." executable-to-run)
            ;; Start the process. Output will go to the current buffer (*compilation*).
            ;; For GUI apps, they will just launch. Console output will appear here.
            (let ((process-name (file-name-nondirectory executable-to-run)))
              (start-process (concat "run-" process-name) ; Unique process name
                             (current-buffer) ; Output to the *compilation* buffer
                             executable-to-run))) ; The command (the executable path)
        (progn
          (goto-char (point-max)) ;; Move to the end of the buffer before inserting
          (insert (format "\nCompilation failed or had errors. Not running %s.\n" executable-to-run))
          (message "Compilation failed or had errors for %s." executable-to-run))))))

;; --- Base function to create compilation command for C/C++ files ---
(defun my-create-compile-command ()
  "Create a compilation command for the current C/C++ file using GCC/G++.
Returns a list with executable file path and compile command."
  (unless (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode) (eq major-mode 'c-or-c++-mode))
    (error "This command is intended for C/C++ mode buffers"))
  (when buffer-file-name
    (let* ((source-file (buffer-file-name))
           (base-name (file-name-sans-extension source-file))
           ;; Linux executables usually don't have an extension
           (executable-file base-name)
           ;; Get file extension and check explicitly
           (file-ext (file-name-extension source-file))
           (is-cpp (and file-ext
                        (member (downcase file-ext)
                                '("cpp" "cxx" "cc" "c++" "hpp" "hxx" "h++"))))
           (compiler (if is-cpp "g++" "gcc"))
           ;; GCC/G++ flags: -g for debug, -Wall for all warnings, -Wextra for more warnings
           ;; -std=c++11 or -std=c11 for specific language standards. Adjust as needed.
           (compile-flags (if is-cpp
                              "-g -Wall -Wextra -std=c++11"
                            "-g -Wall -Wextra -std=c11"))
           ;; Add any specific libraries you need to link with -l option
           ;; For example, for the math library: "-lm"
           (link-libraries "") ; Example: "-lm -lpthread"
           (compile-command (format "%s %s -o \"%s\" \"%s\" %s"
                                    compiler
                                    compile-flags
                                    executable-file
                                    source-file
                                    link-libraries)))
      (list executable-file compile-command))))

;; --- Function to only compile C/C++ files ---
(defun my-compile-only-linux ()
  "Compile the current C/C++ file using GCC/G++ without running it."
  (interactive)
  (let ((result (my-create-compile-command)))
    (when result
      (let ((executable-file (car result))
            (compile-command (cadr result)))
        ;; Store the executable path in our global variable
        (setq my-last-compiled-executable executable-file)

        ;; Clear any compilation finish functions for compile-only
        (setq compilation-finish-functions nil)

        (message "Compiling only: %s" compile-command)
        (compile compile-command)))))

;; --- Function to compile and run C/C++ files ---
(defun my-compile-and-run-linux ()
  "Compile the current C/C++ file using GCC/G++ and run it if successful."
  (interactive)
  (let ((result (my-create-compile-command)))
    (when result
      (let ((executable-file (car result))
            (compile-command (cadr result)))
        ;; Store the executable path in our global variable
        (setq my-last-compiled-executable executable-file)

        ;; Set the finish function to use our handler
        (setq compilation-finish-functions
              (list (lambda (buffer status)
                      (my-compilation-finish-handler buffer status))))

        (message "Compiling and will run if successful: %s" compile-command)
        (compile compile-command)))))

;; --- Hook for both c-mode and c++-mode ---
(defun my-c-cpp-mode-hook-setup ()
  "Custom setup for both c-mode and c++-mode on Linux."
  (local-set-key (kbd "C-c C-b") 'my-compile-only-linux)   ;; Compile only
  (local-set-key (kbd "C-c C-c") 'my-compile-and-run-linux)) ;; Compile and run

(add-hook 'c-mode-hook 'my-c-cpp-mode-hook-setup)
(add-hook 'c++-mode-hook 'my-c-cpp-mode-hook-setup)
;; Consider adding for combined modes if you use them:
;; (add-hook 'c-or-c++-mode-hook 'my-c-cpp-mode-hook-setup)

;; --- Handler function for compilation finish ---
(defun my-compilation-finish-handler (buffer status)
  "Handle compilation finish by running the executable if compilation was successful.
Uses the globally stored `my-last-compiled-executable`."
  (when my-last-compiled-executable
    (my-run-executable-after-compile buffer status my-last-compiled-executable)))

;; --- Configuration for *compilation* buffer display ---
;; This part of your configuration for displaying the *compilation* buffer
;; is generally portable and should work fine on Linux.
(defun my-custom-display-compilation-on-right (buffer _alist)
  "Display BUFFER in a window to the right, creating one if necessary."
  (let ((display-buffer-reuse-frames t)
        (target-window nil))
    (if (one-window-p t)
        (setq target-window (split-window-right))
      (setq target-window (next-window (selected-window) nil t)))
    (unless target-window
      (setq target-window (split-window-right)))
    (select-window target-window)
    (set-window-buffer target-window buffer)
    target-window))

(eval-after-load 'window
  '(progn
     (add-to-list 'display-buffer-alist
                  '("\\*compilation\\*"
                    (my-custom-display-compilation-on-right)))))

(message "Custom C/C++ compilation for Linux (gcc/g++) loaded.")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C/C++ code runner
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Java code runner
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Java Compilation and Execution Setup for Emacs
(let ((java-home (or (getenv "JAVA_HOME")
                    "/opt/java/jdk-21.0.6"))) ; Default path, modify if needed
  (when (file-directory-p java-home)
    (setenv "PATH" (concat (getenv "PATH") ":"
                          java-home "/bin"))
    (setq exec-path (append exec-path (list (concat java-home "/bin"))))))

;; Add global variables
(defvar my-last-compiled-java-class nil
  "Stores the class name of the last compiled Java file.")

(defvar my-last-compiled-java-dir nil
  "Stores the directory of the last compiled Java file.")

;; --- Helper function for running Java classes after compilation ---
(defun my-run-java-after-compile (buffer status-string class-name dir-path)
  "Check compilation status and run Java CLASS-NAME if successful.
DIR-PATH is the directory containing the compiled class file."
  (with-current-buffer buffer ; Operate within the *compilation* buffer context
    (let ((compilation-successful
           ;; Check if status is "finished" and there are no obvious error markers
           (and (string-match-p (regexp-quote "finished") status-string)
                (save-excursion
                  (goto-char (point-min))
                  ;; Java-specific error messages
                  (not (or (search-forward-regexp "error:" nil t)
                           (search-forward-regexp "[0-9]+ errors" nil t)))))))

      (if compilation-successful
          (progn
            (goto-char (point-max)) ;; Move to the end of the buffer before inserting
            (insert (format "\nCompilation successful. Running java %s ...\n" class-name))
            (message "Running java %s ..." class-name)
            ;; Start the Java process with the proper working directory
            (let ((default-directory dir-path)) ; Set the working directory for the process
              (start-process (concat "run-java-" class-name) ; Process name
                             (current-buffer) ; Output to compilation buffer
                             "java" class-name))) ; Command: java ClassName
        (progn
          (goto-char (point-max)) ;; Move to the end of the buffer before inserting
          (insert (format "\nCompilation failed or had errors. Not running java %s.\n" class-name))
          (message "Compilation failed or had errors for java %s." class-name))))))

;; --- Base function to create compilation command for Java files ---
(defun my-create-java-compile-command ()
  "Create a compilation command for the current Java file.
Returns a list with (class-name directory compile-command)."
  (unless (eq major-mode 'java-mode)
    (error "This command is intended for Java mode buffers"))
  (when buffer-file-name
    (let* ((source-file (buffer-file-name))
           (file-name (file-name-nondirectory source-file))
           (class-name (file-name-sans-extension file-name))
           (dir-path (file-name-directory source-file))
           ;; Basic javac command - can be customized with additional options as needed
           (compile-command (format "javac \"%s\"" source-file)))
      (list class-name dir-path compile-command))))

;; --- Function to only compile Java files ---
(defun my-compile-java-only ()
  "Compile the current Java file using javac without running it."
  (interactive)
  (let ((result (my-create-java-compile-command)))
    (when result
      (let ((class-name (nth 0 result))
            (dir-path (nth 1 result))
            (compile-command (nth 2 result)))
        ;; Store the class name and directory in our global variables
        (setq my-last-compiled-java-class class-name)
        (setq my-last-compiled-java-dir dir-path)

        ;; Clear any compilation finish functions for compile-only
        (setq compilation-finish-functions nil)

        (message "Compiling Java only: %s" compile-command)
        (compile compile-command)))))

;; --- Function to compile and run Java files ---
(defun my-compile-and-run-java ()
  "Compile the current Java file using javac and run it if successful."
  (interactive)
  (let ((result (my-create-java-compile-command)))
    (when result
      (let ((class-name (nth 0 result))
            (dir-path (nth 1 result))
            (compile-command (nth 2 result)))
        ;; Store the class name and directory in our global variables
        (setq my-last-compiled-java-class class-name)
        (setq my-last-compiled-java-dir dir-path)

        ;; Set the finish function to use our Java handler
        (setq compilation-finish-functions
              (list (lambda (buffer status)
                      (my-java-compilation-finish-handler buffer status))))

        (message "Compiling Java and will run if successful: %s" compile-command)
        (compile compile-command)))))

;; --- Handler function for Java compilation finish ---
(defun my-java-compilation-finish-handler (buffer status)
  "Handle Java compilation finish by running the class if compilation was successful.
Uses the globally stored `my-last-compiled-java-class` and `my-last-compiled-java-dir`."
  (when (and my-last-compiled-java-class my-last-compiled-java-dir)
    (my-run-java-after-compile buffer status my-last-compiled-java-class my-last-compiled-java-dir)))

;; --- Hook for java-mode ---
(defun my-java-mode-hook-setup ()
  "Custom setup for java-mode."
  (local-set-key (kbd "C-c C-b") 'my-compile-java-only)     ;; Compile only
  (local-set-key (kbd "C-c C-c") 'my-compile-and-run-java)) ;; Compile and run

(add-hook 'java-mode-hook 'my-java-mode-hook-setup)

;; Control how error navigation positions the error in the window
;; nil = don't recenter
;; 0 = center the error line in the window
;; A negative number = position error that many lines from the bottom
;; A positive number = position error that many lines from the top
(setq next-error-recenter nil)  ;; Don't recenter - keep cursor position only

;; Make sure compilation mode doesn't force the error to the top
(defun my-compilation-mode-hook ()
  "Customizations for compilation mode."
  (setq-local scroll-conservatively 1000)  ;; Smoother scrolling
  (setq-local scroll-margin 0))           ;; Don't add automatic vertical margins

(add-hook 'compilation-mode-hook 'my-compilation-mode-hook)

;; --- Configuration for *compilation* buffer display (same as your C/C++ setup) ---
(defun my-custom-display-compilation-on-right (buffer _alist)
  "Display BUFFER in a window to the right, creating one if necessary."
  (let ((display-buffer-reuse-frames t)
        (target-window nil))
    (if (one-window-p t)
        (setq target-window (split-window-right))
      (setq target-window (next-window (selected-window) nil t)))
    (unless target-window
      (setq target-window (split-window-right)))
    (select-window target-window)
    (set-window-buffer target-window buffer)
    target-window))

;; Only add this if you don't already have it from your C/C++ config
;; If both configs are loaded, this would add a duplicate entry
(eval-after-load 'window
  '(progn
     (unless (assoc "\\*compilation\\*" display-buffer-alist)
       (add-to-list 'display-buffer-alist
                    '("\\*compilation\\*"
                      (my-custom-display-compilation-on-right))))))

(message "Custom Java compilation setup loaded.")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Java code runner
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JS code runner
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO: not compilation
;; 1. Ensure NODE_HOME in PATH
(let ((node-home (or (getenv "NODE_HOME")
                     "/home/murshid/.nvm/versions/node/v22.13.1")))  ; adjust if you install elsewhere
  (when (file-directory-p node-home)
    (setenv "PATH" (concat (getenv "PATH") ":" node-home "/bin"))
    (add-to-list 'exec-path (concat node-home "/bin"))))

;; 2. Command builder for Node
(defun my-create-node-run-cmd ()
  "Return the shell command to run the current JS file with node."
  (unless (eq major-mode 'js-mode)
    (error "This command is intended for js-mode buffers"))
  (unless buffer-file-name
    (error "Buffer not visiting a file"))
  (format "node \"%s\"" buffer-file-name))

;; 3. Run current JS file
(defun my-node-run ()
  "Run the current JS file with node in a compilation buffer."
  (interactive)
  (let ((cmd (my-create-node-run-cmd)))
    (message "Running: %s" cmd)
    ;; Clear any hooks, then launch via compile
    (setq compilation-finish-functions nil)
    (compile cmd)))

;; 4. Hook into js-mode
(defun my-js-mode-keys ()
  "Bind my Node runner in js-mode."
  (local-set-key (kbd "C-c C-c") #'my-node-run))

(add-hook 'js-mode-hook #'my-js-mode-keys)

(message "Custom Node.js run setup loaded.")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JS code runner
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ruby code runner
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO: not compilation
;; 1. Ensure RUBY_HOME in your PATH
(let ((ruby-home (or (getenv "RUBY_HOME")
                     "/usr")))   ; adjust if needed
  (when (file-directory-p ruby-home)
    (setenv "PATH" (concat (getenv "PATH") ":" ruby-home "/bin"))
    (add-to-list 'exec-path (concat ruby-home "/bin"))))

;; 2. Build the `ruby` invocation command
(defun my-create-ruby-run-cmd ()
  "Return the shell command to run the current Ruby file."
  (unless (eq major-mode 'ruby-mode)
    (error "This command is only for `ruby-mode` buffers"))
  (unless buffer-file-name
    (error "Buffer is not visiting a file"))
  (format "ruby \"%s\"" buffer-file-name))

;; 3. Run the current Ruby file in a *compilation* buffer
(defun my-ruby-run ()
  "Run the current Ruby file with `ruby`."
  (interactive)
  (let ((cmd (my-create-ruby-run-cmd)))
    ;; Clear any finish hooks
    (setq compilation-finish-functions nil)
    (message "Running: %s" cmd)
    (compile cmd)))

;; 4. Hook it into ruby-mode
(defun my-ruby-mode-keys ()
  "Bind `my-ruby-run` to `C-c C-c` in `ruby-mode`."
  (local-set-key (kbd "C-c C-c") #'my-ruby-run))

(add-hook 'ruby-mode-hook #'my-ruby-mode-keys)

(message "Custom Ruby run setup loaded.")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ruby code runner
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'goto-chg)
(global-set-key (kbd "C-M-,") 'goto-last-change)

; for disabling title bar
; (add-to-list 'default-frame-alist '(undecorated . t))

(setq dired-create-destination-dirs 'always)
(setq dired-create-destination-dirs-on-trailing-dirsep t)
