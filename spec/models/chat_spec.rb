require 'rails_helper'

RSpec.describe Chat, type: :model do

  before(:each) do
    Chat.delete_all
    chat = Chat.new(game_id: 1, user: 'Ionut', content: 'azi nu am timp')
    chat.save
    chat = Chat.new(game_id: 1, user: 'Catalin', content: 'text...')
    chat.save
    chat = Chat.new(game_id: 2, user: 'Adrian', content: 'play game')
    chat.save
    chat = Chat.new(game_id: 1, user: 'Test', content: 'text')
    chat.save
    chat = Chat.new(game_id: 4, user: 'Cristi', content: 'test')
    chat.save
    chat = Chat.new(game_id: 3, user: 'Vasile', content: 'nuuuuu')
    chat.save

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


  it 'work if is duplicate' do
    expect do
      chat = Chat.new(game_id: 4, user: 'asd', content: 'internet')
      chat.save
    end.to change { Chat.count }.by 1
  end

  it 'work if is duplicate' do
    expect do
      chat = Chat.new(game_id: 1, user: 'Ionut', content: 'azi nu am timp')
      chat.save
    end.to change { Chat.count }.by 1
  end

  it 'delete chat' do
    expect do
      chat = Chat.where(:game_id => 1, :user => 'Ionut')
      Chat.delete(chat)
    end.to change { Chat.count }.by -1
  end

  xit 'presence game_id, user, content' do
    Chat.new(game_id: '', user: '', content: '').should_not be_valid
    Chat.new(game_id: 1, user: '', content: 'tot asa').should_not be_valid
    Chat.new(game_id: '', user: '123', content: 'asd').should_not be_valid
    Chat.new(game_id: 1, user: 'ionut', content: '').should_not be_valid
    Chat.new(game_id: 2, user: '123', content: 'asd').should be_valid
  end

  # it 'update' do
  #   expect do
  #     chat = Chat.find_by(name: 'LoL')
  #     chat.name = 'TestGame'
  #     chat.save
  #   end.to change { Chat.count }.by 0
  #
  #   Chat.find_by(name: 'TestGame').should_not be_nil
  #   Chat.find_by(name: 'LoL').should be_nil
  # end

end
