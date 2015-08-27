require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  render_views
  let(:game) { create :game }

  it 'GET index' do
    get :index, format: :json
    expect(json['code']).to eq(200)
    expect(json['body'].count).to eq(0)

    create :game, name: 'LoL', category: "STRATEGY"
    create :game, name: 'Battlefield', category: "FPS"
    create :game, name: 'Minecraft', category: "MMORPG"
    create :game, name: 'Dota', category: "STRATEGY"

    get :index, format: :json
    expect(json['code']).to eq(200)
    expect(json['body'].count).to eq(4)
  end

  it 'GET show when game exist' do
    game = create :game

    get :show, id: game.id, format: :json
    expect(json[:code]).to eq(200)
    expect(json[:body][:id].to_s).to eq(game.id.to_s)
  end

  it 'GET show when game does not exist' do
    get :show, id: -1, format: :json
    expect(json[:code]).to eq(400_021)
    expect(json[:body]).to eq('Game does not exist')
  end
end
