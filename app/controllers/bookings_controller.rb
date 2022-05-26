class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
  end

  def edit
  end

  def new
    @booking = Booking.new
  end

  def create
  end
end
