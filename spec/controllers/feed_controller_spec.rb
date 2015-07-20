require 'rails_helper'

RSpec.describe FeedController, type: :controller do
  render_views

  describe 'GET' do

    it 'index' do

      get :index, format: :json
      expect(json[:body].count).to eq(0)

      game = Game.create!(name: 'LoL', category: 'STRATEGY')
      user = User.create!(email: 'ionut@example.com', username: 'Ionut', password: 'password', password_confirmation: 'password')
      feed = Feed.create!(game_id: game.id, user_id: user.id, hours: 10, minutes: 10)

      get :index, format: :json
      expect(json[:body].count).to eq(1)

      game = Game.create!(name: 'Battlefield', category: 'FPS')
      feed = Feed.create!(game_id: game.id, user_id: user.id, hours: 10, minutes: 10)

      get :index, format: :json
      expect(json[:body].count).to eq(2)

    end

    it 'show when feet exist' do
      game = Game.create!(name: 'LoL', category: 'STRATEGY')
      user = User.create!(email: 'ionut@example.com', username: 'Ionut', password: 'password', password_confirmation: 'password')
      feed = Feed.create!(game_id: game.id, user_id: user.id, hours: 10, minutes: 10)

      get :show, id: feed.id, format: :json
      expect(json[:body][:id].to_s).to eq(feed.id.to_s)
    end

    it 'show when feet does not exist' do
      get :show, id: 11, format: :json
      expect(json[:code]).to eq(400_031)
      expect(json[:body]).to eq('Feed does not exist!')
    end

  end

end
