class SettingsController < AdminController

	#before_filter :require_edit_cms_settings_privlege,	:only => [ :settings, :update_settings ]
	
	def index
	end
	
	def update
		if @cms_settings.update_attributes(params[:cms_settings])
			@cms_settings.save
			@cms_settings.reload
			flash[:notice] = 'Settings could not be updated.'
			redirect_to :action => :index
		else
			@cms_settings.save
			render :action => :index
		end
	end
	
=begin
	def flip_setting
		if request.xhr?
			current = session[:user].settings.send(params[:setting])
			session[:user].settings.update_attribute(params[:setting], !current)
			render :nothing => true
		else
			redirect_to :action => :index
		end
	end
=end
	
end
