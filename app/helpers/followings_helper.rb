module FollowingsHelper
  def followings_button(user)
    return nil unless current_user.id != user.id

    if current_user.followeds.include?(user)
      link_to 'Unfollow', unfollow_path(user), method: :delete
    else
      link_to 'Follow', follow_path(user), method: :post
    end
  end
end
