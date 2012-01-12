class CmsController < ApplicationController
  session :session_key => '_DualityCMS_session_id'

	layout 'cms'

	before_filter :get_cms_settings
	hide_action :factory
	hide_action :get_cms_settings

protected

	include ControllerAuthentication
  #include DualityCMS::DummyMethods
	#include DualityCMS::Authorization
	#include DualityCMS::Sequencing
	
	def get_cms_settings
		@cms_settings ||= CmsSettings.find(:first)
	end
	
	def factory(model)
		Object.const_get(model.camelize) if(model)
	end
	
end
