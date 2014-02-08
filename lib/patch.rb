require File.expand_path(File.dirname(__FILE__) + '/../../../app/controllers/projects_controller')
class ProjectsController < ApplicationController
	before_filter :before_settings, :only => :settings
	def before_settings
		require File.expand_path(File.dirname(__FILE__) + '/../../../app/helpers/projects_helper')
		require File.expand_path(File.dirname(__FILE__) + '/helper')
	end
end
module Redmine
	class Plugin
		def_field :tab_settings
		def add_tab(name, label, url)
			item = {:name => name, :label => label, :url => url, :partial => 'tab_setting/layout'}
			TabManager.add(@id, item)
		end
		def tab_show_var(var_name)
			TabManager.set_var(@id, var_name)
		end
	end
end
