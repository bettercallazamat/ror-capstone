class SessionsController < ApplicationController
  before_action :redirect_to_root_path, only: %i[new create]

  def new; end

  def create
    @user = User.find_by(username: params[:session][:username])

    if @user
      session[:user_id] = @user.id
      flash[:notice] = 'User successfully logged in.'
      redirect_to root_path
    else
      flash.now[:alert] = 'Something went wrong...'
      render :new
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      flash[:notice] = 'You have successfully logged out'
    else
      flash[:notice] = 'Something went wrong...'
    end
    redirect_to sign_in_path
  end
end
