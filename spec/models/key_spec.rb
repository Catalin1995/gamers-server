require 'rails_helper'

RSpec.describe Key, type: :model do
  it 'create key' do
    expect do
      key = Key.create!(user_id: 1)
    end.to change {Key.count}.by 1
  end
end
