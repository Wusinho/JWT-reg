class RegistrationsController < ApplicationController
  
  def create
    @user = User.new(registration_params)
    if @user.save
      token = AuthenticationTokenServices.encode(@user)
      render json: {
        user: @user.username,
        email: @user.email,
      }, status: :ok
    else
      render json: {error: 'Error creating user'}, status: :bad_request
    end

  end

  private

  def registration_params
    params.require(:registration).permit(:username, :email, :password, :password_confirmation )
  end

end