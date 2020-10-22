module OpinionsHelper
  def show_comments_title(opinion)
    content_tag(:h4, 'All comments:') if opinion.comments.present?
  end
end
