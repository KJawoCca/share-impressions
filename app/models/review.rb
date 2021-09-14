class Review < ApplicationRecord

  belongs_to :user
  # has_many :comments
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  has_one_attached :image
end
