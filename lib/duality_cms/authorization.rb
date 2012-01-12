module DualityCMS
	module Authorization
		
		def authorize
			get_cms_settings
			if(@cms_settings and @cms_settings.strong_authentication)
				return fail_authorization unless session[:user].try_to_login
			else
				return fail_authorization unless session[:user]
			end
			return true
		end
		
		def fail_authorization
			self.jump_to= request.parameters
			redirect_to :controller => 'login', :action => 'index'
			return false
		end
		
		def require_privlege(privlege)
			unless session[:user].has_privlege?(privlege)
				flash[:notice] = 'You have been logged out for attempting to exceed your access level.'
				redirect_to :controller => 'login', :action => 'logout'
				return false
			end
		end
		
		def method_missing(method, *args)
			logger.debug("In Authorization#method_missing")
			if(method.to_s =~ /^require_[a-z_]+_privlege$/)
				method = method.to_s.gsub(/^require_([a-z_]+)_privlege$/, '\1')
				require_privlege(method)
			else
				logger.debug("Calling Super")
				super(method, *args)
			end
		end
		
	end
end