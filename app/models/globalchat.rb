class Globalchat < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :content, presence: true
  validates :user_name, presence: true
end
