class CreatePrivileges < ActiveRecord::Migration
  def self.up
    create_table :privileges do |t|
			t.string :name, :null => false, :limit => 255
    end
  end

  def self.down
    drop_table :privileges
  end
end
