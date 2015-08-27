require 'bcrypt'
class UsersController < ApplicationController
  include BCrypt

  def index
    @users = User.all
  end

  def show
    begin
      @user = User.find(params[:id])
    rescue
      return render_response("User does not exist!", 400_001)
    end
  end

  def create
    begin
      @user = User.create!(user_params)
    rescue
      return render_response("Email has already been taken!", 400_002)
    end
  end

  def login
    user = authenticate(params[:user][:name], params[:user][:password])
    if user == nil
      return render_response("User does not exist!", 400_001)
    else
      @key = Key.create!(user_id: user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def authenticate(username, password)
    user = User.where(:username => username).first
    if user && user.encrypted_password == BCrypt::Engine.hash_secret(password, user.encrypted_password)
      user
    else
      nil
    end
  end
end
