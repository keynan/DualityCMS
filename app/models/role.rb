class Role < ActiveRecord::Base

	validates_presence_of :name
	validates_uniqueness_of :name

	has_many :privileges, :through => :roles_privileges, :source => :privilege
	has_many :roles_privileges, :class_name => 'RolesPrivileges'
	
	def ==(rol)
		rol.underscore == underscore
	end
	
	def to_s
		name
	end
	
	def underscore
		name.underscore
	end
	
end
