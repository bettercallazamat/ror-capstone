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
    if object.errors.any?
      object.errors.full_messages[0].html_safe
    end
  end
end
