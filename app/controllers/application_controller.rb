class ApplicationController < ActionController::API
  # before_action :authenticate_user

  private

  # def authenticate_user
  #   authentication_request do |token, options|
  #     User.find_by(auth_token: token)
  #   end
  #   # byebug
  #   # decoded_token = AuthenticationTokenServices.decode
  #   # return unless decoded_token

  #   # user_id = decoded_token[0]['user_id']
  #   # @current_user = User.find_by(id: user_id)

  #   # return unauthorized if @current_user.nil?
  # end

  def unauthorized
    render json: { message: 'Please log in' }, status: :unauthorized 
  end

end
