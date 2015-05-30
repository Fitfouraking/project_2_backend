class LocationsController < ApplicationController

# locations GET    /locations(.:format)     locations#index
#           POST   /locations(.:format)     locations#create
#  location GET    /locations/:id(.:format) locations#show
#           PATCH  /locations/:id(.:format) locations#update
#           PUT    /locations/:id(.:format) locations#update
#           DELETE /locations/:id(.:format) locations#destroy

  def index #GET
    @locations = Location.all
    render json: @locations
  end

  def create #POST
    @location = Location.new(location_params)
    if @location.save
      render json: @location, status: :created, location: locations_url
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  def show #GET
    @location = Location.find(params[:id])
    render json: @location
  end

  def update #PATCH
    @location = Location.find(params[:id])
    if @location.update(location_params)
      head :no_content
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  def destroy #DELETE
    @location = Location.find(params[:id])
    @location.delete
    head :no_content
  end

  private
  def location_params
    params.require(:location).permit(:name, :address)
  end

end
