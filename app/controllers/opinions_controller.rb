class OpinionsController < ApplicationController
  before_action :require_sign_in

  def index
    @opinion = Opinion.new
    @opinions = Opinion.most_recent
    @who_to_follow = current_user.who_to_follow
  end

  def create
    @opinion = current_user.opinions.build(opinion_params)
    if @opinion.save
      flash[:notice] = 'Opinion was created successfully'
    else
      flash[:alert] = 'Something went wrong...'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
