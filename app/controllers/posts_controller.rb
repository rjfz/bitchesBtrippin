class PostsController < ApplicationController
  def index
    render json: Post.all  # json returns as json not as html
  end

  def show
    render json: Post.find(allowed_params[:id])
  end

  def create
    post = Post.new(create_params)
    if post.save
      render json: post
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Post.find(allowed_params[:id]).destroy
  end

  def update
    post = Post.find(allowed_params[:id])
    if post.update(create_params)
      render json: post
    else
      render json: post.errors, status: :unprocessable_entity
   end
  end

  private

  def allowed_params
    params.permit :id
  end

  def create_params
    params.permit :title, :content, :description, :author_id
  end
end
