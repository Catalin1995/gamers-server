require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  render_views
  let(:user) { create :user }

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
    user = create :user
    get :show, id: user.id, format: :json
    expect(json[:body][:id].to_s).to eq(user.id.to_s)
    expect(json[:body][:username]).to eq(user.username)
  end

  it 'by id when user does not exist' do
    get :show, id: -1, format: :json
    expect(json[:code]).to eq(400_001)
  end

  it 'all users' do
    create :user
    create :user, email: 'test@test.test', username: 'test'
    get :index, format: :json
    expect(json[:body].count).to eq(2)

    create :user, email: 'catalin@example.com', username: 'catelin'
    get :index, format: :json
    expect(json[:body].count).to eq(3)
  end

  it 'login when account exist' do
    new_user = create :user, username: 'ionut', password: 'password'
    user = {}
    user['name'] = new_user.username
    user['password'] = new_user.password
    expect do
      post :login, user: user, format: :json
    end.to change { Key.count }.by 1

    expect(json[:body][:user_id]).to eq(new_user.id)
  end

  it 'login when account not exist' do
    user = {}
    user['name'] = 'ionut'
    user['password'] = 'password'
    expect do
      post :login, user: user, format: :json
    end.to change { Key.count }.by 0

    expect(json[:code]).to eq(400_001)
    expect(json[:body]).to eq('User does not exist!')
  end
end
end
