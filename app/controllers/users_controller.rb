class UsersController < ApplicationController
  # Render page for creating a new user
  def new
    @user = User.new # nil user; blank fields
    render :new
  end

  # Creating a new user
  def create
    @user = User.new(user_params)

    # Check if valid user params
    if @user.save
      # Log in user
      log_in_user!(@user)
      # Go to a new load of the signup page
      redirect_to new_user_url
    else
      # if bad user_params
      flash.now[:errors] = @user.errors.full_messages
      # render the same signup page
      render :new
    end
  end

  def show
    render :show
  end

  def log_in_user!(user)
    user.reset_session_token!
    # TODO: reset cookie
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
