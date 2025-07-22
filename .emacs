;; autoloaded, but requiring the package management functions package just in case
(require 'package)

;; Add MELPA to the package archives
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Initialize the package system (this is typically done once)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

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

;;default font
(set-face-attribute 'default nil :font "JetBrains Mono-12")

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi))
 '(custom-safe-themes
   '("fb83a50c80de36f23aea5919e50e1bccd565ca5bb646af95729dc8c5f926cbf3" "c8b83e7692e77f3e2e46c08177b673da6e41b307805cd1982da9e2ea2e90e6d7" "b02eae4d22362a941751f690032ea30c7c78d8ca8a1212fdae9eecad28a3587f" "b6269b0356ed8d9ed55b0dcea10b4e13227b89fd2af4452eee19ac88297b0f99" "e3a1b1fb50e3908e80514de38acbac74be2eb2777fc896e44b54ce44308e5330" "65057902bcd51d84e0e28036f4759295e08f57b1ba94b9ae10a8d5ffde5f154f" default))
 '(font-use-system-font t)
 '(package-selected-packages '(goto-chg ob-sql ob-sql-mode multiple-cursors js2-mode))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrains Mono NL" :foundry "JB" :slant normal :weight regular :height 120 :width normal)))))

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
