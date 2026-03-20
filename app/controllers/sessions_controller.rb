class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = JWT.encode({ user_id: user.id }, Rails.application.secret_key_base, "HS256")
      render json: { 
        token: token, 
        user: { 
          id: user.id, 
          name: user.name, 
          email: user.email,
          is_admin: user.is_admin
        } 
      }
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    render json: { message: "Logged out successfully" }
  end
end
