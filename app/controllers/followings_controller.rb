class FollowingsController < ApplicationController
  def create
    @followed = User.find(params[:user_id])
    @following = current_user.followings.new(followed_id: @followed.id)
    if @following.save
      flash[:notice] = "You started following #{@followed.fullname}"
    else
      flash[:alert] = 'Something went wrong ...'
    end
    redirect_to root_path
  end
end
