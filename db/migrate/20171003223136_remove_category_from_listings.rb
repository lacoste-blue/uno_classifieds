class RemoveCategoryFromListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :category
  end

end
