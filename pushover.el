
(defconst *pushover-api-key* "agd6sapvp5xcdmbuo1qdpc7mddscri")

(defvar *pushover-user-key* nil)

(cl-defun pushover-send (title message &optional (html nil) (priority 0))
  (let ((url-request-method "POST")
        (url-request-data (concat (format "token=%s&user=%s&title=%s&message=%s&priority=%s&timestamp=%s"
                                          *pushover-api-key*
                                          *pushover-user-key*
                                          (url-encode-url title)
                                          (url-encode-url message)
                                          priority
                                          (current-time))
                                  (if html
                                      "&html=1"
                                    ""))))
    (url-retrieve "https://api.pushover.net/1/messages.json" (lambda (status) (kill-buffer (current-buffer)) t))))

(provide 'pushover)
