class RemoveColumnsFromCategorizations < ActiveRecord::Migration[5.0]
  def change
    remove_column :categorizations, :blogs_id, :integer
    remove_column :categorizations, :categories_id, :integer
  end
end
