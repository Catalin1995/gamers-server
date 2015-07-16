require 'bcrypt'
class UsersController < ApplicationController
  include BCrypt

  def show
    @user = User.find(params[:id])
  end

  def index
    @all = User.all
  end

  def create
    @user = User.create!(user_params)
  end

  def login

    @user = authenticate(params[:username], params[:password])

    if @user == nil
      return render_response("Userul nu exista!", 400_001)
    else
      consumer_key = SecureRandom.base64(20)
      secret_key = SecureRandom.base64(20)
      Key.create!(user_id: @user.id, consumer_key: consumer_key, secret_key: secret_key)
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
