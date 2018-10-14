class UsersController < ApplicationController

  # Step 24.
  def new
    @user = User.new
  end

  # Step 28.
  # Make an action named create to handle the POST requests.
  # Use user_params to create a new User object. 
  # If user.save is successful, redirect to the root path /. 
  # Otherwise, redirect to the signup page.
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
