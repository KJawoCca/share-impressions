class Tag < ApplicationRecord
  validates :tag_name, uniqueness: true

  has_many :tag_maps
  has_many :reviews, through: :tag_maps
end
