class BookingsController < ApplicationController
  before_action :set_booking, only: [:show,:edit,:update]

  def index
    @mybookings = current_user.bookings

    @bookings = Booking.joins(:item).where(item: {user_id: current_user.id} )

  end

  def show
  end

  def edit
  end

  def update
    @booking.update(state: "Approved")
    if @booking.state == "Approved"
      flash[:success] = "Booking successfully Approved"
      redirect_to bookings_path
    else
      flash[:error] = "Booking not approved"
      redirect_to bookings_path
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
