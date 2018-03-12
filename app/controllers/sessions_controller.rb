class SessionsController < ApplicationController
  # Render page for logging in an existing user
  def new
    render :new
  end

  # Log in to new session
  def create
    user = User.find_by_credentials(
      user_params[:email],
      user_params[:password]
    )


  end

  # Log out of session
  def destroy
  end
end
