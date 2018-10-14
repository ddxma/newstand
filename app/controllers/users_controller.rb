class UsersController < ApplicationController

  before_action :logged_in_user

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

  def show
    @user = User.find_by(params[:id])
  end

  # The correct one for the challenge editing user profile
  def edit
    @user = current_user
  end

  # The correct one for the challenge editing user profile
  def update
    if current_user.update user_params
      redirect_to "/"
    else
      render 'edit'
    end

  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.find_by(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to user_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
