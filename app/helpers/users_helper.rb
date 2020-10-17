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
end
