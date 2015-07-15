require 'rails_helper'

RSpec.describe ChatController, type: :controller do

  describe 'GET show' do
    xit 'finds one' do
      chat = Chat.create(game_id: -2, content: 'foo')
      pp chat.id
      get :show, id: chat.id
      pp json
    end
  end 

end
