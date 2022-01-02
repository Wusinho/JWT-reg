class AuthenticationTokenServices

  HMAC_SECRET = 'complicated_password'
  ALGORITHM = 'HS256'.freeze

  def self.encode(user)
    exp = 72.hours.from_now.to_i

    payload = {
      username: user.username,
      user_id: user.id,
      exp: exp
    }
    JWT.encode payload, HMAC_SECRET, ALGORITHM
  end
end
