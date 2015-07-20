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

  describe 'POST' do

    it 'create when user and game exist' do

      game = Game.create!(name: 'LoL', category: 'STRATEGY')
      user = User.create!(email: 'ionut@example.com', username: 'Ionut', password: 'password', password_confirmation: 'password')

      post :create, feed: {game_id: game.id, user_id: user.id, hours: 2, minutes: 15}, format: :json

      if Time.now.hour < 10
        hour = "0#{Time.now.hour}"
      else
        hour = Time.now.hour
      end

      if Time.now.min < 10
        min = "0#{Time.now.min}"
      else
        min = Time.now.min
      end

      expect(json[:body][:activity]).to eq("On #{Time.now.day}/#{Time.now.month}/#{Time.now.year} at #{hour}:#{min}, #{user.username} started to play #{game.name} for 2 hours and 15 minutes!")
    end

    it 'create when user or game does not exist' do

      game = Game .create(name: "LoL", category: "STRATEGY")
      user = User.create!(email: 'ionut@example.com', username: 'Ionut', password: 'password', password_confirmation: 'password')


      post :create, feed: {game_id: game.id, user_id: 12, hours: 2, minutes: 15}, format: :json
      expect(json[:code]).to eq(400_032)
      expect(json[:body]).to eq("Can't create feed!")

      post :create, feed: {game_id: 12, user_id: user.id, hours: 2, minutes: 15}, format: :json
      expect(json[:code]).to eq(400_032)
      expect(json[:body]).to eq("Can't create feed!")


    end

    it 'create when user or game does not exist' do

      game = Game .create(name: "LoL", category: "STRATEGY")

      post :create, feed: {game_id: game.id, user_id: 12, hours: 2, minutes: 15}, format: :json
      expect(json[:code]).to eq(400_032)
      expect(json[:body]).to eq("Can't create feed!")

    end

  end

end
