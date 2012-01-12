class UserSessionsController < CmsController
  def new
		
    @user_session = UserSession.new
		#logger.debug(@user_session.instance_methods(true))
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to_target_or_default root_url, :notice => "Logged in successfully."
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to root_url, :notice => "You have been logged out."
  end
end
