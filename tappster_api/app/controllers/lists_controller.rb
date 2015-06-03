class ListsController < ApplicationController

     #  lists GET    /lists(.:format)         lists#index
     #      POST   /lists(.:format)         lists#create
     # list GET    /lists/:id(.:format)     lists#show
     #      PATCH  /lists/:id(.:format)     lists#update
     #      PUT    /lists/:id(.:format)     lists#update
     #      DELETE /lists/:id(.:format)     lists#destroy


#only need post, get, & delete
  def create
    @list = List.new(list_params)
    if @list.save
      render json: @list, status: :created, location: lists_url
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def show_location #this needs to change to show_location and another method for show_beers
     @list = List.where location_id: params[:id]
    render json: @list
  end

  def show_beers
    @list = List.where beer_id: params[:id]
    render json: @list
  end

  def destroy
    @list = List.find(params[:id])
    @list.delete
    head :no_content
  end

  private
  def list_params
    params.require(:list).permit(:beer_id, :location_id)
  end

end
