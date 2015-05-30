class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :authenticate!

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate!
    return if current_user.present?
    redirect_to login_path
  end
end
