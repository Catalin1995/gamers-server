# require 'rails_helper'
#
# RSpec.describe ChatController, type: :controller do
#   render_views
#
#   describe 'GET show' do
#     it 'finds one' do
#       chat = Chat.create!(game_id: 1, user: 'ionut', content: 'foo')
#       get :index, game_id: 1
#       expect(json[:code]).to eq(200)
#       expect(json[:body].count).to eq(1)
#
#       chat = Chat.create(game_id: 1, user: 'ionut', content: 'foo')
#       get :index, game_id: 1
#       expect(json[:code]).to eq(200)
#       expect(json[:body].count).to eq(2)
#     end
#   end
#
#   describe 'POST create' do
#
#     it 'new chat' do
#       user = User.create(username: 'ionut', email: 'ionut@example.com', password: 'password', password_confirmation: 'password')
#       key = Key.create!(user_id: user.id, consumer_key: SecureRandom.base64(20), secret_key: SecureRandom.base64(20) )
#       game = Game.create!(category: 'FPS', name: 'Call of Duty')
#
#       post :create, consumer_key: key.consumer_key, secret_key: key.secret_key, game_id: game.id, content: 'foo', format: :json
#
#       expect(json[:body].count).to eq(1)
#
#       post :create, consumer_key: key.consumer_key, secret_key: key.secret_key, game_id: game.id, content: 'foo', format: :json
#
#       expect(json[:body].count).to eq(2)
#
#     end
#   end
# end
