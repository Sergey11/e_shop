class AdminsController < ApplicationController

  def new
    @products = Product.new
  end
  
  def index
    @products = Product.all
  end

  def create

    product = Product.new(product_params)
    product.save!
    @products = product
    product.foto.url 
    product.foto.current_path # => 'path/to/file.png'
    redirect_to action: 'index'

  end

 
  # def update
  #    @product = Product.find(params[:id])

  #    if @product.update_attributes(params[:product])
  #       flash[:success] = "Product updated."
  #       redirect_to @product
  #    else
  #       ender 'new'
  #    end

  # end


  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to action: 'index'
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
