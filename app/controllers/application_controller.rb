class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  include ApplicationHelper

  helper_method :current_user, :auth_token, :logged_in?

  # TODO
  def current_user
    self.user
  end

  def logged_in?
    # if nil, false; if exists, true
    !!current_user
  end
end
