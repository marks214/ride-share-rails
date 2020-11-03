class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find_by(id: params[:id])
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    result = @driver.save

    if result
      # redirect_to some path (e.g., driver_path(@path.id))
    else
      render :new
    end
  end

  private

  def driver_params
    return params.require(:driver).permit(:id, :ride_id, :name, :vin, :available, :created_at, :updated_at)
  end
end
