class Admin::UsersController < ApplicationController

  before_filter :is_admin?

  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  # def new
  # end

  # def edit
  # end
end
  