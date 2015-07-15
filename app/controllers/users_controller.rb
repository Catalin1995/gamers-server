require 'pp'
require 'bcrypt'
class UsersController < ApplicationController
  include BCrypt
  def show
    pp User.all
    @user = User.find(params[:id])
  end

  def index
    @all = User.all
  end

  def create
    @user = User.create!(user_params)
  end

  def login
    # pp User.all
    # pp User.all
    password = Password.create(params[:password])
    pp password
    @user = User.where(:username => params[:username]).first
    pp @user.encrypted_password
    # pp @user
    # pp @user
 #    p SecureRandom.base64(10) # => "EcmTPZwWRAozdA=="
 #    p SecureRandom.base64(10) # => "EcmTPZwWRAozdA=="
 #    p SecureRandom.base64(10) # => "EcmTPZwWRAozdA=="
 #    p SecureRandom.base64(10) # => "EcmTPZwWRAozdA=="
 # p SecureRandom.random_bytes(100) # => "\323U\030TO\234\357\020\a\337"
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
