class Game < ActiveRecord::Base
  has_many :chat
  # belongs_to :chat

  # validates :course_id, presence: true

end
