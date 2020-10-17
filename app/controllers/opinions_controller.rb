class OpinionsController < ApplicationController
  def index
    if logged_in?
      @opinion = Opinion.new
      @opinions = Opinion.most_recent
      @who_to_follow = current_user.who_to_follow
    else
      redirect_to sign_in_path
    end
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
