(require 'package)

;; Add MELPA to the package archives
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Initialize the package system (this is typically done once)
(package-initialize)
                                        ;
;move to trash
(setq-default delete-by-moving-to-trash t)

;disable the startup screen
;(setq inhibit-startup-screen t)

;setting height and width of startup frame size
;(add-to-list 'default-frame-alist '(height . 25))
;(add-to-list 'default-frame-alist '(width . 80))

;change below to 0 to hide menu and tool bar
;(tool-bar-mode 0)
;(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(fringe-mode 0)

;; (setq display-line-numbers-type 'visual)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;;default font
;(set-face-attribute 'default nil :font "DejaVu Sans Mono for Powerline-12")
;(set-face-attribute 'default nil :font "JetBrains Mono-12")
;(set-face-attribute 'default nil :font "Code New Roman-12")
;(set-face-attribute 'default nil :font "Iosevka-12")
;(set-face-attribute 'default nil :font "Consolas-12")

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

; enabling count for search
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
 '(package-selected-packages
   '(ob-sql ob-sql-mode monokai-pro-theme goto-chg multiple-cursors exec-path-from-shell js2-mode))
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

(exec-path-from-shell-initialize)

; used exec-path-from-shell for node not found issue
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(exec-path-from-shell-copy-env "NVM_DIR")

; removing C-c C-c shortcut of C/C++ and java files for running the code
(defun my-unbind-c-c-c ()
  "Unbind `C-c C-c` in C, C++, and Java modes to use for running code."
  (local-unset-key (kbd "C-c C-c")))

(add-hook 'c-mode-hook #'my-unbind-c-c-c)
(add-hook 'c++-mode-hook #'my-unbind-c-c-c)
(add-hook 'java-mode-hook #'my-unbind-c-c-c)

(defun run-js-region-display-output ()
  "Run the selected JavaScript region, or the whole buffer if no region is selected,
   and display output in a right-side buffer if open."
  (interactive)
  (let* ((script (if (use-region-p)  ;; Check if a region is selected
                     (buffer-substring-no-properties (region-beginning) (region-end))
                   (buffer-string)))  ;; If no region, use the entire buffer
         (temp-file (make-temp-file "emacs-js-" nil ".js"))
         (output-buffer (get-buffer-create "*JS Output*")))
    ;; Write JavaScript code to a temp file
    (with-temp-file temp-file
      (insert script))
    ;; Run Node.js and capture output
    (let ((output (shell-command-to-string (format "node %s" temp-file))))
      (with-current-buffer output-buffer
        (erase-buffer) ;; Clear previous output
        (insert output)
        (goto-char (point-max)))
      (display-buffer-in-side-window output-buffer '((side . right))))
    (delete-file temp-file)))

(defun run-c-region-display-output ()
  "Compile and run the selected C code, or the whole file if no region is selected,
   using `gcc` to generate an object file and execute it."
  (interactive)
  (let* ((is-region (use-region-p))
         (c-file (buffer-file-name))
         (output-buffer (get-buffer-create "*C Output*"))
         (exec-file (concat (file-name-sans-extension c-file) ""))) ;; Remove .c and use the same name

    (if (not c-file)
        (message "Buffer is not associated with a file.")
      ;; If running full file, compile and execute normally
      (if (not is-region)
          (let ((compile-result (shell-command-to-string (format "gcc %s -o %s 2>&1" c-file exec-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" exec-file))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
        ;; If a region is selected, create a temporary file and run it
        (let* ((temp-file (make-temp-file "emacs-c-" nil ".c"))
               (temp-exec (make-temp-file "emacs-c-bin-" nil "")))
          (with-temp-file temp-file
            (insert script))
          (let ((compile-result (shell-command-to-string (format "gcc %s -o %s 2>&1" temp-file temp-exec))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" temp-exec))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
          (delete-file temp-file)
          (delete-file temp-exec))))

    (display-buffer-in-side-window output-buffer '((side . right)))))

(defun run-cpp-region-display-output ()
  "Compile and run the selected C++ code, or the whole file if no region is selected,
   using g++ to generate an object file and execute it."
  (interactive)
  (let* ((is-region (use-region-p))
         (cpp-file (buffer-file-name))
         (output-buffer (get-buffer-create "*C++ Output*"))
         (exec-file (concat (file-name-sans-extension cpp-file) ""))) ;; Remove .cpp and use the same name

    (if (not cpp-file)
        (message "Buffer is not associated with a file.")
      ;; If running full file, compile and execute normally
      (if (not is-region)
          (let ((compile-result (shell-command-to-string (format "g++ %s -o %s 2>&1" cpp-file exec-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" exec-file))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
        ;; If a region is selected, create a temporary file and run it
        (let* ((temp-file (make-temp-file "emacs-cpp-" nil ".cpp"))
               (temp-exec (make-temp-file "emacs-cpp-bin-" nil "")))
          (with-temp-file temp-file
            (insert script))
          (let ((compile-result (shell-command-to-string (format "g++ %s -o %s 2>&1" temp-file temp-exec))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" temp-exec))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
          (delete-file temp-file)
          (delete-file temp-exec))))

    (display-buffer-in-side-window output-buffer '((side . right)))))

(defun run-java-region-display-output ()
  "Compile and run the Java file using `javac` and then execute the generated .class file.
If a region is selected, wraps the code inside a temporary `TempJavaClass` with a `main` method."
  (interactive)
  (let* ((is-region (use-region-p))
         (script (if is-region
                     (buffer-substring-no-properties (region-beginning) (region-end))
                   (buffer-string)))
         (java-file (buffer-file-name))
         (class-name (file-name-base java-file))
         (output-buffer (get-buffer-create "*Java Output*")))

    (if (not java-file)
        (message "Buffer is not associated with a file.")
      ;; If running full file, compile and execute normally
      (if (not is-region)
          (let ((compile-result (shell-command-to-string (format "javac %s 2>&1" java-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "java %s 2>&1" class-name))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
        ;; If a region is selected, create a temporary class and run it
        (let* ((temp-class "TempJavaClass")
               (temp-file (concat temp-class ".java")))
          (with-temp-file temp-file
            (insert "public class " temp-class " {\n")
            (insert "public static void main(String[] args) {\n")
            (insert script "\n}\n}"))
          (let ((compile-result (shell-command-to-string (format "javac %s 2>&1" temp-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "java %s 2>&1" temp-class))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
          (delete-file temp-file)
          (delete-file (concat temp-class ".class")))))

    (display-buffer-in-side-window output-buffer '((side . right)))))

(defun run-code-region ()
  "Run the selected code based on file extension."
  (interactive)
  (let ((file-ext (file-name-extension (or (buffer-file-name) ""))))
    (cond
     ((string= file-ext "js")  (run-js-region-display-output))
     ((string= file-ext "c")   (run-c-region-display-output))
     ((string= file-ext "cpp") (run-cpp-region-display-output))
     ((string= file-ext "java") (run-java-region-display-output))
     (t (message "Unsupported file type: %s" file-ext)))))

(global-set-key (kbd "C-c C-c") 'run-code-region)

(global-auto-revert-mode 1)

(add-hook 'html-mode-hook
          (lambda ()
            (setq sgml-basic-offset 4)))

;; goto-chg installed
(global-set-key (kbd "C-M-,") 'goto-last-change)

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
        (:results . "raw replace")))

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

;; also added (require 'package)

;; Add MELPA to the package archives
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Initialize the package system (this is typically done once)
(package-initialize)
                                        ;
;move to trash
(setq-default delete-by-moving-to-trash t)

;disable the startup screen
;(setq inhibit-startup-screen t)

;setting height and width of startup frame size
;(add-to-list 'default-frame-alist '(height . 25))
;(add-to-list 'default-frame-alist '(width . 80))

;change below to 0 to hide menu and tool bar
;(tool-bar-mode 0)
;(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(fringe-mode 0)

;; (setq display-line-numbers-type 'visual)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;;default font
;(set-face-attribute 'default nil :font "DejaVu Sans Mono for Powerline-12")
;(set-face-attribute 'default nil :font "JetBrains Mono-12")
;(set-face-attribute 'default nil :font "Code New Roman-12")
;(set-face-attribute 'default nil :font "Iosevka-12")
;(set-face-attribute 'default nil :font "Consolas-12")

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

; enabling count for search
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
 '(package-selected-packages
   '(ob-sql ob-sql-mode monokai-pro-theme goto-chg multiple-cursors exec-path-from-shell js2-mode))
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

(exec-path-from-shell-initialize)

; used exec-path-from-shell for node not found issue
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(exec-path-from-shell-copy-env "NVM_DIR")

; removing C-c C-c shortcut of C/C++ and java files for running the code
(defun my-unbind-c-c-c ()
  "Unbind `C-c C-c` in C, C++, and Java modes to use for running code."
  (local-unset-key (kbd "C-c C-c")))

(add-hook 'c-mode-hook #'my-unbind-c-c-c)
(add-hook 'c++-mode-hook #'my-unbind-c-c-c)
(add-hook 'java-mode-hook #'my-unbind-c-c-c)

(defun run-js-region-display-output ()
  "Run the selected JavaScript region, or the whole buffer if no region is selected,
   and display output in a right-side buffer if open."
  (interactive)
  (let* ((script (if (use-region-p)  ;; Check if a region is selected
                     (buffer-substring-no-properties (region-beginning) (region-end))
                   (buffer-string)))  ;; If no region, use the entire buffer
         (temp-file (make-temp-file "emacs-js-" nil ".js"))
         (output-buffer (get-buffer-create "*JS Output*")))
    ;; Write JavaScript code to a temp file
    (with-temp-file temp-file
      (insert script))
    ;; Run Node.js and capture output
    (let ((output (shell-command-to-string (format "node %s" temp-file))))
      (with-current-buffer output-buffer
        (erase-buffer) ;; Clear previous output
        (insert output)
        (goto-char (point-max)))
      (display-buffer-in-side-window output-buffer '((side . right))))
    (delete-file temp-file)))

(defun run-c-region-display-output ()
  "Compile and run the selected C code, or the whole file if no region is selected,
   using `gcc` to generate an object file and execute it."
  (interactive)
  (let* ((is-region (use-region-p))
         (c-file (buffer-file-name))
         (output-buffer (get-buffer-create "*C Output*"))
         (exec-file (concat (file-name-sans-extension c-file) ""))) ;; Remove .c and use the same name

    (if (not c-file)
        (message "Buffer is not associated with a file.")
      ;; If running full file, compile and execute normally
      (if (not is-region)
          (let ((compile-result (shell-command-to-string (format "gcc %s -o %s 2>&1" c-file exec-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" exec-file))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
        ;; If a region is selected, create a temporary file and run it
        (let* ((temp-file (make-temp-file "emacs-c-" nil ".c"))
               (temp-exec (make-temp-file "emacs-c-bin-" nil "")))
          (with-temp-file temp-file
            (insert script))
          (let ((compile-result (shell-command-to-string (format "gcc %s -o %s 2>&1" temp-file temp-exec))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" temp-exec))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
          (delete-file temp-file)
          (delete-file temp-exec))))

    (display-buffer-in-side-window output-buffer '((side . right)))))

(defun run-cpp-region-display-output ()
  "Compile and run the selected C++ code, or the whole file if no region is selected,
   using g++ to generate an object file and execute it."
  (interactive)
  (let* ((is-region (use-region-p))
         (cpp-file (buffer-file-name))
         (output-buffer (get-buffer-create "*C++ Output*"))
         (exec-file (concat (file-name-sans-extension cpp-file) ""))) ;; Remove .cpp and use the same name

    (if (not cpp-file)
        (message "Buffer is not associated with a file.")
      ;; If running full file, compile and execute normally
      (if (not is-region)
          (let ((compile-result (shell-command-to-string (format "g++ %s -o %s 2>&1" cpp-file exec-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" exec-file))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
        ;; If a region is selected, create a temporary file and run it
        (let* ((temp-file (make-temp-file "emacs-cpp-" nil ".cpp"))
               (temp-exec (make-temp-file "emacs-cpp-bin-" nil "")))
          (with-temp-file temp-file
            (insert script))
          (let ((compile-result (shell-command-to-string (format "g++ %s -o %s 2>&1" temp-file temp-exec))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" temp-exec))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
          (delete-file temp-file)
          (delete-file temp-exec))))

    (display-buffer-in-side-window output-buffer '((side . right)))))

(defun run-java-region-display-output ()
  "Compile and run the Java file using `javac` and then execute the generated .class file.
If a region is selected, wraps the code inside a temporary `TempJavaClass` with a `main` method."
  (interactive)
  (let* ((is-region (use-region-p))
         (script (if is-region
                     (buffer-substring-no-properties (region-beginning) (region-end))
                   (buffer-string)))
         (java-file (buffer-file-name))
         (class-name (file-name-base java-file))
         (output-buffer (get-buffer-create "*Java Output*")))

    (if (not java-file)
        (message "Buffer is not associated with a file.")
      ;; If running full file, compile and execute normally
      (if (not is-region)
          (let ((compile-result (shell-command-to-string (format "javac %s 2>&1" java-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "java %s 2>&1" class-name))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
        ;; If a region is selected, create a temporary class and run it
        (let* ((temp-class "TempJavaClass")
               (temp-file (concat temp-class ".java")))
          (with-temp-file temp-file
            (insert "public class " temp-class " {\n")
            (insert "public static void main(String[] args) {\n")
            (insert script "\n}\n}"))
          (let ((compile-result (shell-command-to-string (format "javac %s 2>&1" temp-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "java %s 2>&1" temp-class))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
          (delete-file temp-file)
          (delete-file (concat temp-class ".class")))))

    (display-buffer-in-side-window output-buffer '((side . right)))))

(defun run-code-region ()
  "Run the selected code based on file extension."
  (interactive)
  (let ((file-ext (file-name-extension (or (buffer-file-name) ""))))
    (cond
     ((string= file-ext "js")  (run-js-region-display-output))
     ((string= file-ext "c")   (run-c-region-display-output))
     ((string= file-ext "cpp") (run-cpp-region-display-output))
     ((string= file-ext "java") (run-java-region-display-output))
     (t (message "Unsupported file type: %s" file-ext)))))

(global-set-key (kbd "C-c C-c") 'run-code-region)

(global-auto-revert-mode 1)

(add-hook 'html-mode-hook
          (lambda ()
            (setq sgml-basic-offset 4)))

;; goto-chg installed
(global-set-key (kbd "C-M-,") 'goto-last-change)

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
        (:results . "raw replace")))

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
(require 'package)

;; Add MELPA to the package archives
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Initialize the package system (this is typically done once)
(package-initialize)
                                        ;
;move to trash
(setq-default delete-by-moving-to-trash t)

;disable the startup screen
;(setq inhibit-startup-screen t)

;setting height and width of startup frame size
;(add-to-list 'default-frame-alist '(height . 25))
;(add-to-list 'default-frame-alist '(width . 80))

;change below to 0 to hide menu and tool bar
;(tool-bar-mode 0)
;(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(fringe-mode 0)

;; (setq display-line-numbers-type 'visual)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;;default font
;(set-face-attribute 'default nil :font "DejaVu Sans Mono for Powerline-12")
;(set-face-attribute 'default nil :font "JetBrains Mono-12")
;(set-face-attribute 'default nil :font "Code New Roman-12")
;(set-face-attribute 'default nil :font "Iosevka-12")
;(set-face-attribute 'default nil :font "Consolas-12")

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

; enabling count for search
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
 '(package-selected-packages
   '(ob-sql ob-sql-mode monokai-pro-theme goto-chg multiple-cursors exec-path-from-shell js2-mode))
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

(exec-path-from-shell-initialize)

; used exec-path-from-shell for node not found issue
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(exec-path-from-shell-copy-env "NVM_DIR")

; removing C-c C-c shortcut of C/C++ and java files for running the code
(defun my-unbind-c-c-c ()
  "Unbind `C-c C-c` in C, C++, and Java modes to use for running code."
  (local-unset-key (kbd "C-c C-c")))

(add-hook 'c-mode-hook #'my-unbind-c-c-c)
(add-hook 'c++-mode-hook #'my-unbind-c-c-c)
(add-hook 'java-mode-hook #'my-unbind-c-c-c)

(defun run-js-region-display-output ()
  "Run the selected JavaScript region, or the whole buffer if no region is selected,
   and display output in a right-side buffer if open."
  (interactive)
  (let* ((script (if (use-region-p)  ;; Check if a region is selected
                     (buffer-substring-no-properties (region-beginning) (region-end))
                   (buffer-string)))  ;; If no region, use the entire buffer
         (temp-file (make-temp-file "emacs-js-" nil ".js"))
         (output-buffer (get-buffer-create "*JS Output*")))
    ;; Write JavaScript code to a temp file
    (with-temp-file temp-file
      (insert script))
    ;; Run Node.js and capture output
    (let ((output (shell-command-to-string (format "node %s" temp-file))))
      (with-current-buffer output-buffer
        (erase-buffer) ;; Clear previous output
        (insert output)
        (goto-char (point-max)))
      (display-buffer-in-side-window output-buffer '((side . right))))
    (delete-file temp-file)))

(defun run-c-region-display-output ()
  "Compile and run the selected C code, or the whole file if no region is selected,
   using `gcc` to generate an object file and execute it."
  (interactive)
  (let* ((is-region (use-region-p))
         (c-file (buffer-file-name))
         (output-buffer (get-buffer-create "*C Output*"))
         (exec-file (concat (file-name-sans-extension c-file) ""))) ;; Remove .c and use the same name

    (if (not c-file)
        (message "Buffer is not associated with a file.")
      ;; If running full file, compile and execute normally
      (if (not is-region)
          (let ((compile-result (shell-command-to-string (format "gcc %s -o %s 2>&1" c-file exec-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" exec-file))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
        ;; If a region is selected, create a temporary file and run it
        (let* ((temp-file (make-temp-file "emacs-c-" nil ".c"))
               (temp-exec (make-temp-file "emacs-c-bin-" nil "")))
          (with-temp-file temp-file
            (insert script))
          (let ((compile-result (shell-command-to-string (format "gcc %s -o %s 2>&1" temp-file temp-exec))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" temp-exec))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
          (delete-file temp-file)
          (delete-file temp-exec))))

    (display-buffer-in-side-window output-buffer '((side . right)))))

(defun run-cpp-region-display-output ()
  "Compile and run the selected C++ code, or the whole file if no region is selected,
   using g++ to generate an object file and execute it."
  (interactive)
  (let* ((is-region (use-region-p))
         (cpp-file (buffer-file-name))
         (output-buffer (get-buffer-create "*C++ Output*"))
         (exec-file (concat (file-name-sans-extension cpp-file) ""))) ;; Remove .cpp and use the same name

    (if (not cpp-file)
        (message "Buffer is not associated with a file.")
      ;; If running full file, compile and execute normally
      (if (not is-region)
          (let ((compile-result (shell-command-to-string (format "g++ %s -o %s 2>&1" cpp-file exec-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" exec-file))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
        ;; If a region is selected, create a temporary file and run it
        (let* ((temp-file (make-temp-file "emacs-cpp-" nil ".cpp"))
               (temp-exec (make-temp-file "emacs-cpp-bin-" nil "")))
          (with-temp-file temp-file
            (insert script))
          (let ((compile-result (shell-command-to-string (format "g++ %s -o %s 2>&1" temp-file temp-exec))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" temp-exec))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
          (delete-file temp-file)
          (delete-file temp-exec))))

    (display-buffer-in-side-window output-buffer '((side . right)))))

(defun run-java-region-display-output ()
  "Compile and run the Java file using `javac` and then execute the generated .class file.
If a region is selected, wraps the code inside a temporary `TempJavaClass` with a `main` method."
  (interactive)
  (let* ((is-region (use-region-p))
         (script (if is-region
                     (buffer-substring-no-properties (region-beginning) (region-end))
                   (buffer-string)))
         (java-file (buffer-file-name))
         (class-name (file-name-base java-file))
         (output-buffer (get-buffer-create "*Java Output*")))

    (if (not java-file)
        (message "Buffer is not associated with a file.")
      ;; If running full file, compile and execute normally
      (if (not is-region)
          (let ((compile-result (shell-command-to-string (format "javac %s 2>&1" java-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "java %s 2>&1" class-name))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
        ;; If a region is selected, create a temporary class and run it
        (let* ((temp-class "TempJavaClass")
               (temp-file (concat temp-class ".java")))
          (with-temp-file temp-file
            (insert "public class " temp-class " {\n")
            (insert "public static void main(String[] args) {\n")
            (insert script "\n}\n}"))
          (let ((compile-result (shell-command-to-string (format "javac %s 2>&1" temp-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "java %s 2>&1" temp-class))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
          (delete-file temp-file)
          (delete-file (concat temp-class ".class")))))

    (display-buffer-in-side-window output-buffer '((side . right)))))

(defun run-code-region ()
  "Run the selected code based on file extension."
  (interactive)
  (let ((file-ext (file-name-extension (or (buffer-file-name) ""))))
    (cond
     ((string= file-ext "js")  (run-js-region-display-output))
     ((string= file-ext "c")   (run-c-region-display-output))
     ((string= file-ext "cpp") (run-cpp-region-display-output))
     ((string= file-ext "java") (run-java-region-display-output))
     (t (message "Unsupported file type: %s" file-ext)))))

(global-set-key (kbd "C-c C-c") 'run-code-region)

(global-auto-revert-mode 1)

(add-hook 'html-mode-hook
          (lambda ()
            (setq sgml-basic-offset 4)))

;; goto-chg installed
(global-set-key (kbd "C-M-,") 'goto-last-change)

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
        (:results . "raw replace")))

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
(require 'package)

;; Add MELPA to the package archives
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Initialize the package system (this is typically done once)
(package-initialize)
                                        ;
;move to trash
(setq-default delete-by-moving-to-trash t)

;disable the startup screen
;(setq inhibit-startup-screen t)

;setting height and width of startup frame size
;(add-to-list 'default-frame-alist '(height . 25))
;(add-to-list 'default-frame-alist '(width . 80))

;change below to 0 to hide menu and tool bar
;(tool-bar-mode 0)
;(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(fringe-mode 0)

;; (setq display-line-numbers-type 'visual)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;;default font
;(set-face-attribute 'default nil :font "DejaVu Sans Mono for Powerline-12")
;(set-face-attribute 'default nil :font "JetBrains Mono-12")
;(set-face-attribute 'default nil :font "Code New Roman-12")
;(set-face-attribute 'default nil :font "Iosevka-12")
;(set-face-attribute 'default nil :font "Consolas-12")

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

; enabling count for search
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
 '(package-selected-packages
   '(ob-sql ob-sql-mode monokai-pro-theme goto-chg multiple-cursors exec-path-from-shell js2-mode))
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

(exec-path-from-shell-initialize)

; used exec-path-from-shell for node not found issue
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(exec-path-from-shell-copy-env "NVM_DIR")

; removing C-c C-c shortcut of C/C++ and java files for running the code
(defun my-unbind-c-c-c ()
  "Unbind `C-c C-c` in C, C++, and Java modes to use for running code."
  (local-unset-key (kbd "C-c C-c")))

(add-hook 'c-mode-hook #'my-unbind-c-c-c)
(add-hook 'c++-mode-hook #'my-unbind-c-c-c)
(add-hook 'java-mode-hook #'my-unbind-c-c-c)

(defun run-js-region-display-output ()
  "Run the selected JavaScript region, or the whole buffer if no region is selected,
   and display output in a right-side buffer if open."
  (interactive)
  (let* ((script (if (use-region-p)  ;; Check if a region is selected
                     (buffer-substring-no-properties (region-beginning) (region-end))
                   (buffer-string)))  ;; If no region, use the entire buffer
         (temp-file (make-temp-file "emacs-js-" nil ".js"))
         (output-buffer (get-buffer-create "*JS Output*")))
    ;; Write JavaScript code to a temp file
    (with-temp-file temp-file
      (insert script))
    ;; Run Node.js and capture output
    (let ((output (shell-command-to-string (format "node %s" temp-file))))
      (with-current-buffer output-buffer
        (erase-buffer) ;; Clear previous output
        (insert output)
        (goto-char (point-max)))
      (display-buffer-in-side-window output-buffer '((side . right))))
    (delete-file temp-file)))

(defun run-c-region-display-output ()
  "Compile and run the selected C code, or the whole file if no region is selected,
   using `gcc` to generate an object file and execute it."
  (interactive)
  (let* ((is-region (use-region-p))
         (c-file (buffer-file-name))
         (output-buffer (get-buffer-create "*C Output*"))
         (exec-file (concat (file-name-sans-extension c-file) ""))) ;; Remove .c and use the same name

    (if (not c-file)
        (message "Buffer is not associated with a file.")
      ;; If running full file, compile and execute normally
      (if (not is-region)
          (let ((compile-result (shell-command-to-string (format "gcc %s -o %s 2>&1" c-file exec-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" exec-file))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
        ;; If a region is selected, create a temporary file and run it
        (let* ((temp-file (make-temp-file "emacs-c-" nil ".c"))
               (temp-exec (make-temp-file "emacs-c-bin-" nil "")))
          (with-temp-file temp-file
            (insert script))
          (let ((compile-result (shell-command-to-string (format "gcc %s -o %s 2>&1" temp-file temp-exec))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" temp-exec))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
          (delete-file temp-file)
          (delete-file temp-exec))))

    (display-buffer-in-side-window output-buffer '((side . right)))))

(defun run-cpp-region-display-output ()
  "Compile and run the selected C++ code, or the whole file if no region is selected,
   using g++ to generate an object file and execute it."
  (interactive)
  (let* ((is-region (use-region-p))
         (cpp-file (buffer-file-name))
         (output-buffer (get-buffer-create "*C++ Output*"))
         (exec-file (concat (file-name-sans-extension cpp-file) ""))) ;; Remove .cpp and use the same name

    (if (not cpp-file)
        (message "Buffer is not associated with a file.")
      ;; If running full file, compile and execute normally
      (if (not is-region)
          (let ((compile-result (shell-command-to-string (format "g++ %s -o %s 2>&1" cpp-file exec-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" exec-file))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
        ;; If a region is selected, create a temporary file and run it
        (let* ((temp-file (make-temp-file "emacs-cpp-" nil ".cpp"))
               (temp-exec (make-temp-file "emacs-cpp-bin-" nil "")))
          (with-temp-file temp-file
            (insert script))
          (let ((compile-result (shell-command-to-string (format "g++ %s -o %s 2>&1" temp-file temp-exec))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" temp-exec))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
          (delete-file temp-file)
          (delete-file temp-exec))))

    (display-buffer-in-side-window output-buffer '((side . right)))))

(defun run-java-region-display-output ()
  "Compile and run the Java file using `javac` and then execute the generated .class file.
If a region is selected, wraps the code inside a temporary `TempJavaClass` with a `main` method."
  (interactive)
  (let* ((is-region (use-region-p))
         (script (if is-region
                     (buffer-substring-no-properties (region-beginning) (region-end))
                   (buffer-string)))
         (java-file (buffer-file-name))
         (class-name (file-name-base java-file))
         (output-buffer (get-buffer-create "*Java Output*")))

    (if (not java-file)
        (message "Buffer is not associated with a file.")
      ;; If running full file, compile and execute normally
      (if (not is-region)
          (let ((compile-result (shell-command-to-string (format "javac %s 2>&1" java-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "java %s 2>&1" class-name))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
        ;; If a region is selected, create a temporary class and run it
        (let* ((temp-class "TempJavaClass")
               (temp-file (concat temp-class ".java")))
          (with-temp-file temp-file
            (insert "public class " temp-class " {\n")
            (insert "public static void main(String[] args) {\n")
            (insert script "\n}\n}"))
          (let ((compile-result (shell-command-to-string (format "javac %s 2>&1" temp-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "java %s 2>&1" temp-class))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
          (delete-file temp-file)
          (delete-file (concat temp-class ".class")))))

    (display-buffer-in-side-window output-buffer '((side . right)))))

(defun run-code-region ()
  "Run the selected code based on file extension."
  (interactive)
  (let ((file-ext (file-name-extension (or (buffer-file-name) ""))))
    (cond
     ((string= file-ext "js")  (run-js-region-display-output))
     ((string= file-ext "c")   (run-c-region-display-output))
     ((string= file-ext "cpp") (run-cpp-region-display-output))
     ((string= file-ext "java") (run-java-region-display-output))
     (t (message "Unsupported file type: %s" file-ext)))))

(global-set-key (kbd "C-c C-c") 'run-code-region)

(global-auto-revert-mode 1)

(add-hook 'html-mode-hook
          (lambda ()
            (setq sgml-basic-offset 4)))

;; goto-chg installed
(global-set-key (kbd "C-M-,") 'goto-last-change)

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
        (:results . "raw replace")))

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
(require 'package)

;; Add MELPA to the package archives
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Initialize the package system (this is typically done once)
(package-initialize)
                                        ;
;move to trash
(setq-default delete-by-moving-to-trash t)

;disable the startup screen
;(setq inhibit-startup-screen t)

;setting height and width of startup frame size
;(add-to-list 'default-frame-alist '(height . 25))
;(add-to-list 'default-frame-alist '(width . 80))

;change below to 0 to hide menu and tool bar
;(tool-bar-mode 0)
;(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(fringe-mode 0)

;; (setq display-line-numbers-type 'visual)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;;default font
;(set-face-attribute 'default nil :font "DejaVu Sans Mono for Powerline-12")
;(set-face-attribute 'default nil :font "JetBrains Mono-12")
;(set-face-attribute 'default nil :font "Code New Roman-12")
;(set-face-attribute 'default nil :font "Iosevka-12")
;(set-face-attribute 'default nil :font "Consolas-12")

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

; enabling count for search
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
 '(package-selected-packages
   '(ob-sql ob-sql-mode monokai-pro-theme goto-chg multiple-cursors exec-path-from-shell js2-mode))
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

(exec-path-from-shell-initialize)

; used exec-path-from-shell for node not found issue
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(exec-path-from-shell-copy-env "NVM_DIR")

; removing C-c C-c shortcut of C/C++ and java files for running the code
(defun my-unbind-c-c-c ()
  "Unbind `C-c C-c` in C, C++, and Java modes to use for running code."
  (local-unset-key (kbd "C-c C-c")))

(add-hook 'c-mode-hook #'my-unbind-c-c-c)
(add-hook 'c++-mode-hook #'my-unbind-c-c-c)
(add-hook 'java-mode-hook #'my-unbind-c-c-c)

(defun run-js-region-display-output ()
  "Run the selected JavaScript region, or the whole buffer if no region is selected,
   and display output in a right-side buffer if open."
  (interactive)
  (let* ((script (if (use-region-p)  ;; Check if a region is selected
                     (buffer-substring-no-properties (region-beginning) (region-end))
                   (buffer-string)))  ;; If no region, use the entire buffer
         (temp-file (make-temp-file "emacs-js-" nil ".js"))
         (output-buffer (get-buffer-create "*JS Output*")))
    ;; Write JavaScript code to a temp file
    (with-temp-file temp-file
      (insert script))
    ;; Run Node.js and capture output
    (let ((output (shell-command-to-string (format "node %s" temp-file))))
      (with-current-buffer output-buffer
        (erase-buffer) ;; Clear previous output
        (insert output)
        (goto-char (point-max)))
      (display-buffer-in-side-window output-buffer '((side . right))))
    (delete-file temp-file)))

(defun run-c-region-display-output ()
  "Compile and run the selected C code, or the whole file if no region is selected,
   using `gcc` to generate an object file and execute it."
  (interactive)
  (let* ((is-region (use-region-p))
         (c-file (buffer-file-name))
         (output-buffer (get-buffer-create "*C Output*"))
         (exec-file (concat (file-name-sans-extension c-file) ""))) ;; Remove .c and use the same name

    (if (not c-file)
        (message "Buffer is not associated with a file.")
      ;; If running full file, compile and execute normally
      (if (not is-region)
          (let ((compile-result (shell-command-to-string (format "gcc %s -o %s 2>&1" c-file exec-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" exec-file))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
        ;; If a region is selected, create a temporary file and run it
        (let* ((temp-file (make-temp-file "emacs-c-" nil ".c"))
               (temp-exec (make-temp-file "emacs-c-bin-" nil "")))
          (with-temp-file temp-file
            (insert script))
          (let ((compile-result (shell-command-to-string (format "gcc %s -o %s 2>&1" temp-file temp-exec))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" temp-exec))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
          (delete-file temp-file)
          (delete-file temp-exec))))

    (display-buffer-in-side-window output-buffer '((side . right)))))

(defun run-cpp-region-display-output ()
  "Compile and run the selected C++ code, or the whole file if no region is selected,
   using g++ to generate an object file and execute it."
  (interactive)
  (let* ((is-region (use-region-p))
         (cpp-file (buffer-file-name))
         (output-buffer (get-buffer-create "*C++ Output*"))
         (exec-file (concat (file-name-sans-extension cpp-file) ""))) ;; Remove .cpp and use the same name

    (if (not cpp-file)
        (message "Buffer is not associated with a file.")
      ;; If running full file, compile and execute normally
      (if (not is-region)
          (let ((compile-result (shell-command-to-string (format "g++ %s -o %s 2>&1" cpp-file exec-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" exec-file))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
        ;; If a region is selected, create a temporary file and run it
        (let* ((temp-file (make-temp-file "emacs-cpp-" nil ".cpp"))
               (temp-exec (make-temp-file "emacs-cpp-bin-" nil "")))
          (with-temp-file temp-file
            (insert script))
          (let ((compile-result (shell-command-to-string (format "g++ %s -o %s 2>&1" temp-file temp-exec))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "%s 2>&1" temp-exec))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
          (delete-file temp-file)
          (delete-file temp-exec))))

    (display-buffer-in-side-window output-buffer '((side . right)))))

(defun run-java-region-display-output ()
  "Compile and run the Java file using `javac` and then execute the generated .class file.
If a region is selected, wraps the code inside a temporary `TempJavaClass` with a `main` method."
  (interactive)
  (let* ((is-region (use-region-p))
         (script (if is-region
                     (buffer-substring-no-properties (region-beginning) (region-end))
                   (buffer-string)))
         (java-file (buffer-file-name))
         (class-name (file-name-base java-file))
         (output-buffer (get-buffer-create "*Java Output*")))

    (if (not java-file)
        (message "Buffer is not associated with a file.")
      ;; If running full file, compile and execute normally
      (if (not is-region)
          (let ((compile-result (shell-command-to-string (format "javac %s 2>&1" java-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "java %s 2>&1" class-name))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
        ;; If a region is selected, create a temporary class and run it
        (let* ((temp-class "TempJavaClass")
               (temp-file (concat temp-class ".java")))
          (with-temp-file temp-file
            (insert "public class " temp-class " {\n")
            (insert "public static void main(String[] args) {\n")
            (insert script "\n}\n}"))
          (let ((compile-result (shell-command-to-string (format "javac %s 2>&1" temp-file))))
            (if (not (string= compile-result ""))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert "Compilation Error:\n" compile-result)
                  (goto-char (point-max)))
              (let ((output (shell-command-to-string (format "java %s 2>&1" temp-class))))
                (with-current-buffer output-buffer
                  (erase-buffer)
                  (insert output)
                  (goto-char (point-max))))))
          (delete-file temp-file)
          (delete-file (concat temp-class ".class")))))

    (display-buffer-in-side-window output-buffer '((side . right)))))

(defun run-code-region ()
  "Run the selected code based on file extension."
  (interactive)
  (let ((file-ext (file-name-extension (or (buffer-file-name) ""))))
    (cond
     ((string= file-ext "js")  (run-js-region-display-output))
     ((string= file-ext "c")   (run-c-region-display-output))
     ((string= file-ext "cpp") (run-cpp-region-display-output))
     ((string= file-ext "java") (run-java-region-display-output))
     (t (message "Unsupported file type: %s" file-ext)))))

(global-set-key (kbd "C-c C-c") 'run-code-region)

(global-auto-revert-mode 1)

(add-hook 'html-mode-hook
          (lambda ()
            (setq sgml-basic-offset 4)))

;; goto-chg installed
(global-set-key (kbd "C-M-,") 'goto-last-change)

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
        (:results . "raw replace")))

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

;; and also added 'murshid ALL=(root) NOPASSWD: /bin/systemctl start mssql-server' to 'sudo visudo -f /etc/sudoers.d/mssql-server' to not wanting a terminal to enter password for starting mssql server.

;; ob-sql-mode(along with sql-mode, and org-mode but those are pre-installed) is needed.
