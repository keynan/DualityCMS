class UsersController < CmsController
  before_filter :login_required, :except => [:new, :create]

	def index
		list
		render :action => 'list'
	end
	
	def list
		@users = User.find :all, :order => :login
	end
	
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Thank you for signing up! You are now logged in."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end
	
	def destroy
		redirect_to users_url, :notice => "Delete is not implemented."
	end
	
end
