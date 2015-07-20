class Game < ActiveRecord::Base
  has_many :chat

  has_many :feed

  validates :name, presence: true
  validates :category, presence: true

end
