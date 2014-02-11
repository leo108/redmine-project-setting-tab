class TabSettingController < ApplicationController
    def save
        tab = params['tab']
        settings = params['settings']
        @project = Project.find(params[:id])
        project_id = @project.id
        origin_settings = TabSetting.get_settings(@project.id)
        settings.each do |plugin_id, sets|
            next unless origin_settings.has_key?(plugin_id)
            sets.each do |key, value|
                origin_settings[plugin_id][key] = value
            end
        end
        origin_settings.each do |plugin_id, sets|
            record = TabSetting.where(:project_id => project_id, :plugin_id => plugin_id)
            if record.size > 0
                record.update(record.first.id, :settings =>  sets.to_yaml)
            else
                TabSetting.new(:project_id => project_id, :plugin_id => plugin_id,:settings => sets.to_yaml)
            end
        end
        flash[:notice] = l(:notice_successful_update)
        redirect_to settings_project_path(@project, :tab => tab)
    end
end
