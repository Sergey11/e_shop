class AdminsController < ApplicationController

  def new
    @products = Product.new
  end
  
  def index
    @products = Product.all
  end

  
  def update
     @product = Product.find(params[:id])

     if @product.update_attributes(params[:name])
        flash[:success] = "Product updated."
        redirect_to @product
     else
        ender 'new'
     end

  end


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
