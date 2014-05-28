class SessionsController < ApplicationController

  def new
    @user = User.new
  end

   def create
    
    user = User.find_by(name: params[:session][:name])
    
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to products_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  # def show
  #   sign_out
  #   redirect_to root_url
  # end

end
