class GlobalchatController < ApplicationController
  def index
    @chats = Globalchat.all
  end

  def create
    key = Key.where(:consumer_key => params[:consumer_key], :secret_key => params[:secret_key]).first
    if key == nil
      render_response("User is not logged", 400_011)
    else
      user = User.find(key.user_id)
      @chat = Globalchat.create!(:user_id => user.id, :user_name => user.username, :content => params[:content])
    end
  end
end
