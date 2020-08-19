class UsersController < ApplicationController
  def index
    render json: User.all  # json returns as json not as html
  end

  def show
    render json: User.find(allowed_params[:id])
  end

  def create
    user = User.new(create_params)
    if user.save
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    User.find(allowed_params[:id]).destroy
  end

  def update
    user = User.find(allowed_params[:id])
    if user.update(create_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
   end
  end

  def posts
    render json: User.find(allowed_params[:id]).posts
  end
  private

  def allowed_params
    params.permit :id
  end

  def create_params
    params.permit :username, :password, :email
  end
end
