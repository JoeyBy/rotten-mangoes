class Admin::UsersController < ApplicationController

  before_filter :restrict_admin_access

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @users = User.find(params[:id])
  end

  # def new
  # end

  # def edit
  # end
end
  