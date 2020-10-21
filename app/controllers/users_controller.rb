class UsersController < ApplicationController
  before_action :require_sign_in, only: :show

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

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
      if @user.update_attributes(user_params)
        flash[:notice] = "User was successfully updated"
        redirect_to @user
      else
        flash[:alert] = "Something went wrong"
        render 'edit'
      end
  end
  
  

  def show
    @user = User.find(params[:id])
    @opinion = Opinion.new
    @opinions = @user.opinions.most_recent
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :cover_image)
  end
end
