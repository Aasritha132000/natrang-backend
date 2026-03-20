class AdminController < ApplicationController
  before_action :require_login
  before_action :require_admin

  def dashboard
    render json: {
      dances: Dance.count,
      videos: Video.count,
      users: User.count,
      reviews: Review.count,
      quizzes: Quiz.count
    }
  end

  def videos
    videos = Video.includes(:dance).map do |v|
      {
        id: v.id,
        title: v.title,
        youtube_url: v.youtube_url,
        level: v.level,
        dance_name: v.dance.name,
        dance_id: v.dance_id
      }
    end
    render json: videos
  end

  def create_video
    dance = Dance.find(params[:dance_id])
    video = dance.videos.create!(
      title: params[:title],
      youtube_url: params[:youtube_url],
      level: params[:level]
    )
    render json: { message: "Video added!", video: video }
  end

  def delete_video
    video = Video.find(params[:id])
    video.destroy
    render json: { message: "Video deleted!" }
  end

  def dances
    render json: Dance.all
  end

  def update_dance
    dance = Dance.find(params[:id])
    dance.update(
      description: params[:description],
      history: params[:history],
      mudras: params[:mudras],
      costumes: params[:costumes],
      instruments: params[:instruments]
    )
    render json: { message: "Dance updated!" }
  end

  private

  def require_admin
    unless @current_user&.is_admin
      render json: { error: "Access denied! Admins only." }, status: :forbidden
    end
  end
end
