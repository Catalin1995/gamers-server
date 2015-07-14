class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @all = User.all
  end

end
