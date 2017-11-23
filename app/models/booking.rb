class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user
  validates :user_id, presence: true
end
