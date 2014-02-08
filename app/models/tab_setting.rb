class TabSetting < ActiveRecord::Base
    @@default_settings = {}
    @@cache = {}
    Redmine::Plugin.all.each do |plugin|
        next unless plugin.tab_settings
        @@default_settings[plugin.id] = plugin.tab_settings[:default]
    end
    def self.get_settings(project_id)
        return @@cache[project_id.to_s] unless @@cache[project_id.to_s].nil?
        setting_arr = where(project_id: project_id)
        setting_hash = {}
        setting_arr.each do |setting|
            setting_hash[setting['plugin_id']] = YAML::load(setting['settings'])
        end
        Redmine::Plugin.all.each do |plugin|
            next unless plugin.tab_settings
            next if setting_hash.has_key?(plugin.id.to_s)
            setting_hash[plugin.id] = @@default_settings[plugin.id]
            obj = new(:project_id => project_id, :plugin_id => plugin.id, :settings => @@default_settings[plugin.id].to_yaml)
            obj.save
        end
        @@cache[project_id.to_s] = setting_hash
        setting_hash
    end
end
