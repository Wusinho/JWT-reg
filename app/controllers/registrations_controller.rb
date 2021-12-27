class RegistrationsController < ApplicationController
  
  def create
    @user = User.create(user_params)

    if @user.save
      token = AuthenticationTokenServices.encode(@user)
      render json: {
        user: @user.username,
        email: @user.email,
      }, status: :ok
    else
      render json: {error: 'Error creating'}, status: :bad_request
    end

  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation )
  end

end