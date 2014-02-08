module ProjectsHelper
	alias :old_project_settings_tabs :project_settings_tabs
	def project_settings_tabs
		tabs = old_project_settings_tabs
		new_tabs = TabManager.get
		new_tabs.each do |item|
			tabs << item
		end unless new_tabs.nil?
		tabs
	end
end
