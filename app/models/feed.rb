class Feed < ActiveRecord::Base

  belongs_to :game
  belongs_to :user

  validates :user, presence: true
  validates :game, presence: true
  validates :hours, presence: true
  validates :minutes, presence: true

  validate :validate_time

  before_create :create_activity

  private

  def create_activity

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

    self.activity = "On #{Time.now.day}/#{Time.now.month}/#{Time.now.year} at #{hour}:#{min}, #{user.username} started to play #{game.name} for #{self.hours} hours and #{self.minutes} minutes!"
  end

  def validate_time
  end

end
