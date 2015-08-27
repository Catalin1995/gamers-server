require 'rails_helper'

RSpec.describe Chat, type: :model do
  let(:chat) { create :chat }

  it { expect(subject).to belong_to :game}

  it { expect(subject).to validate_presence_of :user}
  it { expect(subject).to validate_presence_of :game}
  it { expect(subject).to validate_presence_of :content}


  it 'work' do
    expect do
      chat
    end.to change { Chat.count }.by 1
  end

  it 'verif fields' do
    game = create :game
    chat = create :chat, game: game
    expect(chat.game_id).to eq(game.id)
    expect(chat.user).to eq('ionut')
    expect(chat.content).to eq('bla bla bla')
  end

  it 'work if is duplicate' do
    expect do
      create :chat
      create :chat
    end.to change { Chat.count }.by 2
  end

  it 'delete chat' do
    chat = create :chat
    expect do
      Chat.delete(chat)
    end.to change { Chat.count }.by -1
  end
end
