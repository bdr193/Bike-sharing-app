class BookingsController < ApplicationController
  def index
    @user = current_user
    @bookings = Booking.all.where(user_id: @user.id)
  end
  def show
    puts "##################"
    params.inspect
    puts "##################"
    @booking = Booking.find(params[:id])
  end
  def new
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new
  end
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.bike = Bike.find(params[:bike_id])
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
