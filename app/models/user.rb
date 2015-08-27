class User < ActiveRecord::Base
  has_many :keys
  has_many :feeds

  validates :username, presence: true

  mount_uploader :avatar
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
end
