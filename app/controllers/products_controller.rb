class ProductsController < ApplicationController
  
  def edit
    @product = Product.find(params[:id])
  end


  def new
    @products = Product.new

  end

   def update
     @product = Product.find(params[:id])

     if @product.update_attributes(params[:product].permit(:name, :description, :fetures, :foto))
        redirect_to @product
     else
        render 'new'
     end

  end

  
  def create
    product = Product.new(product_params)
    product.save!
    @products = product
    product.foto.url 
    product.foto.current_path # => 'path/to/file.png'
    redirect_to @products
  end

def index
  @products = Product.all
end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to action: 'index'
  end

  def show
    @product = Product.find params[:id]

  end

    private

    def product_params
      params.require(:product).permit(:name, :description, :fetures, :foto)
    end



end
