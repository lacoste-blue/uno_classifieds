class Category < ApplicationRecord
  has_many :listings, :dependent => :destroy

  validates :name, :description, :presence => true
end
