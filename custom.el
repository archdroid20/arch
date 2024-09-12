
(defun print-doom-emacs-keybindings ()
  "Print all keybindings for Doom Emacs."
  (interactive)
  (with-output-to-temp-buffer "*Doom Emacs Keybindings*"
    (dolist (map (list evil-normal-state-map
                       evil-insert-state-map
                       evil-visual-state-map
                       evil-motion-state-map))
      (let ((keymap (copy-keymap map)))
        (map-keymap
         (lambda (key binding)
           (when (commandp binding)
             (princ (format "%s -> %s\n"
                            (key-description (vector key))
                            binding))))
         keymap)))))
