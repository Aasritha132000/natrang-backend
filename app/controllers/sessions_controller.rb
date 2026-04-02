class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = JWT.encode({ user_id: user.id }, jwt_secret, "HS256")
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

  def reset_admin
    user = User.find_by(email: 'admin@natrang.com')
    if user
      user.update(password: 'admin123', password_confirmation: 'admin123', is_admin: true)
      render json: { message: 'Admin password reset!' }
    else
      User.create!(name: 'Admin', email: 'admin@natrang.com', password: 'admin123', password_confirmation: 'admin123', is_admin: true)
      render json: { message: 'Admin created!' }
    end
  end

  def reset_all_users
    count = 0
    User.where(is_admin: false).each do |user|
      user.update(password: 'natrang123', password_confirmation: 'natrang123')
      count += 1
    end
    render json: { message: "#{count} users reset! New password: natrang123" }
  end
end
