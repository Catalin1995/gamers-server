class Chat < ActiveRecord::Base
  belongs_to :game
  # has_many :game

  # validates :game_id, presence: true

end
