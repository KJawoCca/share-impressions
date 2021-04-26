class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_review, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to edit_review_path(params[:id])
    else
      render :edit
    end
  end
  
  private
  def review_params
    params.require(:review).permit(:image, :title, :opus_title, :author_name, :authors_website, :text).merge(user_id: current_user.id)
  end

  def find_review
    @review = Review.find(params[:id])
  end

end
