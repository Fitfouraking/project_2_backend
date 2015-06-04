class BeersController < ApplicationController

  def index #GET
    @beers = Beer.all
    render json: @beers
  end

  def show_name
    fuzzy = FuzzyMatch.new(Beer.all, :read => :name)
    @beer = fuzzy.find(params[:name])

    # @beer = Location.find_by name: params[:name]
    render json: @beer
  end

  def create #POST
    @beer = Beer.new(beer_params)
    if @beer.save
      render json: @beer, status: :created, location: beers_url
    else
      render json: @beer.errors, status: :unprocessable_entity
    end
  end

  def show #GET
    @beer = Beer.find(params[:id])
    render json: @beer
  end

  def update #PATCH
    @beer = Beer.find(params[:id])
    if @beer.update(beer_params)
      head :no_content
    else
      render json: @beer.errors, status: :unprocessable_entity
    end
  end

  def destroy #DELETE
    @beer = Beer.find(params[:id])
    @beer.delete
    head :no_content
  end

  private
  def beer_params
    params.require(:beer).permit(:name, :brewery, :style, :abv)
  end

end
