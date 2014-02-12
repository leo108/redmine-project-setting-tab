module ProjectsHelper
	def project_settings_tabs_extend
		tabs = project_settings_tabs
		new_tabs = TabManager.get
		new_tabs.each do |item|
			tabs << item
		end unless new_tabs.nil?
		tabs
	end
end
module Redmine
    class Plugin
        def_field :tab_settings
        def add_tab(label, url)
            item = {:name => label.to_s, :label => label, :url => url, :partial => 'tab_setting/layout'}
            TabManager.add(@id, item)
        end
        def tab_show_expr(expression)
            TabManager.set_expr(@id, expression)
        end
    end
end
