class ProfileController < ApplicationController
  before_action :require_login

  def update
    if @current_user.update(name: params[:user][:name], email: params[:user][:email])
      render json: { user: { id: @current_user.id, name: @current_user.name, email: @current_user.email } }
    else
      render json: { errors: @current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def change_password
    if @current_user.authenticate(params[:user][:current_password])
      if @current_user.update(password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
        render json: { message: "Password changed successfully!" }
      else
        render json: { errors: @current_user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Current password is incorrect!" }, status: :unauthorized
    end
  end
end
