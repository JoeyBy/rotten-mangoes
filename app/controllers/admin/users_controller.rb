class Admin::UsersController < ApplicationController

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
