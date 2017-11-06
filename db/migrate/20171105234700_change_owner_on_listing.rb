class ChangeOwnerOnListing < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :owner
    add_column :listings, :user_id, :integer
  end
end
