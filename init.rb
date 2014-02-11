require File.expand_path(File.dirname(__FILE__) + '/lib/patch')
Redmine::Plugin.register :_project_setting do
  name 'Project Setting plugin'
  author 'leo108'
  description 'This plugin add support for other plugin to add a setting tab in project setting page'
  version '0.0.1'
  url 'https://github.com/leo108/redmine-project-setting-tab'
  author_url 'http://leo108.com'
end
