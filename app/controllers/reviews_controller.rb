class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_review, only: [:show, :edit, :destroy]

  def index
    @reviews = Review.order("created_at DESC")
  end

  def new
    @review = ReviewsTag.new
  end

  def create
    @review = ReviewsTag.new(review_tag_params)
    if @review.valid?
      @review.save
      return redirect_to root_path
    else
      render :new
    end
    # @review = Review.new(review_params)
    # if @review.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end

  def show
  end

  def edit
  end

  def update
    @review = 
    if @review.update(review_params)
      redirect_to edit_review_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if current_user.id != @review.user.id
      redirect_to root_path
    end
    @review.destroy
    redirect_to root_path
  end
  
  private
  def review_tag_params
    params.require(:reviews_tag).permit(:image, :title, :opus_title, :author_name, :authors_website, :text, :tag_name).merge(user_id: current_user.id)
    # params.require(:review).permit(:image, :title, :opus_title, :author_name, :authors_website, :text).merge(user_id: current_user.id)
  end

  def find_review
    @review = Review.find(params[:id])
  end

end
