class FollowingsController < ApplicationController
  def create
    @followed = User.find(params[:id])
    @following = current_user.followings.new(followed_id: @followed.id)
    if @following.save
      flash[:notice] = "You started following #{@followed.fullname}"
    else
      flash[:alert] = 'Something went wrong ...'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @user_to_unfollow = User.find(params[:id])
    following = current_user.followings.where(followed_id: @user_to_unfollow.id)[0]
    following.destroy
    if following
      flash[:notice] = "You unfollowed #{@user_to_unfollow.fullname}"
    else
      flash[:alert] = 'It was not possible to remove this friendship. Try again later.'
    end
    redirect_back(fallback_location: root_path)
  end
end
