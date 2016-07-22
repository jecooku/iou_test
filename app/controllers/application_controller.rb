class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  helper_method :current_user

  def authorize_user
    redirect_to new_session_path, :alert => 'You have not logged in' if current_user.nil?
  end

  def password_changed_users
    @password_changed_users = User.pluck(:password_resets).where('created_at >= ?', 1.day.ago).count > 3
  end

end
