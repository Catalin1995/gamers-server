require 'bcrypt'
class UsersController < ApplicationController

  include BCrypt

  def show
    begin
      @user = User.find(params[:id])
    rescue
      return render_response("User does not exist!", 400_001)
    end
  end

  def index
    @all = User.all
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

  def logout
    pp params
    key = Key.where(:consumer_key => params[:consumer_key], :secret_key => params[:secret_key]).first
    if key == nil
      return render_response("This user was not logged in!", 400_003)
    end
    @user = User.find(key.user_id)
    key.delete
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
