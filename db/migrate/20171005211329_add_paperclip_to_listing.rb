class AddPaperclipToListing < ActiveRecord::Migration[5.0]
  def change
    add_attachment :listings, :image
  end
end
