class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_attachment :photo
  # validates :address, :description, :city, :name, :price_by_day, :category, presence: true


  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
