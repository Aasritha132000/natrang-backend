class ProgressesController < ApplicationController
  before_action :require_login

  def index
    completed_video_ids = @current_user.progresses.where(completed: true).pluck(:video_id)
    render json: { completed_video_ids: completed_video_ids, total: completed_video_ids.count }
  end

  def create
    progress = @current_user.progresses.find_or_initialize_by(video_id: params[:video_id])
    progress.completed = true
    progress.save
    total = @current_user.progresses.where(completed: true).count
    render json: { message: "Marked as completed!", total: total }
  end

  def destroy
    progress = @current_user.progresses.find_by(video_id: params[:id])
    progress&.destroy
    total = @current_user.progresses.where(completed: true).count
    render json: { message: "Marked as incomplete!", total: total }
  end
end
