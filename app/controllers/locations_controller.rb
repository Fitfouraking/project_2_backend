class LocationsController < ApplicationController

  def index #GET
    @locations = Location.all
    render json: @locations
  end

  def show_name
    fuzzy = FuzzyMatch.new(Location.all, :read => :name)
    @location = fuzzy.find(params[:name])



    # @location = Location.find_by name: params[:name]
    render json: @location
  end

  def create #POST
    @location = Location.new(location_params)
    if @location.save
      render json: @location, status: :created, location: locations_url
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  def add_beer
    @location = Location.find(params[:id])
    @beer = Beer.find(params[:beer])
    @location.beers << @beer
    head :no_content
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

  def remove_beer #DELETE
    @list = List.where(beer_id: params[:beer], location_id: params[:id]).first
    @list.destroy
    head :no_content
  end

  private
  def location_params
    params.require(:location).permit(:name, :address)
  end

end
