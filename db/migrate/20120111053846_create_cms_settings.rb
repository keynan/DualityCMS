class CreateCmsSettings < ActiveRecord::Migration
  def self.up
    create_table :cms_settings do |t|
			t.column :workflow,											:boolean, :default => false
			t.column :allow_group_editing,					:boolean, :default => false
			t.column :ajax_navigation,							:boolean, :default => false
			t.column :wysiwyg,											:boolean,	:default => false
			t.column :page_caching,									:boolean,	:default => false
			t.column :container_caching,						:boolean, :default => false
			t.column :asset_caching,								:boolean, :default => false
			t.column :svn_retention,								:integer, :default => 5
			t.column :strong_authentication,				:boolean, :default => false
			t.column :protected_directories,				:text
			t.timestamps
    end
  end

  def self.down
    drop_table :cms_settings
  end
end
