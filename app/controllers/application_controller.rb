class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_sign_in
    redirect_to sign_in_path, alert: 'Please sign in.' unless current_user
  end

  def redirect_to_root_path
    redirect_to root_path, alert: 'You already signed in.' if current_user
  end
end
