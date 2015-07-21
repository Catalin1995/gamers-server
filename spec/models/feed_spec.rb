require 'rails_helper'

RSpec.describe Feed, type: :model do

  before(:all) do
    Game.delete_all
    User.delete_all
    Feed.delete_all
  end

  it 'create new feed' do

    game = Game .create(name: "LoL", category: "STRATEGY")
    user = User.create!(email: 'ionut@example.com', username: 'Ionut', password: 'password', password_confirmation: 'password')

    expect do
      Feed.create!(game_id: game.id, user_id: user.id, hours: 2, minutes: 1)
    end.to change{ Feed.count }.by 1
  end

  it 'set activity when is created' do

    game = Game .create(name: "LoL", category: "STRATEGY")
    user = User.create!(email: 'ionut@example.com', username: 'Ionut', password: 'password', password_confirmation: 'password')
    hours = 2
    minutes = 1

    feed = Feed.create!(game_id: game.id, user_id: user.id, hours: hours, minutes: minutes)

    if Time.now.hour < 10
      hour = "0#{Time.now.hour}"
    else
      hour = Time.now.hour
    end

    if Time.now.min < 10
      min = "0#{Time.now.min}"
    else
      min = Time.now.min
    end

    expect(feed.activity).to eq("On #{Time.now.day}/#{Time.now.month}/#{Time.now.year} at #{hour}:#{min}, #{user.username} started to play #{game.name} for #{hours} hours and #{minutes} minutes!")

  end

  it 'hour must be integer' do

    game = Game .create(name: "LoL", category: "STRATEGY")
    user = User.create!(email: 'ionut@example.com', username: 'Ionut', password: 'password', password_confirmation: 'password')

    begin
      Feed.create!(game_id: game.id, user_id: user.id, hours: 'asd', minutes: 12)
      assert false
    rescue
      assert true
    end

  end

  it 'minute must be integer' do

    game = Game .create(name: "LoL", category: "STRATEGY")
    user = User.create!(email: 'ionut@example.com', username: 'Ionut', password: 'password', password_confirmation: 'password')

    begin
      Feed.create!(game_id: game.id, user_id: user.id, hours: '12', minutes: 'a2a')
      assert false
    rescue
      assert true
    end

  end

  it 'minutes < 60 && minutes >= 0' do

    game = Game .create(name: "LoL", category: "STRATEGY")
    user = User.create!(email: 'ionut@example.com', username: 'Ionut', password: 'password', password_confirmation: 'password')

    begin
      Feed.create!(game_id: game.id, user_id: user.id, hours: 12, minutes: 60 )
      assert false
    rescue
      assert true
    end


    begin
      Feed.create!(game_id: game.id, user_id: user.id, hours: '12', minutes: '-1')
      assert false
    rescue
      assert true
    end

  end

  it 'hours <= 24 && hours >= 0' do

    game = Game .create(name: "LoL", category: "STRATEGY")
    user = User.create!(email: 'ionut@example.com', username: 'Ionut', password: 'password', password_confirmation: 'password')

    begin
      Feed.create!(game_id: game.id, user_id: user.id, hours: '25', minutes: '12')
      assert false
    rescue
      assert true
    end


    begin
      Feed.create!(game_id: game.id, user_id: user.id, hours: '-1', minutes: '12')
      assert false
    rescue
      assert true
    end

  end

end
