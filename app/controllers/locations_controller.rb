class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  
  def import
    Location.my_import(params[:file])
    redirect_to location_url, notice: "Successfuly Imported Data!"
  end

end
