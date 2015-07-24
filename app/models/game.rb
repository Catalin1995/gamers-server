class Game < ActiveRecord::Base
  has_many :chat

  has_many :feed

  mount_uploader :avatar
  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  validates :category, presence: true

end
