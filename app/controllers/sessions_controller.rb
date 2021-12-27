class SessionsController < ApplicationController
  before_action :set_user

  def create
    token = AuthenticationTokenServices.encode(@user)
  end



  private

  def set_user
    @user = User.find_by(params[:email])
    
  end

  def session_params
    params.permit(:email, :password)
  end
end