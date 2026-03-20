class BookmarksController < ApplicationController
  before_action :require_login

  def index
    bookmarks = @current_user.bookmarked_dances
    render json: bookmarks
  end

  def create
    bookmark = @current_user.bookmarks.find_or_create_by(dance_id: params[:dance_id])
    render json: { message: "Bookmarked!", dance_id: params[:dance_id] }
  end

  def destroy
    bookmark = @current_user.bookmarks.find_by(dance_id: params[:id])
    bookmark&.destroy
    render json: { message: "Removed bookmark!", dance_id: params[:id] }
  end
end
