class Tag < ApplicationRecord
  has_many :taggings
  has_many :listings, through: :taggings

  fuzzily_searchable :name
  Tag.bulk_update_fuzzy_name

end
