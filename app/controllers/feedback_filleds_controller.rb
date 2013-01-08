class FeedbackFilledsController < ApplicationController
  before_filter :admin_user,   only: [ :destroy, :index]
  before_filter :correct_or_admin_user,   only: [ :show]

  def show
    @feedback_filled=FeedbackFilled.find(params[:id])
  end

  def index
    @feedback_filleds=FeedbackFilled.paginate(page:params[:page])    
  end
  
  def edit
    @feedback_filled=FeedbackFilled.find(params[:id])
  end

  def update
    @feedback_filleds=FeedbackFilled.find(params[:id])
    if @feedback_filled.update_attributes(params[:feedback_filled])
      flash[:success]="Feedback updated"
      redirect_to @feedback_filled
    else
      render 'edit'
    end
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
