class DancesController < ApplicationController
  before_action :require_login

  def index
    @dances = params[:type].present? && params[:type] != "all" ? Dance.where(dance_type: params[:type]) : Dance.all
    render json: @dances
  end

  def show
    @dance = Dance.find(params[:id])
    render json: @dance.as_json(
      include: :videos,
      only: [:id, :name, :dance_type, :region, :description, :history, :image_url, :mudras, :costumes, :instruments, :origin_year]
    )
  end
end
