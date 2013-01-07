class ProfilesController < ApplicationController
  before_filter :admin_user

  def new
    @profile=Profile.new
  end

  def create
     @profile=Profile.new(params[:profile])
     @name=params[:profile][:name]
     if Profile.find_by_name(@name)
       after_create
     else
       if @profile.save
         after_create
       else
         render 'new'
       end
     end
  end

  def show
    @profile=Profile.find(params[:id])
  end

  def index
    @profiles=Profile.paginate(page:params[:page])
  end

  def destroy
    Profile.find(params[:id]).destroy
    flash[:succes] = "Profile destroyed."
    redirect_to profiles_path
  end

  private

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def after_create
      @profile.users << current_user
      @fbck=FeedbackFilled.find_by_names("tt","admin")
      #redirect_to @profile.find_feedback_filled_by_name(current_user.name)
      #redirect_to @profile.find_feedback_filled_by_name("admin")
      redirect_to @fbck
    end

end
