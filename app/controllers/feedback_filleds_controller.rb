class FeedbackFilledsController < ApplicationController
  before_filter :admin_user,   only: [ :destroy, :index]
  before_filter :correct_or_admin_user,   only: [ :show]

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

  private

    def correct_user
      @user=FeedbackFilled.find(params[:id]).user
      redirect_to(root_path) unless current_user?(@user)
    end

    def correct_or_admin_user
      @user=FeedbackFilled.find(params[:id]).user
      redirect_to(root_path) unless (current_user.admin? || current_user?(@user))
    end

end
