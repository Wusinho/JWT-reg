class SessionsController < ApplicationController
  before_action :set_user, only: [:create]

  def create
    token = AuthenticationTokenServices.encode(@user)
    render json: {
      username: @user.username,
      email: @user.email,
      token: token,
      isLoggedIn: true
    }
  end

  private

  def set_user
    begin
      @user = User.find(params[:email])&.authenticate(params[:password])
    rescue => e
      render json: { error: e, status: :unauthorized}
    end
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end