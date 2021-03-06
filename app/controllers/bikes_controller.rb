class BikesController < ApplicationController

  before_action :find_bike_id, only: [:show, :edit, :destroy, :update]

  def info(opts = {})
    opts.each do |key, value|
      session[key.to_sym] = value
    end
  end

  def index
    @start_date = params[:bike][:start_date] || session[:start_date]
    @end_date = params[:bike][:end_date] || session[:end_date]
    @lat = params[:bike][:lat] || session[:lng]
    @lng = params[:bike][:lng] || session[:lat]


    # @bikes = Bike.near([@lat, @lng], 100)
    # removed it for testing purposes
    # @bikes = @bikes.where("start_date <= :start_date AND
    #   end_date >= :start_date AND
    #   end_date >= :end_date",
    #   {start_date: @start_date, end_date: @end_date})


      @bikes = @bikes.all
    if params[:bike][:category].present?
      @category = params[:bike][:category]

      #info(category: @category)
      #puts session.inspect

      @bikes = @bikes.where(category: @category)
    end

      if params[:bike][:price_by_day].present?
        @price_by_day = params[:bike][:price_by_day]
        case @price_by_day
          when "< 20€"
            @bikes = @bikes.where("price_by_day <= 20")
          when "20€ - 50€"
            @bikes = @bikes.where("price_by_day > 20 AND
            price_by_day <= 50")
          when "50€ - 70€"
            @bikes = @bikes.where("price_by_day > 50 AND
            price_by_day <= 70")
          when "70€ - 100€"
            @bikes = @bikes.where("price_by_day > 70 AND
            price_by_day <= 100")
          when "100€ <"
            @bikes = @bikes.where("price_by_day > 100")
          end
      end


      info(start_date: @start_date, end_date: @end_date, lat: @lat, lng: @lng)

      @bikes_with_coordinates = @bikes.where.not(latitude: nil, longitude: nil)
      @hash = Gmaps4rails.build_markers(@bikes_with_coordinates) do |bike, marker|
        marker.lat bike.latitude
        marker.lng bike.longitude
        marker.infowindow render_to_string(partial: "/bikes/map_box", locals: { bike: bike })
      end
  end

  def offers
    @bikes = Bike.where(user_id: current_user.id)
  end

  def show
    @hash = Gmaps4rails.build_markers(@bike) do |bike, marker|
      marker.lat bike.latitude
      marker.lng bike.longitude
      marker.infowindow render_to_string(partial: "/bikes/map_box", locals: { bike: bike })
    end
    @booking = Booking.new
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
    @bike.user_id = current_user.id
    if @bike.save
      redirect_to offers_bikes_path(@bike)
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
    params.require(:bike).permit(:name, :start_date, :end_date, :photo, :photo_cache, :category, :address, :description, :city, :price_by_day, :user)
  end

  def find_bike_id
    @bike = Bike.find(params[:id])
  end

end
