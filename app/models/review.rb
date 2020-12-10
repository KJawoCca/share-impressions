class Review < ApplicationRecord
  with_options presence: true do
    validates :title, :opus_title, :author_name, :text
  end

  belongs_to :user
  has_many :comments
  # has_many :tag_maps
  # has_many :tags, through: tag_maps
  has_one_attached :image
end
