class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    #byebug
    params[:user_id] ?
    items = User.find(params[:user_id]).items :
    items = Item.all
    render json: items, include: :user 
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def create
    params[:user_id] ?
    item = Item.create(item_params):
    null
    
 
    User.find(params[:user_id]).items << item 
    render json: item, include: :user, status: :created
  end

  private

  def record_not_found
    render json: { errors: "record not found" }, status: :not_found
  end

  def unprocessable
    render json: { errors: "unprocessable" }, status: :unprocessable_entity
  end

  def item_params
    params.permit(:name, :description, :price)
  end

end
