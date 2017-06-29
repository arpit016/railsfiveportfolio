class AddColumnsToCategorizations < ActiveRecord::Migration[5.0]
  def change
    add_reference :categorizations, :blog, foreign_key: true
    add_reference :categorizations, :category, foreign_key: true
  end
end
