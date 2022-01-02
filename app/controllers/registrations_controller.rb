class RegistrationsController < ApplicationController
  
  def create
    begin
    user = User.create!(registration_params)
      token = AuthenticationTokenServices.encode(user)
      render json: {
        username: user.username,
        email: user.email,
        token: token,
        isLoggedIn: true
      } 
      rescue => e
      render json: {error: e, status: :bad_request}
    end

  end

  private

  def registration_params
    params.require(:registration).permit(:username, :email, :password, :password_confirmation )
  end

end