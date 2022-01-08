class SessionsController < ApplicationController
  before_action :set_user, only: [:create]

  def create

    return authentication_error if @user.nil? || !@user.authenticate(session_params[:password])

    token = AuthenticationTokenServices.encode(@user)
    render json: {
      username: @user.username,
      email: @user.email,
      token: token,
      isLoggedIn: true,
      status: :ok
    }
  end

  private

  def set_user
      @user = User.find_by(email: session_params[:email])
  end

  def authentication_error
    render json: { error: 'Invalid password or/and e-mail.', status: :unauthorized} 
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end