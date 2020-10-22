module ApplicationHelper
  def show_notice_and_alert
    if notice.present?
      content_tag(:span, notice, class: "notice bg-success")
    elsif alert.present?
      content_tag(:span, alert, class: "alert bg-warning")
    end
  end

  def show_navbar
    if logged_in?
      render "/shared/navbar"
    end
  end

  def show_header 
    if logged_in?
      render "/shared/header"
    end
  end
end
