# class ChatController < ApplicationController
#
#   def index
#     @chats = Chat.where(:game_id => params[:game_id])
#   end
#
#   def create
#     key = Key.where(:consumer_key => params[:consumer_key], :secret_key => params[:secret_key]).first
#     if key == nil
#       render_response("User is not logged", 400_011)
#     end
#     user = User.find(key.user_id)
#     chat = Chat.create!(:game_id => params[:game_id], :user => user.username, content: 'foo' )
#     @chat_game = Chat.where(game_id: chat.game_id)
#   end
#
# end
