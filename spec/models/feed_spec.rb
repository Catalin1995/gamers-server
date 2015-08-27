require 'rails_helper'

RSpec.describe Feed, type: :model do
  let(:feed) { create :feed }

  it { expect(subject).to validate_presence_of :user }
  it { expect(subject).to validate_presence_of :game }
  it { expect(subject).to validate_presence_of :hours }
  it { expect(subject).to validate_presence_of :minutes }
  it { expect(subject).to validate_numericality_of :minutes }
  it { expect(subject).to validate_numericality_of :hours }

  it { expect(subject).to belong_to :game }
  it { expect(subject).to belong_to :user }

  it 'create new feed' do
    expect do
      feed
    end.to change{ Feed.count }.by 1
  end

  it 'set activity when is created' do
    user = create :user
    game = create :game
    feed = create :feed, hours: 2, minutes: 1, user: user, game: game

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

    expect(feed.activity).to eq("On #{Time.now.day}/#{Time.now.month}/#{Time.now.year} at #{hour}:#{min}, #{user.username} started to play #{game.name} for 2 hours and 1 minutes!")
  end

  it 'hour must be integer' do

    begin
      create :feed, hours: 'asd'
      assert false
    rescue
      assert true
    end

  end

  it 'minute must be integer' do
    begin
      create :feed, minutes: 'asd'
      assert false
    rescue
      assert true
    end

  end

  it 'minutes < 60 && minutes >= 0' do
    begin
      create :feed, minutes: 60
      assert false
    rescue
      assert true
    end

    begin
      create :feed, minutes: -1
      assert false
    rescue
      assert true
    end
  end

  it 'hours <= 24 && hours >= 0' do
    begin
      create :feed, hours: 25
      assert false
    rescue
      assert true
    end

    begin
      create :feed, hours: -1
      assert false
    rescue
      assert true
    end
  end
end
