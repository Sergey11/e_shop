class Admin::ProductsController < ApplicationController

 before_action :signed_in_user

  def edit
    @product = Product.find(params[:id])
  end


  def new
    @products = Product.new

  end

   def update
     @product = Product.find(params[:id])
     if @product.update_attributes(product_params)  #params[:product].permit(:name, :description, :fetures, :foto)
      flash[:success] = "Product updated"
        redirect_to admin_product_path
     else
        render 'new'
     end
  end
  
  def create
    @products= Product.new(product_params)
    @products.save!
    # Dirty hack to make product id available for uploader
    @products.foto = params[:product][:foto]
    @products.save!
    redirect_to admin_product_path(@products)

  end

def index
  @products = Product.all
end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to  admin_products_path 
  end

  def show
    @product = Product.find params[:id]

  end

    private

    def product_params
      params.require(:product).permit(:name, :description, :fetures, :foto)
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

end