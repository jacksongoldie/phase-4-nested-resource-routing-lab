class UsersController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    render json: user, include: :items
  end


  private 

  def user
    User.find(params[:id])
  end

  def record_not_found
    render json: { error: "record not found" }, status: :not_found 
  end

end
