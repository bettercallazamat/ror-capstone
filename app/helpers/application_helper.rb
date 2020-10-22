module ApplicationHelper
  def show_notice_and_alert
    if notice.present?
      content_tag(:span, notice, class: 'notice bg-success')
    elsif alert.present?
      content_tag(:span, alert, class: 'alert bg-warning')
    end
  end

  def show_navbar
    render '/shared/navbar' if logged_in?
  end

  def show_header
    render '/shared/header' if logged_in?
  end
end
