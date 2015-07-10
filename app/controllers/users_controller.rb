class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @all = User.all
  end

  def created

  end

  def delete

  end

  def update

  end

end
