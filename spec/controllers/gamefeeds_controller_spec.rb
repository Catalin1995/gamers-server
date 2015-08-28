require 'rails_helper'

RSpec.describe GamefeedsController, type: :controller do
  render_views
  let(:feed) { create :feed }

  describe 'GET index' do
    it 'when exist available feed' do
      feed = create :feed
      get :index, game_id: feed.game_id, format: :json
      expect(json[:body][:available].count).to eq(1)
      expect(json[:body][:unavailable].count).to eq(0)
    end

    it 'when game does not exist' do
      get :index, game_id: -1, format: :json
      expect(json[:body][:available].count).to eq(0)
      expect(json[:body][:unavailable].count).to eq(0)
    end
  end
end
