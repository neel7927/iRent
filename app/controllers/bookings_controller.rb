class BookingsController < ApplicationController
  before_action :set_booking, only: [:show,:edit,:update]

  def index
    @bookings = current_user.bookings
  end

  def show
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to item_booking_path(@booking)
    else
      render :new
    end
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @item = Item.find(params[:item_id])
    @booking.item = @item
    book_start_date =  Date.parse(params[:booking][:start_date])
    book_end_date =  Date.parse(params[:booking][:end_date])
    @booking.total = @booking.item.price * (book_end_date - book_start_date).to_i
    if @booking.save
      redirect_to bookings_path
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
