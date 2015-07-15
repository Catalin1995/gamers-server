require 'rails_helper'
require 'pp'

RSpec.describe GamesController, type: :controller do
  render_views

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

  it 'GET index' do
    get :index, format: :json
    expect(json['code']).to eq(200)
    expect(json['body'].count).to eq(4)
  end

  it 'GET show' do
    game = Game.new(name: 'LoL', category: 'STRATEGY')
    game.save
    get :show, id: game.id, format: :json
    expect json
  end

  it 'POST create' do

    
  end

end
