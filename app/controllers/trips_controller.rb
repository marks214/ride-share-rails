class TripsController < ApplicationController

  def index
    if params[:passenger_id]
      @passenger = Passenger.find_by(id: params[:passenger_id]) #key from url path
      @trips = @passenger.trips
    elsif params[:driver_id]
      @driver = Driver.find_by(id: params[:driver_id])
      @trips = @driver.trips
    else
      @trips = Trip.all
    end
  end

  def show
    @trip = Trip.find_by(id: params[:id])
    @driver = @trip.driver
    @passenger = @trip.passenger
    if @trip.nil?
      redirect_to trip_path
      return
    end
  end

  def new
    if params[:passenger_id]
      @passenger = Passenger.find_by(id: params[:passenger_id])
      @trip = @passenger.trips.new
    elsif params[:driver_id]
      @driver = Driver.find_by(id: params[:driver_id])
      @trip = @driver.trips.new
    else
      @trip = Trip.new
    end

  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to trip_path(@trip)
      return
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])

    if @trip.nil?
      redirect_to trip_path # change later to  driver or passenger's list of trips
      return
    end
  end

  def update
    @trip = Trip.find_by(id: params[:id])

    if @trip.nil?
      redirect_to trip_path # change later to  driver or passenger's list of trips
    else
      @trip.update
      redirect_to trip_path # change later to  driver or passenger's list of trips
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])

    if @trip.nil?
      redirect_to trip_path # change later to  driver or passenger's list of trips
      return
    elsif @trip.destroy
      redirect_to trip_path # change later to  driver or passenger's list of trips
  end
end

  private

  def trip_params
    return params.require(:trip).permit(:id, :driver_id, :passenger_id, :date, :rating, :cost)
  end
end
