class ReviewsTag

  include ActiveModel::Model
  attr_accessor :title, :opus_title, :author_name, :authors_website, :text, :user_id, :tag_name, :tag_attr, :image

  with_options presence: true do
    validates :title, :text, :opus_title, :author_name
    validates :tag_name
  end

  def save
    review = Review.create(image: image, title: title, opus_title: opus_title, author_name: author_name, authors_website: authors_website, text: text, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    TagMap.create(review_id: review.id, tag_id: tag.id)
  end

end