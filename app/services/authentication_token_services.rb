class AuthenticationTokenServices

  HMAC_SECRET = 'complicated_password'
  ALGORITHM = 'HS256'.freeze

  def self.encode(payload)
    JWT.encode(payload, HMAC_SECRET, ALGORITHM)
  end

  def self.auth_header
    request.headers['Authorization']
  end

  def self.decode(token)
    return unless auth_header

    token = auth_header.split[1]
    begin
      JWT.decode(token, HMAC_SECRET, true, ALGORITHM)
    rescue
      nil
    end

  end

end