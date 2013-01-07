class FeedbackFilledsController < ApplicationController

  def new
    @feedback_filled=FeedbackFilled.new
    #@name=@feedback_filled.profile.build
  end
    
  def show
    @feedback_filled=FeedbackFilled.find(params[:id])
  end

  def index
    @feedback_filleds=FeedbackFilled.paginate(page:params[:page])    
  end

  def destroy
    FeedbackFilled.find(params[:id]).destroy
    flash[:succes] = "FeedbackFilled destroyed."
    redirect_to feedback_filleds_path
  end


end
