class AddCategoryToListings < ActiveRecord::Migration[5.0]
  def change
    add_reference :listings, :category, foreign_key: true
  end
end
