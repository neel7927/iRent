class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
  end

  def edit
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review was successfully deleted"
    redirect_to reviews_path
  end
end
