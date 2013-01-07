class UsersController < ApplicationController
  before_filter :signed_in_user,        only: [:show,:edit, :update, :destroy, :index]
  #before_filter :correct_user,          only: [:show,:edit,:update]
  before_filter :admin_user,            only: [:destroy, :index]
  before_filter :correct_or_admin_user, only: [:show,:edit,:update]

  def show
    @user=User.find(params[:id])
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success]="Welcome to 360!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success]="Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users=User.paginate(page:params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:succes] = "User destroyed."
    redirect_to users_path
  end

  private

    def correct_user
      @user=User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def correct_or_admin_user
      @user=User.find(params[:id])
      redirect_to(root_path) unless (current_user.admin? || current_user?(@user))
    end

end
