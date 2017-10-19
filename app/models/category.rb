class Category < ApplicationRecord
  has_many :sub_categories, :dependent => :destroy
  has_many :listings, :dependent => :destroy
end
