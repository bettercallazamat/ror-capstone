class OpinionsController < ApplicationController
  def index
    @opinion = Opinion.new
    @opinions = Opinion.order_by_most_recent
  end

  def create
    @opinion = current_user.opinions.build(opinion_params)
    if @opinion.save
      flash[:notice] = 'Opinion was created successfully'
      redirect_to root_path
    else
      flash[:alert] = 'Something went wrong...'
      render root_path
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
