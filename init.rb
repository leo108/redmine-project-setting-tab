require File.expand_path(File.dirname(__FILE__) + '/lib/patch')
Redmine::Plugin.register :_project_setting do
  name 'Project Setting plugin'
  author 'leo108'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://leo108.com'
end
