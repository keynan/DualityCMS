class AdminController < CmsController
	
	before_filter :login_required, :except => []
	#before_filter :require_view_audit_trail_privlege,		:only => [ :index, :audit_trail ]
	
	
	def index
		audit_trail
		render :action => 'audit_trail'
	end
	
	def audit_trail
		params[:id] ||= 0
		@current_page = params[:id]+1
		@pages, @crumbs = AuditTrail.find_all(@current_page-1)
	end
	
end
