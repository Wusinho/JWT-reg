class RegistrationsController < ApplicationController
  
  def create
    begin
    @user = User.create!(registration_params)
      token = AuthenticationTokenServices.encode(@user)
      render json: {
        user: @user.username,
        email: @user.email,
      }, 
      status: :ok
      rescue => e
      render json: {error: e, status: :bad_request}.to_json
    end

  end

  private

  def registration_params
    params.require(:registration).permit(:username, :email, :password, :password_confirmation )
  end

end