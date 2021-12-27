class AuthenticationTokenServices

  def self.encode(payload)
    token = JWT.encode(payload, HMAC_SECRET, ALGORITHM)
  end

  def auth_header
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

  private

  def HMAC_SECRET
    'complicated_password'
  end

  def ALGORITHM
    'HS256'
  end
  
end