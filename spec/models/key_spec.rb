require 'rails_helper'

RSpec.describe Key, type: :model do
  let(:key) { create :key }

  it { expect(subject).to belong_to :user }
  it { expect(subject).to validate_presence_of :user }

  it 'create key' do
    expect do
      key
    end.to change {Key.count}.by 1
  end
end
