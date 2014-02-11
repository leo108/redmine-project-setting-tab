# Redmine Project Setting Tab Plugin

This is a redmine plugin that add support for other plugin to add a setting tab in project setting page

## Install

> git clone https://github.com/leo108/redmine-project-setting-tab.git \_project\_setting

*Notice that you have to clone this plugin into a directory named '\_project\_setting'.*

## Usage

### add a tab

    Redmine::Plugin.register :redmine_polls do
    [ ... ]

        add_tab :polls, :partial => 'tab/polls'
    end

`add_tab` method will add a tab to project setting tabs, there can be more than one `add_tab` in a plugin.

The first argument is the tab's label, it can be a I18n symbol, the second argument is a Hash, it render your tab's view, just like the render's first argument, hash's key should be one of `:partial`, `:template`, `:inline`, `:file` and `:text`.

### add some settings

    Redmine::Plugin.register :redmine_polls do
    [ ... ]

        add_tab :polls, :partial => 'tab/polls'
        tab_settings :default => {'email_address' => ''}
    end

`tab_settings` method set a list of settings's default value.

### the tab's view

We set the :partial to 'tab/polls', so the view file is app/views/tab/\_polls.html.erb

    <table>
      <tbody>
        <tr>
          <td>Notification Email</td>
          <td><input type="text" value="<%= settings['redmine_polls']['email_address'] %>"
                           name="settings[redmine_polls][email_address]" ></td>
        </tr>
      </tbody>
    </table>

You can use <%= settings['your_plugin_name']['your_project_setting_name'] %> to output the setting.

### toggle tab's visibility

    Redmine::Plugin.register :redmine_polls do
    [ ... ]

        settings :default => {'some_plugin_setting' => 'some value'}, :partial => 'settings/poll_settings'

        tab_show_expr :expr => "Setting['plugin_redmine_polls']['some_plugin_setting']", :expect_value => 'some value'
        add_tab :polls, :partial => 'tab/polls'
        tab_settings :default => {'email_address' => ''}
    end

`tab_show_expr` method will decide your tab(s) whether to be displayed. `:expr` can be any expression, if `:expr`'s value is equal to `:expect_value`, then all your tabs displayed.

There can only be *one* or *no* `tab_show_expr` in a plugin, if there is no `tab_show_expr`, it will display your tabs by default.

### get project settings

    settings = TabSetting.get_settings(project.id)
    email_address = settings['redmine_polls']['email_address']

