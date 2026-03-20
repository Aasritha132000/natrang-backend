class ReviewsController < ApplicationController
  before_action :require_login

  def index
    dance = Dance.find(params[:dance_id])
    reviews = dance.reviews.includes(:user).map do |r|
      {
        id: r.id,
        rating: r.rating,
        comment: r.comment,
        user_name: r.user.name,
        created_at: r.created_at.strftime("%d %b %Y")
      }
    end
    avg = dance.reviews.average(:rating)&.round(1) || 0
    render json: { reviews: reviews, average: avg, total: reviews.count }
  end

  def create
    dance = Dance.find(params[:dance_id])
    existing = @current_user.reviews.find_by(dance_id: dance.id)
    if existing
      existing.update(rating: params[:rating], comment: params[:comment])
      render json: { message: "Review updated!" }
    else
      @current_user.reviews.create!(dance_id: dance.id, rating: params[:rating], comment: params[:comment])
      render json: { message: "Review added!" }
    end
  end

  def destroy
    review = @current_user.reviews.find(params[:id])
    review.destroy
    render json: { message: "Review deleted!" }
  end
end
