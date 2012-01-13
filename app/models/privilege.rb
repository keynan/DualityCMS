class Privilege < ActiveRecord::Base
	
	validates_presence_of :name
	validates_uniqueness_of :name
	
	has_many :roles, :order => 'name ASC', :through => :roles_privileges
	has_many :roles_privileges, :class_name => 'RolesPrivileges'
	
	def ==(priv)
		return priv.name == name
	end
	
	def <=>(other)
		self.name <=> other.name
	end
	
	def to_s
		name
	end
	
	def humanize
		name.humanize
	end
	
end
