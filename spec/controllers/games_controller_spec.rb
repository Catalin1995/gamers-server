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

  it 'GET show when game exist' do
    game = Game.new(name: 'LoL', category: 'STRATEGY')
    game.save

    get :show, id: game.id, format: :json
    expect(json[:code]).to eq(200)
    expect(json[:body][:id].to_s).to eq(game.id.to_s)
  end

  it 'GET show when game does not exist' do
    get :show, id: 10000, format: :json
    expect(json[:code]).to eq(400_021)
    expect(json[:body]).to eq('Game does not exist')
  end

end
