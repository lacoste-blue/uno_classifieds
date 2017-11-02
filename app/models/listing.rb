class Listing < ApplicationRecord
  belongs_to :category
  has_many :pictures, :dependent => :destroy

  scope :by_category, -> (category_id) { where(:category_id => category_id) }
  scope :has_picture, -> { includes(:pictures).where.not(pictures: {id: nil}) }
end
