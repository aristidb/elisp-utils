;;; elisp-utils.el --- Just a few simple emacs lisp utility functions


;;; Commentary:
;; This is intended to be included early in your .emacs, and used for utility purposes.

(require 'cl)

;;; Code:

(defun add-exec-paths (paths)
  "Add list of paths (PATHS) to $PATH environment variable and Emacs' `exec-path' variable (to the front)."
  (let ((expanded (mapcar 'expand-file-name paths)))
    (setenv "PATH" (concat (mapconcat 'identity expanded ":") ":" (getenv "PATH")))
    (setq exec-path (append expanded exec-path))))

(defun find-and-set-font (candidates)
  "Find valid font in CANDIDATES and set it as the default font face."
  (let ((font (find-if (lambda (f) (find-font (font-spec :name f))) candidates)))
    (when font (set-face-attribute 'default nil :font font))))

(provide 'elisp-utils)

;;; elisp-utils.el ends here
