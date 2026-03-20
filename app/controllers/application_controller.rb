class ApplicationController < ActionController::API
  def require_login
    token = request.headers["Authorization"]&.split(" ")&.last
    if token
      decoded = JWT.decode(token, Rails.application.secret_key_base, true, algorithm: "HS256")
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
    decoded = JWT.decode(token, Rails.application.secret_key_base, true, algorithm: "HS256")
    @current_user = User.find(decoded[0]["user_id"])
  end
rescue JWT::DecodeError
  nil
end

end
