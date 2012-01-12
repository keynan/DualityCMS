class DashboardController < CmsController
	
	before_filter :login_required, :except => []

  def index
  end

end
