class ChatController < ApplicationController

  def show
    @chat_game = Chat.where(:game_id => params[:id])
  end

end
