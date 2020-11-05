class TripsController < ApplicationController

  def show
    @trip = Trip.find_by(id: params[:id])
    @driver = Driver.where(driver_id: @trip.id)
    @passenger = Passenger.where(passenger_id: @trip.id)
    if @trip.nil?
      redirect_to trip_path
      return
    end
  end

  def new
    @trip = Trip.new
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
