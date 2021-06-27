(require 'ox-publish)

(setq org-export-time-stamp-file nil
      org-export-with-section-numbers nil
      org-export-with-author nil
      org-export-with-toc nil)

(setq org-html-head-include-default-style nil
      org-html-head-include-scripts nil
      org-html-postamble nil
      org-html-preamble nil
      org-html-html5-fancy t
      org-html-doctype "html5")

(setq org-publish-project-alist '(("doc"
                                   :base-directory "."
                                   :base-extension "org"
                                   :recursive t
                                   :publishing-function org-html-publish-to-html
                                   :publishing-directory "./public_html"
                                   :auto-sitemap t
                                   :sitemap-style list
                                   :sitemap-title "doc"
                                   :sitemap-filename "index.org"
                                   :sitemap-format-entry (lambda (entry style project)
                                                           (format "%s %s"
                                                                   (format-time-string "%Y-%m-%d"
                                                                                       (org-publish-find-date entry project))
                                                                   (org-publish-sitemap-default-entry entry style project)))
                                   :sitemap-sort-files anti-chronologically)))

(defun org-publish-doc()
  (interactive)
  (org-publish-project "doc"))

(provide 'publish)
