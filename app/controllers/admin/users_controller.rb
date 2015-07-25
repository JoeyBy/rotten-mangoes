class Admin::UsersController < ApplicationController

  before_filter :restrict_admin_access

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @users = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "user has been deleted"
      if UserMailer.goodbye_email(@user).deliver_later
        format.html { redirect_to(@user, notice: 'User was successfully deleted') }
        format.json { render json: @user, status: :destroy, location: @user }
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(params[:id])
    if @user.save
      redirect_to admin_user_path, notice: "#{@user.firstname} has been created!"
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :admin, :password, :password_confirmation)
  end

end
