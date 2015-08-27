class Key < ActiveRecord::Base
  belongs_to :user

  before_create :set_keys

  validates :user_id, presence: true

  private

  def set_keys
    self.consumer_key = SecureRandom.base64(20)
    self.secret_key = SecureRandom.base64(20)
  end
end
