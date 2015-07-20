class Feed < ActiveRecord::Base

  validates :user_id, presence: true
  validates :game_id, presence: true
  validates :hours, presence: true
  validates :minutes, presence: true

  validate :exist_user
  validate :exist_game

  before_create :create_activity

  private

  def create_activity
    self.activity = "On #{Time.now.day}/#{Time.now.month}/#{Time.now.year} at #{Time.now.hour}:#{Time.now.min}, #{User.find(self.user_id).username} started to play #{Game.find(self.game_id).name} for #{self.hours} hours and #{self.minutes} minutes!"
  end

  def exist_user
  end

  def exist_game
  end

end
