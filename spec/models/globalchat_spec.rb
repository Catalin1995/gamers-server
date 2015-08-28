require 'rails_helper'

RSpec.describe Globalchat, type: :model do
  let(:chat) { create :globalchat }

  it { expect(subject).to validate_presence_of :user }
  it { expect(subject).to validate_presence_of :content }
  it { expect(subject).to validate_presence_of :user_name }

  it { expect(subject).to belong_to :user }

  it 'create game' do
    expect do
      chat
    end.to change { Globalchat.count }.by 1
  end

  it 'delete game' do
    user = create :user
    chat = create :globalchat, user_id: user.id
    chat1 = create :globalchat, user_id: user.id
    expect do
      Globalchat.delete(chat)
    end.to change { Globalchat.count }.by -1
  end
end
