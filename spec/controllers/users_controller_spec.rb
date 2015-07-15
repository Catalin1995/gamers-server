require 'rails_helper'
require 'pp'
RSpec.describe UsersController, type: :controller do
  render_views

  before(:each) do
    User.delete_all
  end

  let(:user1) do {
      email: 'test@example.com',
      username: 'Test',
      password: 'password',
      password_confirmation: 'password'
  }
  end

  let(:user2) do {
      email: 'test@test.com',
      username: 'test',
      password: 'password',
      password_confirmation: 'password'
    }
    }
  end

  let(:login) do {
    usernmae: 'test',
    password: 'password'
  end

  describe 'POST user' do
    it 'create new user' do
      expect do
        post :create, user: user1, format: :json
      end.to change { User.count }.by 1

      expect(json['body']['username']).to eq('test')
      expect(json['body']['email']).to eq('test@example.com')

      expect do
        post :create, user: user2
      end.to change { User.count }.by 1

    end

  end

end
