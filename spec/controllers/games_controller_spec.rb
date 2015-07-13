require 'rails_helper'
require 'pp'

RSpec.describe GamesController, type: :controller do

  before(:each) do
    Game.delete_all

    game = Game.new(name: 'LoL', category: 'STRATEGY')
    game.save
    game = Game.new(name: 'Battlefield', category: 'FPS')
    game.save
    game = Game.new(name: 'Minecraft', category: 'MMORPG')
    game.save
    game = Game.new(name: 'Dota', category: 'STRATEGY')
    game.save

  end

  it 'get all' do
    get :show, id: '1', body: 'asdasdas', format: :json
    # pp json
  end

end
