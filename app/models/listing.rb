require 'elasticsearch/model'
require 'set'

class Listing < ApplicationRecord
  belongs_to :category, :optional => false
  belongs_to :user, :optional => false
  has_many :pictures, :dependent => :destroy
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  scope :category_id, ->(category_id) { where(:category_id => category_id) }
  scope :user_id, ->(user_id) { where(:user_id => user_id) }
  scope :has_picture, -> { includes(:pictures).where.not(:pictures => { :id => nil }) }
  scope :search, ->(q) { where(:id => Listing.__elasticsearch__.search(q).map(&:_id)) }
  scope :tag, lambda { |tag|
    logger.debug "In listing model: About to do a fuzzy match - on tag: #{name}"
    where(:id => Tagging.where(:tag_id => Tag.find_by_fuzzy_name(tag).map(&:id)).map(&:listing_id))
  }

  validates :title, :presence => true

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(:name => name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(', ')
  end

  # def self.tag(name)
  #   listings = Set.new
  #   logger.debug "In listing model: About to do a fuzzy match - on tag: #{name}"
  #   Tag.find_by_fuzzy_name(name).each do |tag|
  #     listings.merge(tag.listings)
  #   end
  #   listings.to_a
  # end
end

# Delete the previous listings index in Elasticsearch
begin
  Listing.__elasticsearch__.client.indices.delete :index => Listing.index_name
rescue StandardError
  nil
end

# Create the new index with the new mapping
Listing.__elasticsearch__.client.indices.create \
  :index => Listing.index_name,
  :body => { :settings => Listing.settings.to_hash, :mappings => Listing.mappings.to_hash }

# Index all listing records from the DB to Elasticsearch
Listing.import

