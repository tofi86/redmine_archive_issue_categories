require_dependency 'issue_category_patch'


Redmine::Plugin.register :redmine_archive_issue_categories do
  name 'Redmine Archive Issue Categories'
  author 'Tobias Fischer'
  description "This Redmine plugin allows you to archive issue categories. This means, to deactivate and hide them from the user without deleting them. This is nice because it doesn't break old tickets"
  version '0.3.0'
  url 'https://github.com/tofi86/redmine_archive_categories'
  author_url 'https://github.com/tofi86'
  requires_redmine :version_or_higher => '3.0.0'
end
