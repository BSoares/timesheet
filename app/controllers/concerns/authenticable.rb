module Authenticable
  extend ActiveSupport::Concern

  included do
    before_filter :authenticate!

    helper_method :current_user
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate!
    return if current_user.present?
    flash[:error] = t("errors.messages.unauthorized_access")
    redirect_to login_path
  end
end
