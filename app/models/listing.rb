class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :pictures, :dependent => :destroy
  has_many :taggings
  has_many :tags, through: :taggings

  scope :by_category, -> (category_id) { where(:category_id => category_id) }
  scope :by_user, -> (user_id) {where(:user_id => user_id)}
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
    listings = []
    logger.debug "In listing model: About to do a fuzzy match - on tag: #{name}"
    Tag.find_by_fuzzy_name(name).each {|tag|  listings.append(tag.listings)}
    return listings
  end

end
