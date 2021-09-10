class LoginController < ApplicationController
  skip_before_action :authenticate_token!
  skip_after_action :verify_authorized

  def create
    user = User.find_by(email: params[:user][:email])
    if user.authenticate(params[:user][:password])
      render json: {token: JsonWebToken.encode({sub: user.id})}
    else
      render json: { errors: ["Invalid user"]}
    end
  end
end
