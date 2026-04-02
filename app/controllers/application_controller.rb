class ApplicationController < ActionController::API
  def require_login
    token = request.headers["Authorization"]&.split(" ")&.last
    if token
      decoded = JWT.decode(token, jwt_secret, true, algorithm: "HS256")
      @current_user = User.find(decoded[0]["user_id"])
    else
      render json: { error: "Please login first" }, status: :unauthorized
    end
  rescue JWT::DecodeError
    render json: { error: "Invalid token" }, status: :unauthorized
  end

  def current_user
    token = request.headers["Authorization"]&.split(" ")&.last
    if token
      decoded = JWT.decode(token, jwt_secret, true, algorithm: "HS256")
      @current_user = User.find(decoded[0]["user_id"])
    end
  rescue JWT::DecodeError
    nil
  end

  private

  def jwt_secret
    ENV['JWT_SECRET'] || 'natrang_super_secret_jwt_key_2026'
  end
end
