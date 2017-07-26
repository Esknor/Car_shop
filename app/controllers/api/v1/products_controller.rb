class Api::V1::ProductsController < ApplicationController

  respond_to :json

  def show
    respond_with Product.find(params[:id])
  end

  # Creating products
  def create
    product=Product.new(product_params)

    if product.save 
      render json: product, status: 201 
    else
      render json: { errors: product.errors}, status: 422
    end
  end

  # Updating users
  def update
    product = Product.find(params[:id])

    if product.update(product_params)
      render json: user, status: 200
    else
      render json: { errors: product.errors }, status: 422
    end
  end

  # Deleting product
  def destroy
    product = Product.find(params[:id])
    product.destroy
    head 204
  end

  private

  def product_params
   params.require(:product).permit(:name,:img , :category_id, :price, :text)
  end
end

