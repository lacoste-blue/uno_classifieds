class DropSubCategoriesTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :sub_categories
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
