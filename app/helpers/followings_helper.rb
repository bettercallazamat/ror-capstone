module FollowingsHelper
  def followings_button(user)
    return nil unless current_user.id != user.id

    if current_user.followeds.include?(user)
      link_to "-", unfollow_path(user), method: :delete, class: "unfollow-btn"
    else
      link_to "+", follow_path(user), method: :post, class: "follow-btn"
    end
  end
end
