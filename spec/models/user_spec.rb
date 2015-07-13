require 'rails_helper'

RSpec.describe User, type: :model do

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

  it 'create game' do
    expect do
      game = Game.new(name: 'LoL', category: 'STRATEGY')
      game.save
    end.to change { Game.count }.by 1
  end

  it 'delete game' do
    expect do
      game = Game.where(:name => 'LoL', :category => 'STRATEGY')
      Game.delete(game)
    end.to change { Game.count }.by -1
  end

  it 'presence name and category' do
    Game.new(name: '', category: 'asd').should_not be_valid
    Game.new(name: 'Test', category: '').should_not be_valid
    Game.new(name: 'test', category: 'test').should be_valid
  end

  it 'update' do
    expect do
      game = Game.find_by(name: 'LoL')
      game.name = 'TestGame'
      game.save
    end.to change { Game.count }.by 0

    Game.find_by(name: 'TestGame').should_not be_nil
    Game.find_by(name: 'LoL').should be_nil
  end

end
