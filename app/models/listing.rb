class Listing < ApplicationRecord
  belongs_to :category
  has_many :pictures, :dependent => :destroy
  has_many :taggings
  has_many :tags, through: :taggings

  scope :by_category, -> (category_id) { where(:category_id => category_id) }
  scope :has_picture, -> { includes(:pictures).where.not(pictures: {id: nil}) }

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).listings
  end

end
