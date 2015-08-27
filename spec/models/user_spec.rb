require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {create :user}

  it { expect(subject).to have_many :keys }
  it { expect(subject).to have_many :feeds }

  it { expect(subject).to validate_presence_of :email }
  it { expect(subject).to validate_presence_of :password }
  it { expect(subject).to validate_presence_of :username }

  it 'create game' do
    expect do
      user
    end.to change { User.count }.by 1
  end

  it 'delete user' do
    user1 = create :user
    user2 = create :user, email: 'admin@example.test', username: 'test'
    expect do
      User.delete(user1.id)
    end.to change { User.count }.by -1
  end
end
