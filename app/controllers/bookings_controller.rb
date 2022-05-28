class BookingsController < ApplicationController
  before_action :set_booking, only: [:show,:edit,:update]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date,:end_date,:total)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
