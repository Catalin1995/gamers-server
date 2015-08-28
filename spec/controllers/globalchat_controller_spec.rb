require 'rails_helper'

RSpec.describe GlobalchatController, type: :controller do
  render_views

  describe 'GET index' do
    it 'when exist' do
      user = create :user
      create :globalchat, user_id: user.id
      create :globalchat, user_id: user.id
      get :index, user_id: user.id, format: :json
      expect(json[:code]).to eq(200)
      expect(json[:body].count).to eq(2)

      create :globalchat, user_id: user.id
      get :index, user_id: user.id, format: :json
      expect(json[:code]).to eq(200)
      expect(json[:body].count).to eq(3)
    end

    it 'when not exist' do
      get :index, user_id: -1, format: :json
      expect(json['code']).to eq(200)
      expect(json['body']).to eq([])
    end
  end
end
