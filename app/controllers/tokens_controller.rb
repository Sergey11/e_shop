class TokensController < ApplicationController

  def create_token
    @user = User.find_by(email: params[:session][:email])
    if @user.nil?
      flash.now[:error] = 'Invalid email'
      render "sessions/fogotpassword" 
    else
      @token = Token.generate_token(@user)
      flash.now[:error] = 'Please chek your email'
      UserMailer.fogot_password(@user, @token).deliver
      redirect_to new_session_path
  end
end

  def parse_token
    @token = Token.analyse(params[:token])
    if @token
      sign_in @token.user
      redirect_to reset_password_path
    else
      redirect_to root_url
    end
  end

  def reset_password
    @user = current_user
  end

  # def update_password
  #   @user = User.new(password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
  #   if @user.update_attributes(user_params)
  #     redirect_to new_session_path
  #   else
  #    redirect_to root_url
  #   end
  # end


end
 