class FeedbackFilledsController < ApplicationController

  def show
    @feedback_filled=FeedbackFilled.find(params[:id])
  end

end
