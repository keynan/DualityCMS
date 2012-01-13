class CreateRolesPrivileges < ActiveRecord::Migration
  def self.up
    create_table :roles_privileges do |t|
			t.integer :role_id, :null => false
			t.integer :privilege_id, :null => false
    end
  end

  def self.down
    drop_table :roles_privileges
  end
end
