class TabSetting < ActiveRecord::Base
	@@available_settings = {}
	Redmine::Plugin.all.each do |plugin|
	    next unless plugin.tab_settings
		@@available_settings[plugin.id] = {'default' => plugin.tab_settings[:default], 'serialized' => true}
	end

end
