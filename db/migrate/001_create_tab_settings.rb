class CreateTabSettings < ActiveRecord::Migration
  def change
    create_table :tab_settings do |t|
      t.integer :project_id
      t.string :plugin_id
      t.string :settings
    end
    add_index :tab_settings, :project_id
  end
end
