;;; Define multi major modes for blog posts and drafts
(defun mumamo-chunk-ruby (pos min max)
  "Find highlight chunk in ruby.  Return range and 'ruby-mode.
See `mumamo-find-possible-chunk' for POS, MIN and MAX."
  (mumamo-quick-static-chunk pos min max "{% highlight ruby %}" "{% endhighlight %}" t 'ruby-mode t))

(defun mumamo-chunk-javascript (pos min max)
  "Find highlight chunk in javascript.  Return range and 'javascript-mode.
See `mumamo-find-possible-chunk' for POS, MIN and MAX."
  (mumamo-quick-static-chunk pos min max "{% highlight js %}" "{% endhighlight %}" t 'javascript-mode t))

;;; This currently has a bug, so to recognize the chunk the first --- have to be followed by a whitespace
(defun mumamo-chunk-yaml (pos min max)
  "Find yaml header.  Return range and 'yaml-mode.
See `mumamo-find-possible-chunk' for POS, MIN and MAX."
  (mumamo-quick-static-chunk pos min max "---" "---\n" t 'yaml-mode t))

(define-mumamo-multi-major-mode jekyll-markdown-mumamo-mode
  "Turn on multiple major modes for jekyll blog posts with main mode `markdown-mode'."
  ("Markdown Family" markdown-mode
   (mumamo-chunk-yaml
    mumamo-chunk-ruby
    mumamo-chunk-javascript)))

(define-mumamo-multi-major-mode jekyll-textile-mumamo-mode
  "Turn on multiple major modes for jekyll blog posts with main mode `markdown-mode'."
  ("Markdown Family" textile-mode
   (mumamo-chunk-yaml
    mumamo-chunk-ruby
    mumamo-chunk-javascript)))
  
(add-to-list 'auto-mode-alist '("_\\(posts\\|drafts\\).*\\.textile$" . jekyll-textile-mumamo-mode))
(add-to-list 'auto-mode-alist '("_\\(posts\\|drafts\\).*\\.markdown$" . jekyll-markdown-mumamo-mode))
