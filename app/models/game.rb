class Game < ActiveRecord::Base
  has_many :chats
  has_many :feeds

  mount_uploader :avatar
  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true
  validates :category, presence: true
end
