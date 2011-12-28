;; Just a few simple emacs lisp utility functions.

(defun add-exec-paths (paths)
  (let ((expanded (mapcar 'expand-file-name paths)))
    (setenv "PATH" (concat (mapconcat 'identity expanded ":") ":" (getenv "PATH")))
    (setq exec-path (append expanded exec-path))))
