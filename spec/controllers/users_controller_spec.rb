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



  end

  describe 'GET user' do

    it 'login when account exist' do
      User.create!(email: 'ionut@example.com', username: 'ionut', password: 'password', password_confirmation: 'password')
      expect do
        get :login, username: 'ionut', password: 'password', format: :json
      end.to change { Key.count }.by 1

      expect(json[:body][:username]).to eq('ionut')
    end

    it 'login when account not exist' do
      expect do
        get :login, username: 'ionut', password: 'password', format: :json
      end.to change { Key.count }.by 0

      expect(json[:code]).to eq(400_001)
      expect(json[:body]).to eq('Userul nu exista!')
    end


    it 'by id' do
      user = User.create!(email: 'admin@example.com', username: 'admin', password: 'password', password_confirmation: 'password')
      get :show, id: user.id, format: :json
      expect(json[:body][:id].to_s).to eq(user.id.to_s)
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
  end

end
