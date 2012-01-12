class CmsSettings < ActiveRecord::Base
	validates_presence_of :svn_retention, :protected_directories
	validates_numericality_of :svn_retention, :allow_nil => true
end
