class ReviewsController < ApplicationController
  def new
    @animal = Animal.find(params[:animal_id])
    @review = Review.new
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @review = Review.new(review_params)
    @review.animal = @animal
    @review.save
    redirect_to animal_path(@animal)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
