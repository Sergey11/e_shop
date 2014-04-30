class ProductsController < ApplicationController
  
  def edit
    @product = Product.new
  end


  def new
    @products = Product.new

  end

  def create

    product = Product.new(product_params)
    product.save!
    @products = product
    product.foto.url 
    product.foto.current_path # => 'path/to/file.png'
    redirect_to @products

  end

  def show
    @products = Product.find params[:id]

  end

    private

    def product_params
      params.require(:product).permit(:name, :description, :fetures, :foto)
    end



end
