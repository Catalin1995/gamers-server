require 'rails_helper'

RSpec.describe 'Api Routing', type: :routing do
  describe 'users' do
    it 'routes to #index' do
      expect(get: '/api/users').to route_to(controller: 'users', action: 'index', format: :json)
    end
    it 'routes to #show' do
      expect(get: '/api/users/1').to route_to(controller: 'users', action: 'show', format: :json, id: '1')
    end
    it 'routes to #login' do
      expect(put: '/api/login').to route_to(controller: 'users', action: 'login', format: :json)
    end
  end

  describe 'feeds' do
    it 'routes to #index' do
      expect(get: '/api/feed').to route_to(controller: 'feed', action: 'index', format: :json)
    end
    it 'routes to #show' do
      expect(get: '/api/feed/1').to route_to(controller: 'feed', action: 'show', format: :json, id: '1')
    end
    it 'routes to #create' do
      expect(post: '/api/feed').to route_to(controller: 'feed', action: 'create', format: :json)
    end
  end

  describe 'games' do
    it 'routes to #index' do
      expect(get: '/api/games').to route_to(controller: 'games', action: 'index', format: :json)
    end
    it 'routes to #show' do
      expect(get: '/api/games/1').to route_to(controller: 'games', action: 'show', format: :json, id: '1')
    end
  end

  describe 'gamefeeds' do
    it 'routes to #index' do
      expect(get: '/api/games/1/gamefeeds').to route_to(controller: 'gamefeeds', action: "index", game_id: '1', format: :json)
    end
  end

  describe 'globalchat' do
    it 'routes to #index' do
      expect(get: '/api/users/1/globalchat').to route_to(controller: 'globalchat', action: "index", user_id: '1', format: :json)
    end
  end
end
