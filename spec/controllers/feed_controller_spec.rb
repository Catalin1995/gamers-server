require 'rails_helper'

RSpec.describe FeedController, type: :controller do
  render_views
  let(:feed) { create :feed }
  describe 'GET' do

    it 'index' do
      get :index, format: :json
      expect(json[:body].count).to eq(0)

      user = create :user
      create :feed, user: user

      get :index, format: :json
      expect(json[:body].count).to eq(1)

      create :feed, user: user

      get :index, format: :json
      expect(json[:body].count).to eq(2)
    end

    it 'show when feet exist' do
      feed = create :feed
      get :show, id: feed.id, format: :json
      expect(json[:body][:id].to_s).to eq(feed.id.to_s)
      expect(json[:body][:game_id].to_s).to eq(feed.game_id.to_s)
      expect(json[:body][:user_id].to_s).to eq(feed.user_id.to_s)
      expect(json[:body][:hours].to_s).to eq(feed.hours.to_s)
    end

    it 'show when feet does not exist' do
      get :show, id: -1, format: :json
      expect(json[:code]).to eq(400_031)
      expect(json[:body]).to eq('Feed does not exist!')
    end

  end

  describe 'POST' do
    it 'create when user and game exist' do
      game = create :game
      user = create :user
      key = create :key, user: user

      post :create, consumer_key: key.consumer_key, secret_key: key.secret_key, feed: {game_id: game.id, user_id: user.id, hours: 2, minutes: 15}, format: :json

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
      game = create :game
      user = create :user
      key = create :key, user: user

      post :create, consumer_key: key.consumer_key, secret_key: key.secret_key, feed: {game_id: game.id, user_id: 12, hours: 2, minutes: 15}, format: :json
      expect(json[:code]).to eq(400_032)
      expect(json[:body]).to eq("Can't create feed!")

      post :create, consumer_key: key.consumer_key, secret_key: key.secret_key, feed: {game_id: 12, user_id: user.id, hours: 2, minutes: 15}, format: :json
      expect(json[:code]).to eq(400_032)
      expect(json[:body]).to eq("Can't create feed!")
    end

    it 'create when user or game does not exist' do
      game = create :game
      user = create :user
      key = create :key, user: user

      post :create, consumer_key: key.consumer_key, secret_key: key.secret_key, feed: {game_id: game.id, user_id: 12, hours: 2, minutes: 15}, format: :json
      expect(json[:code]).to eq(400_032)
      expect(json[:body]).to eq("Can't create feed!")
    end

    it 'create when time is not integer or does not exist' do
      game = create :game
      user = create :user
      key = create :key, user: user

      post :create, consumer_key: key.consumer_key, secret_key: key.secret_key, feed: {game_id: game.id, user_id: user.id, hours: 'asd', minutes: '21sd'}, format: :json
      expect(json[:code]).to eq(400_032)
      expect(json[:body]).to eq("Can't create feed!")
    end

    it 'create when user is not login' do
      game = create :game
      user = create :user

      post :create, consumer_key: 'test', secret_key: 'test', feed: {game_id: game.id, user_id: user.id, hours: 'asd', minutes: '21sd'}, format: :json
      expect(json[:code]).to eq(400_011)
      expect(json[:body]).to eq("User is not logged")
    end
  end
end
