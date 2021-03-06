class BookingsController < ApplicationController
  def index
    @user = current_user
    @bookings = Booking.all.where(user_id: @user.id)
  end
  def show
    @booking = Booking.find(params[:id])
    @booking_amount = ((@booking.end_date - @booking.start_date) * @booking.bike.price_by_day).to_i
  end
  def new
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new
  end
  def create
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.bike = @bike
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end
  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :amount, :is_available)
  end
end
