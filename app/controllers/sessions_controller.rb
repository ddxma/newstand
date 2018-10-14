class SessionsController < ApplicationController

  before_action :logged_in_user, except: [:destroy]
  
  # Step 34.
  def new
  end

  # Step 37.  
  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to 'login'
    end 
  end

  # Step 39. Log out functionality
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
