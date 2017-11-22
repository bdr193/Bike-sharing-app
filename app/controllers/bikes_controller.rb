class BikesController < ApplicationController

  before_action :find_bike_id, only: [:show, :edit, :destroy, :update]

  def index
    @city = params[:bike][:city]
    @start_date = params[:bike][:start_date].to_date
    @end_date = params[:bike][:end_date].to_date
    @city.downcase!
    # @bikes = Bike.all.where(city: @city && :end_date >= @start_date)
    # city: @city &&
    # && :end_date >= @start_date
    # @bikes = Bike.all.where("city = :city  AND
    #                          start_date <= :start_date AND
    #                          end_date >= :start_date AND
    #                          end_date >= :end_date",
    #                          {city: @city, start_date: @start_date, end_date: @end_date})
    @bikes_with_coordinates = Bike.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@bikes_with_coordinates) do |bike, marker|
      marker.lat bike.latitude
      marker.lng bike.longitude
      marker.infowindow render_to_string(partial: "/bikes/map_box", locals: { bike: bike })
    end
  end

  def show
  end

  def edit
  end

  def update
    @bike.update(bike_params)
    redirect_to(@bike)
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      redirect_to @bike
    else
      render :new
    end
  end

  def destroy
    @bike.destroy
    redirect_to bikes_path
  end

  protected

  def bike_params
    params.require(:bike).permit(:name, :photo, :photo_cache, :category, :address, :description, :city, :price_by_day, :user)
  end

  def find_bike_id
    @bike = Bike.find(params[:id])
  end

end
