Redmine plugin "archive issue categories"
=========================================

Normal redmine behaviour when deleting unused/old issue categories is, that in old tickets that were once assigned to the now deleted category, you only see the category ID anymore instead of the category name.

So checking back on old issues is always a bit odd as you don't see all the information needed.

This Redmine plugin now allows you to archive issue categories. This means, to deactivate and hide them from the user without deleting them. This is nice because it doesn't break old tickets :smiley:

This plugin is an attempt to solve redmine issue [#16188](http://www.redmine.org/issues/16188).

* This plugin works with Redmine 2.5.x, 2.6.x and 3.0
  * *`master` branch contains plugin with support for Redmine 3.0*
  * *Checkout branch `redmine/version-2.6` if you want support for Redmine 2.6*
  * *Checkout branch `redmine/version-2.5` if you want support for Redmine 2.5*
* This plugin is listed in the [redmine.org plugin repository](http://www.redmine.org/plugins/redmine_archive_issue_categories)


Installation
------------

* Clone or [download](https://github.com/tofi86/redmine_archive_issue_categories/releases) this repo into your **redmine_root/plugins/** folder
```
$ git clone https://github.com/tofi86/redmine_archive_issue_categories.git
```
* You have to run the plugin rake task *(from the Redmine root directory)* to provide the assets and migrate the database schema:
```
$ rake redmine:plugins:migrate RAILS_ENV=production
```
* Restart redmine


License
-------

*redmine_archive_categories* plugin is released under the MIT License.
