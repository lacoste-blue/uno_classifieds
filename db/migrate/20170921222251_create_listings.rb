class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :category
      t.string :owner
      t.string :images
      t.string :tags
      t.string :location
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
