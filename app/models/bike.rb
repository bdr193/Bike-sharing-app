class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_attachment :photo
  # validates :address, :description, :city, :name, :price_by_day, :category, presence: true

  def self.available(city, start_date, end_date)
    @bikes = Bike.all
    start_date = "22-11-2017"
    end_date = "28-11-2017"
    city = "Berlin"
    @bikes = @bikes.where("city = :city  AND
                           bikes.start_date <= :start_date AND
                           bikes.end_date >= :start_date AND
                           bikes.end_date >= :end_date",
                           {city: city, start_date: start_date, end_date: end_date})

    bike_ids = @bikes.map(&:id)

    @bookings = Booking.where.not(bike_id: bike_ids)
    raise


    # sql = "
    #   SELECT *
    #   FROM bikes
    #   WHERE bike.id NOT IN (
    #     SELECT *
    #     FROM bookings,
    #     WHERE bookings.start_date <= std AND
    #     bookings.end_date >= std AND
    #     bookings.end_date >= edt
    #   )
    #   AND
    #   bikes.city = city
    #   bikes.start_date <= std AND
    #   bikes.end_date >= std AND
    #   bikes.end_date >= edt
    # "
    # ActiveRecord::Base.connection.execute(sql)
    #
    # Bike.joins("right join bookings ON bookings.bike_id = bikes.id").where("city = :city  AND
    #                              bikes.start_date <= :start_date AND
    #                              bikes.end_date >= :start_date AND
    #                              bikes.end_date >= :end_date",
    #                              {city: city, start_date: start_date, end_date: end_date})
  end

end
