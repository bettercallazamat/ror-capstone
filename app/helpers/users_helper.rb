module UsersHelper
  def last_follower(user)
    res = ''
    if user.followers.any?
      follower = user.followers.last
      res = 'Followed by ' + link_to(follower.fullname, user_path(follower.id))
    else
      res = 'No followers'
    end
    res.html_safe
  end

  def show_errors(object)
    object.errors.full_messages[0].html_safe if object.errors.any?
  end

  def show_followers
    if @user.followers.none?
      content_tag(:p, 'NO FOLLOWERS')
    else
      render '/shared/followers'
    end
  end
end
