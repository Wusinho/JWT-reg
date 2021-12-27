class ApplicationController < ActionController::API
  # before_action :authenticate_user

  # private

  # def authenticate_user
  #   token, _options = token_and_options(request)
  #   return render json: { error: 'You must log in first.' }, status: :unauthorized if token.nil?

  #   message = AuthenticationTokenService.decode(token)
  #   return render json: message, status: :unauthorized if message[:error]

  #   user_id = message[:user_id]
  #   @current_user = User.find(user_id)
  # rescue ActiveRecord::RecordNotFound
  #   render json: { error: 'No user found.' }, status: :unauthorized
    
  # end
end
