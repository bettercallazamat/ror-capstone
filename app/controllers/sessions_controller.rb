class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])

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
    session[:username] = nil
    flash[:notice] = 'You have successfully logged out'
    redirect_to sign_in_path
  end
end
