module AuthenticateUser

  HMAC_SECRET = 'complicated_password'
  ALGORITHM = 'HS256'.freeze

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end

  def decoded_token
    return unless auth_header
    token = auth_header.split[1]
    # header: { 'Authorization': 'Bearer <token>' }
    begin
      decodedToken = JWT.decode(token, HMAC_SECRET, true, { algorithm: ALGORITHM })
    rescue JWT::DecodeError
      nil
    end
  end

  def current_user

    return unless decoded_token
    user_id = decoded_token[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

end
