class BookingsController < ApplicationController
  before_action :require_login

  def index
    if @current_user.is_admin
      bookings = Booking.includes(:user, :dance).all.order(created_at: :desc)
    else
      bookings = Booking.includes(:dance).where(user: @current_user).order(created_at: :desc)
    end

    render json: bookings.map { |b| {
      id: b.id,
      date: b.date,
      time_slot: b.time_slot,
      level: b.level,
      status: b.status,
      notes: b.notes,
      dance_name: b.dance.name,
      dance_id: b.dance_id,
      user_name: b.user.name,
      user_email: b.user.email,
      created_at: b.created_at.strftime('%d %b %Y')
    }}
  end

  def create
    dance = Dance.find(params[:dance_id])

    unless Booking.slot_available?(params[:dance_id], params[:date], params[:time_slot])
      render json: { error: 'This slot is already booked! Please choose another.' }, status: :unprocessable_entity
      return
    end

    booking = Booking.create!(
      user: @current_user,
      dance: dance,
      date: params[:date],
      time_slot: params[:time_slot],
      level: params[:level],
      notes: params[:notes],
      status: 'pending'
    )

    render json: { message: 'Booking request sent!', booking: booking }
  end

  def update
    booking = Booking.find(params[:id])

    unless @current_user.is_admin
      render json: { error: 'Only admins can update bookings!' }, status: :forbidden
      return
    end

    booking.update(status: params[:status])
    render json: { message: "Booking #{params[:status]}!", booking: booking }
  end
end
