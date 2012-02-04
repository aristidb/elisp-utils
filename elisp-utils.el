;; Just a few simple emacs lisp utility functions.

(require 'cl)

(defun add-exec-paths (paths)
  (let ((expanded (mapcar 'expand-file-name paths)))
    (setenv "PATH" (concat (mapconcat 'identity expanded ":") ":" (getenv "PATH")))
    (setq exec-path (append expanded exec-path))))

(defun find-and-set-font (candidates)
  (let ((font (find-if (lambda (f) (find-font (font-spec :name f))) candidates)))
    (set-face-attribute 'default nil :font font)))

(provide 'elisp-utils)
