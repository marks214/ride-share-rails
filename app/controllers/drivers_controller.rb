class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end


  private

  def driver_params
    # return params.require(:trip).permit(fields)
  end
end
