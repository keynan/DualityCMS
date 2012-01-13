class CmsSettings < ActiveRecord::Base
	validates_presence_of :protected_directories
	validates_numericality_of :svn_retention, :allow_nil => true
	
	def to_s
		return "present"
	end
end
