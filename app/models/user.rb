class User < ActiveRecord::Base
  has_many :key

  has_many :feed
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  mount_uploader :avatar
  mount_uploader :avatar, AvatarUploader

    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
