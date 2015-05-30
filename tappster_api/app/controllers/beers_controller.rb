class BeersController < ApplicationController

#     beers GET    /beers(.:format)         beers#index
#           POST   /beers(.:format)         beers#create
#      beer GET    /beers/:id(.:format)     beers#show
#           PATCH  /beers/:id(.:format)     beers#update
#           PUT    /beers/:id(.:format)     beers#update
#           DELETE /beers/:id(.:format)     beers#destroy

  def index #GET
    @beers = Beer.all
    render json: @beers
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
