class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to album_path(@album)
    else
      render 'new'
  end

  private
    def review_params
      params.require(:review).permit(:rating, :comment)
    end

end
