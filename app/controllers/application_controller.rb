class ApplicationController < ActionController::API
  include Pundit
  before_action :authenticate_token!
  after_action :verify_authorized

  attr_reader :current_user

  private

    def authenticate_token!
      payload = JsonWebToken.decode(auth_token)
      @current_user = User.find(payload["sub"])
    rescue JWT::ExpiredSignature
      render json: {errors: ["Token has expired"]}, status: :unauthorized
    rescue JWT::DecodeError
      render json: {errors: ["Invalid auth token"]}, status: :unauthorized
    end

    def auth_token
      @auth_token ||= request.headers.fetch("Authorization", "").split(" ").last
    end
end
