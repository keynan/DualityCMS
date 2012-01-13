class RolesPrivileges < ActiveRecord::Base

	validates_presence_of :privilege_id, :role_id
	validates_numericality_of :privilege_id, :role_id, :allow_nil => false
	
	belongs_to :role
	belongs_to :privilege#, :foreign_key => 'privilege_id'
	
	def self.disconnect(privilege_id, role_id)
		self.delete_all(
			['privilege_id = ? and role_id = ?',
			privilege_id,
			role_id]
		)
	end
end
