class Chat < ActiveRecord::Base
  belongs_to :game

  validates :game_id, presence: true
  validates :user, presence: true
  validates :content, presence: true
end
