module DualityCMS
	module AssetConnections
		
		module ClassMethods
			
			def belongs_to_asset
				
				class_eval do
#					Removed acts_as_solr until solr is installed (runs on tomcat)
#					acts_as_solr 
					belongs_to :asset_type
				end
				
				#alias old_method_missing method_missing if respond_to?:method_missing
				
				class_eval "
					def method_missing(method, *args)
						if(method.to_s =~ /^asset([^_]|$)/)
							load_assets
							send asset_type.name + method.to_s.gsub(/^asset/, '')
						else
							super(method, *args)
						end
					end
				"
				
				class_eval "
					def load_assets
						AssetType.asset_connection_names.each do |at|
							Content.class_eval{ belongs_to at, :foreign_key => 'asset_id' } unless respond_to?at
						end
					end
				"
				
			end
			
			def acts_as_asset
				asset_type = AssetType.find_by_name(self.to_s.underscore)
				unless asset_type
					asset_type = AssetType.create(:name => self.to_s.underscore)
				end
				
				class_eval do
					has_many :contents, :foreign_key => 'asset_id', :conditions => [ 'asset_type_id = ?', asset_type.id ], :dependent => :destroy
					validates_presence_of :headline
					validates_uniqueness_of :headline
				end
				
			end
			
		end
		
		def self.included(base)
      base.extend(ClassMethods)
    end
		
		private
		
		
		
	end
end
