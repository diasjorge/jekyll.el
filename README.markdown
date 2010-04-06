Emacs support for Jekyll blogs.

If mumamo is present (it's part of nxhtml) then a multi major mode is enabled for the blog posts, so the YAML front matter will use yaml-mode and the chunks between highlight tags also use their modes.

Integrated support for ruby and javascript.

You can add other modes for highlighting in your configuration.

For example:

<pre>
  <code>
    (add-to-list 'jekyll-modes-list '("erlang" 'erlang-mode))
  </code>
</pre>

**TODO**: YAML front matter requires an extra space after the triple dash so it recognizes it.