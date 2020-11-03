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

  def edit
    @driver = Driver.find_by(id: params[:id])

    if @driver.nil?
      # redirect_to drivers_path?
      # return
    end
  end

  def update
    @driver = Driver.find_by(id: params[:id])

    if @driver.nil?
      # redirect_to root_path?
      # return
    end

    result = @driver.update(driver_params)

    if result
      redirect_to drivers_path
    else
      render :edit
    end
  end

  def delete
    driver = Driver.find_by(id: params[:id])

    if driver.nil?
      redirect_to root_path
      return
    elsif driver.destroy
      redirect_to drivers_path
      return
    end
  end

  def confirm
    @driver = Driver.find_by(id: params[:id])
  end


  private

  def driver_params
    return params.require(:driver).permit(:id, :ride_id, :name, :vin, :available, :created_at, :updated_at)
  end
end
