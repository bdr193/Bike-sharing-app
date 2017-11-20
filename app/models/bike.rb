class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  # validates :address, :description, :city, :name, :price_by_day, :category, presence: true
end
