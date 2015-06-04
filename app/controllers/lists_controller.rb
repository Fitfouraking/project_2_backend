class ListsController < ApplicationController

#only need post, get, & delete
  def create
    @list = List.new(list_params)
    if @list.save
      render json: @list, status: :created, location: lists_url
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def show_location
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
    params.require(:list).permit(:beer_id, :location_id, :created_at, :updated_at)
  end

end
