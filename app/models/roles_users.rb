class RolesUsers < ActiveRecord::Base
	validates_presence_of :role_id, :user_id
	validates_numericality_of :role_id, :user_id, :allow_nil => false
end
