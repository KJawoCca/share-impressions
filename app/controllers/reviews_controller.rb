class ReviewsController < ApplicationController
  def index
    @reviews = Review.order("created_at DESC")
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private
  def review_params
    params.require(:review).permit(:image, :title, :opus_title, :author_name, :authors_website, :text).merge(user_id: current_user.id)
  end

end
