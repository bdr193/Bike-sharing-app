class BikesController < ApplicationController

  before_action :find_bike_id, only: [:show, :edit, :destroy, :update]

  def index
    @city = params[:bike][:city]
    @city.downcase!
    @bikes = Bike.all.where(city: @city)

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
