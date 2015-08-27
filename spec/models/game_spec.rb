require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { create :game }

  it { expect(subject).to validate_presence_of :name }
  it { expect(subject).to validate_presence_of :category }
  it { expect(subject).to have_many :chats }
  it { expect(subject).to have_many :feeds }

  it 'create game' do
    expect do
      game
    end.to change { Game.count }.by 1
  end

  it 'delete game' do
    game1 = game
    game2 = create :game, name: 'LoL', category: 'STRATEGY'
    expect do
      Game.delete(game1)
    end.to change { Game.count }.by -1
  end
end
