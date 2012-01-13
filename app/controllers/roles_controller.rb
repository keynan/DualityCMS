class RolesController < AdminController
	def index
		@roles = Role.find :all, :order => 'name'
	end
	
	include DualityCMS::CRUD
	
	def privileges_and_roles
		role_and_unassigned_privileges(params[:id])
		render :layout => false if request.xhr?
	end
	
	def grant_privilege
		if request.xhr?
			RolesPrivileges.create(:privilege_id => parse_html_id(params[:id]), :role_id => params[:role_id])
			@id = params[:id]
			@to = :assigned_privileges_list
			@privilege = Privilege.find(parse_html_id(params[:id]))
			render :layout => false, :action => 'alter_privilege_setting'
		else
			redirect_to :action => 'index'
		end
	end
	
	def revoke_privilege
		if request.xhr?
			RolesPrivileges.disconnect(parse_html_id(params[:id]), params[:role_id])
			@id = params[:id]
			@to = :unassigned_privileges_list
			@privilege = Privilege.find(parse_html_id(params[:id]))
			render :layout => false, :action => 'alter_privilege_setting'
		else
			redirect_to :action => 'index'
		end
	end
	protected
	
	def role_and_unassigned_privileges(id)
		@role = Role.find(id, :include => [:privileges])
		@unassigned_privileges = Privilege.find(:all, :order => 'name')
		@role.privileges.sort!
		@role.privileges.each do |privilege|
			@unassigned_privileges.delete(privilege)
		end
	end
	
	def parse_html_id(id)
		id.gsub(/^.*_([0-9]+)$/,'\1')
	end
	
end
