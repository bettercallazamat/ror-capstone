class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      session[:user_id] = @user.id
      flash[:notice] = 'Account is created.'
      redirect_to root_path
    else
      flash.now[:alert] = 'Account is not created. Something went wrong.'
      render new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    @opinion = Opinion.new
    @opinions = @user.opinions.most_recent
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname, :photo)
  end
end
