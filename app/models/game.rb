class Game < ActiveRecord::Base
  has_many :chat

  validates :name, presence: true
  validates :category, presence: true

end
