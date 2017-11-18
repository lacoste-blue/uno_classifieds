require 'elasticsearch/model'
class Listing < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :pictures, :dependent => :destroy
  has_many :taggings
  has_many :tags, :through => :taggings

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  scope :category_id, ->(category_id) { where(:category_id => category_id) }
  scope :user_id, ->(user_id) { where(:user_id => user_id) }
  scope :has_picture, -> { includes(:pictures).where.not(:pictures => { :id => nil }) }

  validates :category, :title, :presence => true

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(:name => name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(', ')
  end

  def self.tag(name)
    listings = []
    logger.debug "In listing model: About to do a fuzzy match - on tag: #{name}"
    Tag.find_by_fuzzy_name(name).each do |tag|
      listings += tag.listings
    end
    listings
  end
end

# Delete the previous listings index in Elasticsearch
Listing.__elasticsearch__.client.indices.delete index: Listing.index_name rescue nil

# Create the new index with the new mapping
Listing.__elasticsearch__.client.indices.create \
  index: Listing.index_name,
  body: { settings: Listing.settings.to_hash, mappings: Listing.mappings.to_hash }

# Index all listing records from the DB to Elasticsearch
Listing.import
