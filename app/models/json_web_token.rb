class JsonWebToken
  def self.encode(payload)
    expiration = 7.days.from_now.to_i
    JWT.encode payload.merge(exp: expiration), Rails.application.secrets.secret_key_base, 'HS256'
  end

  def self.decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base, 'HS256').first
  end
end
