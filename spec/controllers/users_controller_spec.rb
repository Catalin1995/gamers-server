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
  end

  let(:login) do {
    usernmae: 'test',
    password: 'password'
  }
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

    it 'create new user and duplicate' do
      expect do
        post :create, user: user1, format: :json
      end.to change { User.count }.by 1

      expect(json['body']['username']).to eq('test')
      expect(json['body']['email']).to eq('test@example.com')

      expect do
        post :create, user: user1
      end.to change { User.count }.by 0
    end

  end

  describe 'GET user' do

    it 'by id when user exist' do
      user = User.create!(email: 'admin@example.com', username: 'admin', password: 'password', password_confirmation: 'password')
      get :show, id: user.id, format: :json
      expect(json[:body][:id].to_s).to eq(user.id.to_s)
      expect(json[:body][:username]).to eq(user.username)
    end

    it 'by id when user does not exist' do
      get :show, id: '1', format: :json
      expect(json[:code]).to eq(400_001)
    end

    it 'all users' do
      User.create!(email: 'admin@example.com', username: 'admin', password: 'password', password_confirmation: 'password')
      User.create!(email: 'ionut@example.com', username: 'ionut', password: 'password', password_confirmation: 'password')
      get :index, format: :json
      expect(json[:body].count).to eq(2)

      User.create!(email: 'catalin@example.com', username: 'catalin', password: 'password', password_confirmation: 'password')
      get :index, format: :json
      expect(json[:body].count).to eq(3)
    end

    it 'login when account exist' do
      user = User.create!(email: 'ionut@example.com', username: 'ionut', password: 'password', password_confirmation: 'password')
      expect do
        get :login, username: 'ionut', password: 'password', format: :json
      end.to change { Key.count }.by 1

      expect(json[:body][:user_id]).to eq(user.id)
    end

    it 'login when account not exist' do
      expect do
        get :login, username: 'ionut', password: 'password', format: :json
      end.to change { Key.count }.by 0

      expect(json[:code]).to eq(400_001)
      expect(json[:body]).to eq('User does not exist!')
    end

     it 'logout when account exist' do
      user1 = User.create!(email: 'ionut@example.com', username: 'ionut', password: 'password', password_confirmation: 'password')
      user2 = User.create!(email: 'catalin@example.com', username: 'catalin', password: 'password', password_confirmation: 'password')

      key1 = Key.create(user_id: user1.id)

      expect do
        get :logout, consumer_key: key1.consumer_key, secret_key: key1.secret_key, format: :json
      end.to change {Key.count}.by -1
    end

    it 'logout when account does not exist' do
      user1 = User.create!(email: 'ionut@example.com', username: 'ionut', password: 'password', password_confirmation: 'password')
      user2 = User.create!(email: 'catalin@example.com', username: 'catalin', password: 'password', password_confirmation: 'password')

      key1 = Key.create(user_id: user1.id)

      expect do
        get :logout, consumer_key: 'key1.consumer_key', secret_key: 'key1.secret_key', format: :json
      end.to change {Key.count}.by 0

      expect(json[:code]).to eq(400_003)
    end

  end

end
