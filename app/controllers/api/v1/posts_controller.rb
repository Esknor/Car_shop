class Api::V1::PostsController < ApplicationController

  respond_to :json

  def show
    respond_with Post.find(params[:id])
  end

  # Creating posts
  def create
    post=Post.new(post_params)

    if post.save 
      render json: post, status: 201 
    else
      render json: { errors: post.errors}, status: 422
    end
  end

  # Updating posts
  def update
    post = Post.find(params[:id])

    if post.update(post_params)
      render json: post, status: 200
    else
      render json: { errors: post.errors }, status: 422
    end
  end

  # Deleting posts
  def destroy
    post = Post.find(params[:id])
    user.destroy
    head 204
  end

  private

  def post_params
   params.require(:user).permit(:title, :text)
  end
end

