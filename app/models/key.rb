class Key < ActiveRecord::Base
  belongs_to :user

  validates :consumer_key, presence: true
  validates :secret_key, presence: true
  validates :user_id, presence: true

end
